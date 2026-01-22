import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Consumer;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/user_provider.dart';
import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'constants.dart';
import 'services/api_service.dart';
// import 'package:rongcloud_im_kit/app_providers.dart'; // 引入Provider配置

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Shared Preferences
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // Override sharedPreferencesProvider with the initialized instance
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      /*child: RongCloudAppProviders.of(
        MyApp(), // 你的根组件
        additionalProviders: [
          // 可以添加额外的Provider
          // ...
        ],
      ),*/
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _isInitializing = true;

  @override
  void initState() {
    super.initState();
    _initializeAutoLogin();
  }

  Future<void> _initializeAutoLogin() async {
    // Check if we have a valid token
    final token = ref.read(tokenProvider);
    if (token != null && token.isNotEmpty) {
      // Try to load user from storage first
      final storedUser = ref.read(userProvider);

      // If no stored user, fetch from API
      if (storedUser == null) {
        try {
          final userApi = ref.read(userApiProvider);
          final user = await userApi.getProfile();
          await ref.read(userProvider.notifier).setUser(user);
          print('Auto-login successful: Fetched user from API');
        } catch (e) {
          print('Failed to fetch user profile on auto-login: $e');
          // Clear invalid token
          await ref.read(tokenProvider.notifier).setToken(null);
        }
      } else {
        print('Auto-login successful: Loaded user from storage');
      }
    }

    if (mounted) {
      setState(() => _isInitializing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch token and user providers to determine auth state
    final token = ref.watch(tokenProvider);
    final user = ref.watch(userProvider);
    final isLoggedIn = token != null && token.isNotEmpty && user != null;

    // Show loading screen during initialization
    if (_isInitializing) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppTheme.bg,
          body: Center(
            child: CircularProgressIndicator(color: AppTheme.primary),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: legacyUserProvider)],
      child: Consumer<UserProvider>(
        builder: (context, provider, child) {
          // Sync Riverpod user state with legacy UserProvider if logged in
          if (isLoggedIn) {
            // user is guaranteed to be non-null here because isLoggedIn checks it
            provider.updateUser(user);
            if (!provider.isLoggedIn) {
              provider.completeLogin();
            }
          }

          return MaterialApp(
            title: 'SchemeIM',
            debugShowCheckedModeBanner: false,
            locale: Locale(provider.language),
            supportedLocales: const [Locale('en', ''), Locale('ar', '')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              primaryColor: AppTheme.primary,
              scaffoldBackgroundColor: AppTheme.bg,
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppTheme.primary,
                background: AppTheme.bg,
                brightness: Brightness.dark,
              ),
              fontFamily: provider.language == 'ar' ? 'Cairo' : 'Roboto',
            ),
            home: isLoggedIn ? const MainScreen() : const LoginScreen(),
          );
        },
      ),
    );
  }
}
