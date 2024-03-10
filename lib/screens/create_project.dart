import 'package:flutter/material.dart';
import 'package:soldea/screens/my_account.dart';

class CreateProjectScreen extends StatelessWidget {
  final Color startColor = const Color.fromRGBO(17, 2, 26, 1);
  final Color middleColor = const Color.fromARGB(255, 42, 16, 60);
  final Color endColor = const Color.fromARGB(255, 150, 21, 230);

  const CreateProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      backgroundColor: startColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    const Text(
                      "CREATE PROJECT",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: FloatingActionButton(
                        backgroundColor: startColor,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyAccountScreen()));
                        },
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/exmpl.PNG"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Project Name:',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Description:',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // Burada butona basıldığında yapılacak işlemleri ekleyebilirsiniz.
                    showSuccessSnackBar(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: startColor,
                    minimumSize: const Size(200, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Create Project',
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSuccessSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Your request to create a project has been received'),
      backgroundColor: Colors
          .green, // isteğe bağlı: snackbar'ın arka plan rengini değiştirebilirsiniz
    );

    // ScaffoldMessenger kullanarak SnackBar'ı göster
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
