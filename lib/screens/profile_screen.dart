import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xFF1E88E5),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Murad khan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'csitmurad@email.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '+92 345 678 901',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Edit profile
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Account Info
            _buildSectionTitle('Account Information'),
            _buildProfileItem(
              icon: Icons.person_outline,
              title: 'Full Name',
              value: 'Murad khan',
            ),
            _buildProfileItem(
              icon: Icons.email_outlined,
              title: 'Email',
              value: 'murad.khan@email.com',
            ),
            _buildProfileItem(
              icon: Icons.phone_outlined,
              title: 'Phone',
              value: '+92 345 678 901',
            ),
            _buildProfileItem(
              icon: Icons.location_on_outlined,
              title: 'Address',
              value: 'Chemical house Gulberg Lahore, pakistan',
            ),
            const SizedBox(height: 20),
            // Bank Details
            _buildSectionTitle('Bank Details'),
            _buildProfileItem(
              icon: Icons.account_balance,
              title: 'Account Number',
              value: '**** **** **** 4521',
            ),
            _buildProfileItem(
              icon: Icons.credit_card,
              title: 'Card Type',
              value: 'Debit Card',
            ),
            _buildProfileItem(
              icon: Icons.calendar_today,
              title: 'Joined Date',
              value: 'January 15, 2024',
            ),
            const SizedBox(height: 20),
            // Settings
            _buildSectionTitle('Settings'),
            _buildSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.fingerprint,
              title: 'Biometric Login',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.language,
              title: 'Language',
              subtitle: 'English',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            // Support
            _buildSectionTitle('Support'),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: 'Help Center',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.chat_bubble_outline,
              title: 'Chat with Us',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.description_outlined,
              title: 'Terms & Conditions',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              onTap: () {},
            ),
            const SizedBox(height: 30),
            // Logout Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text('Logout'),
                      content: const Text(
                          'Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // App Version
            Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E88E5),
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF1E88E5).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF1E88E5),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.white,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF1E88E5).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1E88E5),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              )
            : null,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}