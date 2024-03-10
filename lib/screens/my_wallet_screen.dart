import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWalletScreen extends StatelessWidget {
  final TextEditingController walletIdController = TextEditingController();

  MyWalletScreen({Key? key}) : super(key: key);

  Future<void> connectToWallet(String walletId) async {
    final apiUrl = 'https://api.example.com/connect';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'walletId': walletId}),
      );

      if (response.statusCode == 200) {
        print('Bağlantı başarılı: ${response.body}');
        // Cüzdan bağlantısı başarılı, istediğiniz işlemleri burada gerçekleştirebilirsiniz.
        // Örneğin, başka bir sayfaya yönlendirme yapabilirsiniz.
      } else {
        print('Hata oluştu: ${response.statusCode}');
        // Hata durumunda kullanıcıya bir mesaj gösterebilirsiniz.
      }
    } catch (e) {
      print('Bağlantı hatası: $e');
      // Bağlantı hatası durumunda kullanıcıya bir mesaj gösterebilirsiniz.
    }
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
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '  MY WALLET',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(width: 5),
                    FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 200),
                Container(
                  width: 300,
                  height: 150,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 72, 37, 113),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 18, 5, 46),
                        spreadRadius: 5,
                        offset: Offset(12, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Enter Your Wallet ID',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: walletIdController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          icon: Icon(
                            Icons.wallet,
                            color: Colors.white,
                          ),
                          hintText: 'Your Wallet ID',
                          hintStyle: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    connectToWallet(walletIdController.text);
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(200, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
