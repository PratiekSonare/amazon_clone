import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
// import 'package:amazon_clone/features/home/screens/home_screen.dart';
import './common/widgets/bottom_bar.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amazon_clone/features/services/auth_service.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariable.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(),
    );
  }
}
