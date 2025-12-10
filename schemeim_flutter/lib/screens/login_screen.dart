import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rongcloud_im_kit/rongcloud_im_kit.dart';
import '../../constants.dart';
import '../../providers/user_provider.dart';
import '../../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

    await ApiService.auth.sendOtp(_phoneController.text);

    if (mounted) {
      setState(() {
        _loading = false;
        _step = 2;
      });
      _startTimer();
    }
    // Simulate API call
    // Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
    //   if (mounted) {
    //     setState(() {
    //       _loading = false;
    //       _step = 2;
    //     });
    //     _startTimer();
    //   }
    // });
  }

  Future<void> _handleVerify() async {
    if (_otpController.text.length != 4) return;
    setState(() => _loading = true);

    try {
      final provider = Provider.of<UserProvider>(context, listen: false);
      await provider.authenticate(_phoneController.text, _otpController.text);
      await _initIM(context);
    } catch (e) {
      print("Login failed: $e");
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _initIM(BuildContext context) async {
    // 在需要初始化的页面中获取Provider
    final engineProvider = Provider.of<RCKEngineProvider>(
      context,
      listen: false,
    );
    // 添加网络状态变化监听
    engineProvider.networkChangeNotifier.addListener(() {
      final status = engineProvider.networkChangeNotifier.value;
      if (status != null) {
        // 处理连接状态变化
        print("连接状态变化: $status");
      }
    });
    // 初始化并连接到融云服务器
    final options = RCIMIWEngineOptions.create();
    final engine = await engineProvider.engineCreate("25wehl3u2f7mw", options);

    await engineProvider.engineConnect(
      "Egm3GqRPlKChKr9rmAzUn92Vex2o7ROV@i6h3.cn.rongnav.com;i6h3.cn.rongcfg.com",
      100,
      onResult: (code) {
        if (code == 0) {
          //连接成功
          // 连接成功
          print("连接成功，用户ID: ${engineProvider.currentUserId}");
          // 可以在这里注册自定义消息类型
          engine?.registerNativeCustomMessage(
            'CustomMessageType',
            RCIMIWNativeCustomMessagePersistentFlag.persisted,
          );
          // 连接成功后完成登录跳转
          if (mounted) {
            Provider.of<UserProvider>(context, listen: false).completeLogin();
          }
        } else {
          //错误提示
          print("IM connect failed: $code");
          if (mounted) {
            setState(() => _loading = false);
          }
        }
      },
    );
  }

  void _handleResend() {
    if (_timer > 0) return;
    setState(() => _loading = true);
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _loading = false);
        _startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: SafeArea(
        child: Stack(
          children: [
            // Language Toggle
            Positioned(
              top: 20,
              right: provider.language == 'en' ? 20 : null,
              left: provider.language == 'ar' ? 20 : null,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () => provider.setLanguage(
                    provider.language == 'en' ? 'ar' : 'en',
                  ),
                  child: Text(
                    provider.language == 'en' ? 'العربية' : 'English',
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
                        provider.t('welcomeBack'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        provider.t('login'),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 40),

                      if (_step == 1)
                        _buildPhoneStep(provider)
                      else
                        _buildOtpStep(provider),
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
            style: const TextStyle(color: Color(0xFFAAAAAA), fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  value: _countryCode,
                  dropdownColor: AppTheme.surface,
                  underline: const SizedBox(),
                  style: const TextStyle(color: Colors.white),
                  items: const [
                    DropdownMenuItem(value: "+971", child: Text("🇦🇪 +971")),
                    DropdownMenuItem(value: "+966", child: Text("🇸🇦 +966")),
                    DropdownMenuItem(value: "+20", child: Text("🇪🇬 +20")),
                    DropdownMenuItem(value: "+1", child: Text("🇺🇸 +1")),
                  ],
                  onChanged: (v) => setState(() => _countryCode = v!),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: provider.t('phonePlaceholder'),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    onChanged: (v) => setState(() {}),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (_loading || _phoneController.text.length < 5)
                  ? null
                  : _handleSendOtp,
              style:
                  ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ).copyWith(
                    // backgroundColor: MaterialStateProperty.resolveWith((states) {
                    //   if (states.contains(MaterialState.disabled)) return Colors.grey.withOpacity(0.3);
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.grey.withOpacity(0.3);
                      }
                      return null; // Defer to background decoration
                    }),
                  ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: (_loading || _phoneController.text.length < 5)
                      ? null
                      : const LinearGradient(
                          colors: [Color(0xFF311B92), Color(0xFF673AB7)],
                        ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minHeight: 50),
                  child: Text(
                    _loading ? provider.t('loading') : provider.t('sendCode'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
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
            "${provider.t('enterCode')} ($_countryCode ${_phoneController.text})",
            style: const TextStyle(color: Color(0xFFAAAAAA), fontSize: 14),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 10,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "0000",
                hintStyle: TextStyle(color: Colors.grey, letterSpacing: 10),
                counterText: "",
              ),
              onChanged: (v) => setState(() {}),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: _timer > 0
                ? Text(
                    "${provider.t('resendIn')} ${_timer}s",
                    style: const TextStyle(color: Colors.grey),
                  )
                : TextButton(
                    onPressed: _handleResend,
                    child: Text(
                      provider.t('resend'),
                      style: const TextStyle(color: AppTheme.secondary),
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (_loading || _otpController.text.length != 4)
                  ? null
                  : _handleVerify,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: (_loading || _otpController.text.length != 4)
                      ? null
                      : const LinearGradient(
                          colors: [Color(0xFF311B92), Color(0xFF673AB7)],
                        ),
                  borderRadius: BorderRadius.circular(12),
                  color: (_loading || _otpController.text.length != 4)
                      ? Colors.grey.withOpacity(0.3)
                      : null,
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(minHeight: 50),
                  child: Text(
                    _loading ? provider.t('loading') : provider.t('verify'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  _step = 1;
                  _otpController.clear();
                });
              },
              child: Text(
                provider.t('back'),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
