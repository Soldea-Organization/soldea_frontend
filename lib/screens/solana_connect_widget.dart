/* import 'package:flutter/material.dart';
import '../utils/solana_utils.dart';


class SolanaConnectWidget extends StatelessWidget {
  final SolanaUtils _solanaUtils = SolanaUtils();

  SolanaConnectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          bool isConnected = await _solanaUtils.connectToSolana();

          if (isConnected) {
            print('Solana\'ya başarıyla bağlandınız!');
          } else {
            print('Solana bağlantısı başarısız!');
          }
        },
        child: const Text('Connect to Solana Wallet'),
      ),
    );
  }
}
 */