import 'package:flutter/material.dart';
import 'package:solidea/screens/create_project.dart';
import 'package:solidea/screens/my_wallet_screen.dart';
import 'login_screen.dart';

class MyAccountScreen extends StatelessWidget {
  final Color startColor = const Color.fromRGBO(17, 2, 26, 1);
  final Color middleColor = const Color.fromARGB(255, 42, 16, 60);
  final Color endColor = const Color.fromARGB(255, 150, 21, 230);

  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, middleColor, endColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  const Text(
                    'MY ACCOUNT',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ), // İstediğiniz boşluk miktarını ayarlayabilirsiniz
              buildLinkRow(
                context,
                Icons.email,
                'Email',
                'useremail@gmail.com',
                () {
                  // Email linkine tıklanınca yapılacak işlemler
                },
              ),
              buildLinkRow(
                context,
                Icons.lock,
                'Password',
                '**************',
                () {
                  // Password linkine tıklanınca yapılacak işlemler
                },
              ),
              buildLinkRow(
                context,
                Icons.settings,
                'Settings',
                '',
                () {
                  // Settings linkine tıklanınca yapılacak işlemler
                },
              ),
              buildLinkRow(
                context,
                Icons.favorite,
                'Favorite Projects',
                '',
                () {
                  // Favorites Projects linkine tıklanınca yapılacak işlemler
                },
              ),
              buildLinkRow(
                context,
                Icons.business,
                'My Projects',
                '',
                () {
                  // My Projects linkine tıklanınca yapılacak işlemler
                },
              ),
              buildLinkRow(
                context,
                Icons.backup,
                'My Backings',
                '',
                () {
                  // My Backings linkine tıklanınca yapılacak işlemler
                },
              ),
              buildLinkRow(
                context,
                Icons.wallet,
                'My Wallet',
                '',
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyWalletScreen()));
                },
              ),
              buildLinkRow(
                context,
                Icons.add,
                'Create New Project',
                '',
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateProjectScreen()));
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  buildActionLink(
                    context,
                    Icons.vpn_key,
                    'Change Password',
                    () {
                      // Change Password linkine tıklanınca yapılacak işlemler
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  buildActionLink(
                    context,
                    Icons.delete,
                    'Delete Account',
                    () {
                      // Delete Account linkine tıklanınca yapılacak işlemler
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      width: 3,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                child: const Text(
                  'LOG OUT',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLinkRow(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onPressed,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 3,
        ),
        Expanded(
          child: buildLink(context, title, subtitle, onPressed),
        ),
      ],
    );
  }

  Widget buildLink(
    BuildContext context,
    String title,
    String subtitle,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                decoration: TextDecoration.underline,
              ),
            ),
            if (subtitle.isNotEmpty)
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white54),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildActionLink(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 18.0,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
