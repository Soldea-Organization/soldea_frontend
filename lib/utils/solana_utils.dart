/* import 'package:flutter/material.dart';
import 'package:solana_wallet_provider/solana_wallet_provider.dart';

class SolanaUtils {
  late SolanaWalletProvider _solanaWalletProvider;

  SolanaUtils() {
    // Named parameter 'child' required hatasını çözmek için child parametresini ekleyin
    _solanaWalletProvider = SolanaWalletProvider(
      connection: ,
      child: Text("sknclnsc"), // yerine uygun bir Widget ekleyin
    );
  }

  Future<bool> connectToSolana() async {
    // 1 positional argument expected by 'connect' hatasını çözmek için uygun bir değeri gönderin
    bool isConnected = await _solanaWalletProvider.connect(yourArgument);
    return isConnected;
  }
}
 */