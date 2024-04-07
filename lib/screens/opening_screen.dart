import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  void initState() {
    super.initState();
    // Timer ile belirli bir süre sonra login ekranına geçiş yapılacak
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(17, 2, 26, 1),
              Color.fromARGB(255, 42, 16, 60),
              Color.fromARGB(255, 150, 21, 230),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo eklenen kısım
              Container(
                width: 100, // Logonun genişliğini ayarlayabilirsiniz
                height: 100, // Logonun yüksekliğini ayarlayabilirsiniz
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/images/logo.jpg'), // Logo dosyanızın yolu
                    fit: BoxFit
                        .cover, // İsteğe bağlı olarak fit'i ayarlayabilirsiniz
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              // İsteğe bağlı olarak açılış ekranınızı zenginleştirebilirsiniz
              const Text(
                'SOLDEA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
