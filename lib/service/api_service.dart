import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'http://localhost:3000'; // Sunucu adresini buraya yazın

  Future<Map<String, dynamic>> connectWallet(String walletId) async {
    final url = '$baseUrl/connect';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: {'walletId': walletId},
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Cüzdan bağlantısı başarılı',
          'data': response.body
        };
      } else {
        return {
          'success': false,
          'message': 'Bağlantı hatası: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Bağlantı hatası: $e'};
    }
  }
}
