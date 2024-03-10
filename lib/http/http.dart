import 'package:http/http.dart' as http;

Future<void> connectToWallet(String walletId) async {
  final apiUrl =
      'https://api.example.com/connect'; // Phantom Wallet API endpoint'i

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'walletId': walletId},
    );

    if (response.statusCode == 200) {
      // Cüzdan bağlantısı başarılı, gelen yanıtı işle
      print('Bağlantı başarılı: ${response.body}');
    } else {
      // Hata durumunda
      print('Hata oluştu: ${response.statusCode}');
    }
  } catch (e) {
    print('Bağlantı hatası: $e');
  }
}
