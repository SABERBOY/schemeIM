import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../models/user.dart';
import '../../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  UserRank _getRank(int gold) {
    if (gold < 100) return UserRank(rankName: 'Bronze', colorHex: '#CD7F32');
    if (gold < 500) return UserRank(rankName: 'Silver', colorHex: '#C0C0C0');
    if (gold < 2000) return UserRank(rankName: 'Gold', colorHex: '#FFD700');
    return UserRank(rankName: 'Platinum', colorHex: '#E5E4E2');
  }

  Color _hexToColor(String hex) {
    return Color(int.parse(hex.replaceFirst('#', '0xFF')));
  }

  void _randomizeAvatar(UserProvider provider, User user) {
    // Use UI Avatars for simplicity
    final random = Random().nextInt(10000);
    final newAvatar = "https://api.dicebear.com/7.x/avataaars/png?seed=$random";
    provider.updateUser(user.copyWith(avatarUrl: newAvatar));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    final user = provider.currentUser;

    if (!_isEditing) _nameController.text = user.displayName;

    final rank = user.rank ?? _getRank(user.goldBalance);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildProfileHeader(user, provider),
              const SizedBox(height: 30),
              _buildStats(user, rank, provider),
              const SizedBox(height: 20),
              _buildFrameShop(user, provider),
              const SizedBox(height: 20),
              _buildSettings(user, provider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(User user, UserProvider provider) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.secondary, width: 3),
                  image: DecorationImage(
                    image: NetworkImage(user.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (user.frameUrl != null && user.frameUrl!.isNotEmpty)
                Positioned(
                  top: -10,
                  left: -10,
                  right: -10,
                  bottom: -10,
                  child: Image.network(user.frameUrl!, fit: BoxFit.fill),
                ),
              if (_isEditing)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => _randomizeAvatar(provider, user),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Text("🎲", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        if (_isEditing)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  provider.updateUser(
                    user.copyWith(displayName: _nameController.text),
                  );
                  setState(() => _isEditing = false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.success,
                ),
                child: Text(
                  provider.t('save'),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        else
          Column(
            children: [
              Text(
                user.displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${provider.t('id')}: ${user.id}",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => setState(() => _isEditing = true),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  provider.t('editProfile'),
                  style: const TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildStats(User user, UserRank rank, UserProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(
          "${user.goldBalance}",
          provider.t('gold'),
          AppTheme.secondary,
        ),
        _buildStatItem(rank.rankName, "Rank", _hexToColor(rank.colorHex)),
        _buildStatItem("128", "Followers", Colors.white),
        _buildStatItem("45", "Following", Colors.white),
      ],
    );
  }

  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildFrameShop(User user, UserProvider provider) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Avatar Frames",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: AVATAR_FRAMES.length,
              separatorBuilder: (_, __) => const SizedBox(width: 15),
              itemBuilder: (context, index) {
                final frame = AVATAR_FRAMES[index];
                final isSelected = user.frameUrl == frame.image;
                return GestureDetector(
                  onTap: () =>
                      provider.updateUser(user.copyWith(frameUrl: frame.image)),
                  child: Opacity(
                    opacity: isSelected ? 1.0 : 0.6,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              if (frame.image.isNotEmpty)
                                Positioned(
                                  top: -6,
                                  left: -6,
                                  right: -6,
                                  bottom: -6,
                                  child: Image.network(
                                    frame.image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              if (isSelected)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                      color: AppTheme.success,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0xFF1E1E1E),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          frame.name,
                          style: TextStyle(
                            color: isSelected
                                ? AppTheme.secondary
                                : Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettings(User user, UserProvider provider) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            provider.t('settings'),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Show Followers Publicly",
                style: TextStyle(color: Colors.white),
              ),
              Switch(
                value: user.privacy.showSocialList,
                onChanged: (val) {
                  provider.updateUser(
                    user.copyWith(
                      privacy: UserPrivacy(
                        showSocialList: val,
                        showOnlineStatus: user.privacy.showOnlineStatus,
                      ),
                    ),
                  );
                },
                activeThumbColor: AppTheme.success,
              ),
            ],
          ),
          const Divider(color: Color(0xFF333333)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider.t('language'),
                  style: const TextStyle(color: Colors.white),
                ),
                const Text("English >", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
