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
import 'package:rongcloud_im_kit/app_providers.dart'; // 引入Provider配置

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
      child: RongCloudAppProviders.of(
        MyApp(), // 你的根组件
        additionalProviders: [
          // 可以添加额外的Provider
          // ...
        ],
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch token provider to determine auth state
    final token = ref.watch(tokenProvider);
    final isLoggedIn = token != null && token.isNotEmpty;

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: Consumer<UserProvider>(
        builder: (context, provider, child) {
          // Sync Riverpod state with legacy UserProvider if needed
          // For now, we rely on the logic that when token is set, UserProvider is also updated in LoginScreen
          
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
            home: isLoggedIn
                ? const MainScreen()
                : const LoginScreen(),
          );
        },
      ),
    );
  }
}
