
import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final Color clr = const Color.fromARGB(255, 45, 12, 72);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr,
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kToolbarHeight),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
          //
          // Arkaplan
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/photo.png",
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.40), // Karanlık efekti
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
          // Orijinal resim
          Positioned.fill(
            child: Center(
              child: Image.asset(
                "lib/assets/images/photo.png",
                fit: BoxFit.cover,
                width: 350,
                height: 300,
              ),
            ),
          ),
          // Sayfa içeriği

          const Text(
            'Projenin Başlığı',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // Proje açıklaması
          const Text(
            'Proje açıklaması buraya gelmeli. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          // PageView ile bölümler
        ],
      ),
    );
  }
}
