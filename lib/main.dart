import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'ui/screens/directory_screen.dart';
import 'ui/design_system.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const UserDirectoryApp());
}

class UserDirectoryApp extends StatelessWidget {
  const UserDirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Directory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: DesignTokens.surface,
        appBarTheme: const AppBarTheme(
          backgroundColor: DesignTokens.surface,
          foregroundColor: DesignTokens.onSurface,
          elevation: 2,
        ),
      ),
      home: const DirectoryScreen(),
    );
  }
}
