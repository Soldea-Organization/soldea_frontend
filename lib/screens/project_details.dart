import 'package:flutter/material.dart';
import 'package:solidea/screens/my_account.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final Color startColor = const Color.fromRGBO(17, 2, 26, 1);
  final Color middleColor = const Color.fromARGB(255, 42, 16, 60);
  final Color endColor = const Color.fromARGB(255, 150, 21, 230);

  String selectedOption = 'Details'; // Başlangıçta seçili olan seçenek
  Map<String, String> optionContent = {
    'Story': 'Story text will be located here.',
    'Details': 'Details will be located here',
    'Risks': 'Risks will be located here',
    'Backers': 'Backers will be located here',
    'F&Q': 'F&Q will be located here',
    'Comments': 'Comments will be located here.',
    'Who are we?': 'Who are we? will be located here.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [startColor, middleColor, endColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "              PROJECT",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 60),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyAccountScreen()));
                      },
                      icon: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Filtreler arasındaki boşluk
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFilterOption('Story'),
                    _buildFilterOption('Details'),
                    _buildFilterOption('Backers'),
                    _buildFilterOption('Risks'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFilterOption('F&Q'),
                    _buildFilterOption('Comments'),
                    _buildFilterOption('Who are we?'),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "lib/assets/images/photo.png",
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.6),
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Image.asset(
                        "lib/assets/images/photo.png",
                        width: 500,
                        height: 230,
                      ),
                      Center(
                        child: Text(
                          optionContent[selectedOption] ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Butona tıklandığında yapılacak işlemler
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber, // Buton rengi
                            ),
                            child: const Text('Back This Project',style: TextStyle(color: Colors.black),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: selectedOption == option ? Colors.amber : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          option,
          style: TextStyle(
            color: selectedOption == option ? Colors.black : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
