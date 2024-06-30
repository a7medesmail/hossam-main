import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: _buildProfileContent(),
    );
  }

  Widget _buildProfileContent() {
    return ListView(
      children: <Widget>[
        const UserAccountsDrawerHeader(
          accountName: Text('Ammar'),
          accountEmail: Text('Ammar@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/photo.jpg'),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Account'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () {},
        ),
      ],
    );
  }
}
