import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../services/api_service.dart';
import '../design_system.dart';

class DirectoryScreen extends StatefulWidget {
  const DirectoryScreen({super.key});

  @override
  State<DirectoryScreen> createState() => _DirectoryScreenState();
}

class _DirectoryScreenState extends State<DirectoryScreen> {
  late Future<List<UserModel>> _usersFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    setState(() {
      _usersFuture = _apiService.fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.surface,
      appBar: AppBar(
        title: const Text('Directory', style: DesignTokens.headlineMd),
        backgroundColor: DesignTokens.surface,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: DesignTokens.primary),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(DesignTokens.lg),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wifi_off,
                      size: 64,
                      color: DesignTokens.error,
                    ),
                    const SizedBox(height: DesignTokens.md),
                    Text(
                      'Connection Error',
                      style: DesignTokens.headlineMd.copyWith(
                        color: DesignTokens.error,
                      ),
                    ),
                    const SizedBox(height: DesignTokens.sm),
                    Text(
                      'Failed to load user directory.',
                      style: DesignTokens.bodyMd,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: DesignTokens.lg),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DesignTokens.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            DesignTokens.borderRadius,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignTokens.lg,
                          vertical: DesignTokens.md,
                        ),
                      ),
                      onPressed: _fetchData,
                      child: const Text('Retry', style: DesignTokens.labelMd),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(DesignTokens.marginMobile),
              itemCount: users.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: DesignTokens.md),
              itemBuilder: (context, index) {
                final user = users[index];
                return UserCard(user: user);
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignTokens.marginMobile),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(user.avatar),
            backgroundColor: DesignTokens.cardColor,
          ),
          const SizedBox(width: DesignTokens.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: DesignTokens.headlineMd,
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: DesignTokens.bodyLg.copyWith(
                    color: DesignTokens.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: DesignTokens.onSurfaceVariant),
        ],
      ),
    );
  }
}
