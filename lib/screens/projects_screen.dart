import 'package:flutter/material.dart';
import 'package:soldea/screens/my_account.dart';
import 'create_project.dart';
import 'project_details.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final Color clr = const Color.fromARGB(255, 45, 12, 72);
  final Color clr2 = const Color.fromARGB(255, 30, 7, 51);
  final Color projectBackClr = const Color(0xFF3B065B);

  String selectedCategory = 'All';
  String selectedSortOption = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: clr2,
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      "               PROJECTS",
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      backgroundColor: clr2,
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
                  ],
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        buildDropdownButton(
                          'Categories',
                          ['All', 'Category 1', 'Category 2', 'Category 3'],
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
                          ['All', 'Option 1', 'Option 2', 'Option 3'],
                          selectedSortOption,
                          (String? newValue) {
                            setState(() {
                              selectedSortOption = newValue ?? 'All';
                            });
                          },
                        ),
                      ],
                    ),
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
              color: clr,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  // Diğer öğeler projeleri temsil eder
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 300.0,
                          constraints: const BoxConstraints(maxWidth: 600.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: projectBackClr,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150.0,
                                  height: 200.0,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "lib/assets/images/photo.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text("              "),
                                                Text(
                                                  'PROJECT ${index + 1}',
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 15),
                                            const Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.white60,
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
                                        const SizedBox(height: 10.0),
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
                                        const SizedBox(height: 20.0),
                                        Text(
                                          'Project Description ${index + 1} :',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt .",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5.0,
                          right: 5.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              print("view project");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProjectDetailsScreen(
                                    
                                  ),
                                ),
                              );
                            },
                            backgroundColor: clr2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: Column(
                                children: [
                                  Icon(Icons.visibility),
                                  Text(
                                    'View',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 50.0,
                          left: 25.0,
                          child: Row(
                            children: [
                              Icon(
                                Icons.wallet_giftcard,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '*** SOL',
                                // Eklemek istediğiniz metni buraya yazın
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '*** backers',
                                // Eklemek istediğiniz metni buraya yazın
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          bottom: 30.0,
                          right: 80.0,
                          child: Text(
                            '** days to go', // Eklemek istediğiniz metni buraya yazın
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CreateProjectScreen()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: clr2,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Colors.amber,
                  size: 35,
                ),
                onPressed: () {
                  // "Home" butonuna tıklanınca yapılacak işlemler
                  print('Home Button Tapped!');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.store,
                  color: Colors.amber,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProjectsScreen()));
                },
              ),
            ],
          ),
        ),
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
                style: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          value: selectedValue,
          iconEnabledColor: Colors.white,
          underline: Container(),
          style: TextStyle(
            color: Colors.white,
            backgroundColor: clr2,
          ),
        ),
      ],
    );
  }
}
