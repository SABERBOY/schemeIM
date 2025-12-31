import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as legacy_provider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rongcloud_im_kit/rongcloud_im_kit.dart';
import '../../constants.dart';
import '../../providers/user_provider.dart';
import '../../services/api_service.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  int _step = 1; // 1: Phone, 2: OTP
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _loading = false;
  int _timer = 0;
  String _countryCode = '+971';
  Timer? _timerInstance;

  @override
  void dispose() {
    _timerInstance?.cancel();
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() => _timer = 60);
    _timerInstance?.cancel();
    _timerInstance = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timer > 0) {
        setState(() => _timer--);
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _handleSendOtp() async {
    if (_phoneController.text.length < 5) return;
    setState(() => _loading = true);

    try {
      final authApi = ref.read(authApiProvider);
      await authApi.sendOtp(_phoneController.text);

      if (mounted) {
        setState(() {
          _loading = false;
          _step = 2;
        });
        _startTimer();
      }
    } catch (e) {
      print("Send OTP failed: $e");
      if (mounted) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to send OTP: $e')));
      }
    }
  }

  Future<void> _handleVerify() async {
    if (_otpController.text.length != 6) return;
    setState(() => _loading = true);

    try {
      final authApi = ref.read(authApiProvider);
      final loginResponse = await authApi.login(
        _phoneController.text,
        _otpController.text,
      );
      final user = loginResponse.user;
      final token = loginResponse.token;

      // 1. Update Riverpod Token
      ref.read(tokenProvider.notifier).setToken(token);

      // 2. Update Legacy UserProvider
      if (mounted) {
        final legacyUserProvider = legacy_provider.Provider.of<UserProvider>(
          context,
          listen: false,
        );
        legacyUserProvider.updateUser(user);
      }

      // 3. Init IM
      await _initIM(context, user.id);
    } catch (e) {
      print("Login failed: $e");
      if (mounted) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
      }
    }
  }

  Future<void> _initIM(BuildContext context, String userId) async {
    // Access Legacy RCKEngineProvider
    final engineProvider = legacy_provider.Provider.of<RCKEngineProvider>(
      context,
      listen: false,
    );

    // Listen for network changes
    engineProvider.networkChangeNotifier.addListener(() {
      final status = engineProvider.networkChangeNotifier.value;
      if (status != null) {
        print("Network status change: $status");
      }
    });

    try {
      final options = RCIMIWEngineOptions.create();
      final engine = await engineProvider.engineCreate(
        "25wehl3u2f7mw",
        options,
      );

      await engineProvider.engineConnect(
        "Egm3GqRPlKChKr9rmAzUn92Vex2o7ROV@i6h3.cn.rongnav.com;i6h3.cn.rongcfg.com",
        100,
        onResult: (code) {
          if (code == 0) {
            print("IM Connected, UserID: ${engineProvider.currentUserId}");
            engine?.registerNativeCustomMessage(
              'CustomMessageType',
              RCIMIWNativeCustomMessagePersistentFlag.persisted,
            );

            if (mounted) {
              legacy_provider.Provider.of<UserProvider>(
                context,
                listen: false,
              ).completeLogin();
            }
          } else {
            print("IM connect failed: $code");
            if (mounted) {
              setState(() => _loading = false);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('IM Connection Failed: $code')),
              );
            }
          }
        },
      );
    } catch (e) {
      print("IM Init Error: $e");
      if (mounted) setState(() => _loading = false);
    }
  }

  void _handleResend() {
    if (_timer > 0) return;
    _handleSendOtp();
  }

  @override
  Widget build(BuildContext context) {
    // Access legacy provider for UI text/theme
    final userProvider = legacy_provider.Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: SafeArea(
        child: Stack(
          children: [
            // Language Toggle
            Positioned(
              top: 20,
              right: userProvider.language == 'en' ? 20 : null,
              left: userProvider.language == 'ar' ? 20 : null,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () => userProvider.setLanguage(
                    userProvider.language == 'en' ? 'ar' : 'en',
                  ),
                  child: Text(
                    userProvider.language == 'en' ? 'العربية' : 'English',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF311B92), Color(0xFFE91E63)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFE91E63).withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.smartphone,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        userProvider.t('welcomeBack'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        userProvider.t('login'),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 40),

                      if (_step == 1)
                        _buildPhoneStep(userProvider)
                      else
                        _buildOtpStep(userProvider),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneStep(UserProvider provider) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            provider.t('enterPhone'),
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _countryCode,
                    dropdownColor: const Color(0xFF2C2C2C),
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white70,
                    ),
                    items: ['+971', '+966', '+20', '+1']
                        .map(
                          (code) =>
                              DropdownMenuItem(value: code, child: Text(code)),
                        )
                        .toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => _countryCode = val);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Container(width: 1, height: 24, color: Colors.white24),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: provider.t('phonePlaceholder'),
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _loading ? null : _handleSendOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(provider.t('sendCode')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpStep(UserProvider provider) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            provider.t('enterCode'),
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _otpController,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 10,
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _loading ? null : _handleVerify,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(provider.t('verify')),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: _timer > 0
                ? Text(
                    '${provider.t('resendIn')} $_timer s',
                    style: TextStyle(color: Colors.white.withOpacity(0.5)),
                  )
                : TextButton(
                    onPressed: _handleResend,
                    child: Text(
                      provider.t('resend'),
                      style: const TextStyle(color: AppTheme.secondary),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
