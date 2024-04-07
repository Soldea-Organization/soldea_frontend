
import 'package:flutter/material.dart';
import 'package:solidea/screens/my_account.dart';
import 'package:solidea/screens/project_details.dart'; // ProjectDetailsScreen import edildi

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final Color startColor = const Color.fromRGBO(17, 2, 26, 1);
  final Color middleColor = const Color.fromARGB(255, 42, 16, 60);
  final Color endColor = const Color.fromARGB(255, 66, 5, 104);
  final Color projectBackClr = const Color.fromARGB(255, 150, 21, 230);
  final Color cardColor = const Color.fromARGB(255, 52, 20, 74); // Card rengi

  String selectedCategory = 'All';
  String selectedSortOption = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: startColor,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.25),
              const Text("PROJECTS",
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [startColor, middleColor, endColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        buildDropdownButton(
                          'Categories',
                          [
                            'All',
                            'Infrastructure',
                            'DAO',
                            'Dev Tool',
                            'DeFi',
                            'AI'
                          ],
                          selectedCategory,
                          (String? newValue) {
                            setState(() {
                              selectedCategory = newValue ?? 'All';
                            });
                          },
                        ),
                        const SizedBox(width: 10.0),
                        buildDropdownButton(
                          'Sorted by',
                          ['All', 'Popular', 'Option 2', 'Option 3'],
                          selectedSortOption,
                          (String? newValue) {
                            setState(() {
                              selectedSortOption = newValue ?? 'All';
                            });
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Text(
                      'Explore *** projects',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: endColor,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  // Diğer öğeler projeleri temsil eder
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        // Kart tıklandığında ProjectDetailsScreen'e git
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProjectDetailsScreen()));
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 160.0,
                            constraints: const BoxConstraints(maxWidth: 600.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: middleColor, // Card rengini değiştirme
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "lib/assets/images/photo.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(23.0),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    ' PROJECT ${index + 1}',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  const Icon(
                                                    Icons.favorite,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.business,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                '  Entrepreneur Name ${index + 1}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color: Colors.white60,
                                                size: 15,
                                              ),
                                              Text(
                                                "  Nov 22 , 2024 - 6pm",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownButton(
    String title,
    List<String> options,
    String selectedValue,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 6.0),
        DropdownButton<String>(
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: const TextStyle(color: Colors.amber),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          value: selectedValue,
          iconEnabledColor: Colors.white,
          underline: Container(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
