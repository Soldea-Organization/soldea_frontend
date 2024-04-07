import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solidea/screens/projects_screen.dart';

class VerificationScreen extends StatelessWidget {
  final Color startColor = const Color.fromRGBO(17, 2, 26, 1);
  final Color middleColor = const Color.fromARGB(255, 42, 16, 60);
  final Color endColor = const Color.fromARGB(255, 150, 21, 230);
  final String tryagain = "Try Again!";
  final Color tryagainColor = const Color(0xFFFFC121);

  const VerificationScreen({super.key});

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Verify Code",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Please check your email.",
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
                const SizedBox(height: 6.0),
                const Text(
                  "We just sent a verification code on your email!",
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                    hintText: "- - - -",
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the verification code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't get a code? ",
                      style: TextStyle(color: Colors.white60),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Buraya "Try Again!" metninin tıklanma durumu için bir işlem ekleyebilirsiniz.
                        print("Try Again! Clicked");
                      },
                      child: const Text(
                        "Try Again!",
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            width: 2,
                            color: Colors.white,
                          )),
                      backgroundColor: Colors.transparent,
                      minimumSize: const Size(300, 55)),
                  onPressed: () {
                    print("Verification successful");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProjectsScreen(), // ListScreen yerine geçmesini istediğiniz sayfanın adını yazın
                      ),
                    );
                  },
                  child: const Text(
                    "VERIFY",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
