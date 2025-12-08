import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'providers/user_provider.dart';
import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'SchemeIM',
            debugShowCheckedModeBanner: false,
            locale: Locale(provider.language),
            supportedLocales: const [
              Locale('en', ''),
              Locale('ar', ''),
            ],
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
            home: provider.isLoggedIn ? const MainScreen() : const LoginScreen(),
          );
        },
      ),
    );
  }
}
