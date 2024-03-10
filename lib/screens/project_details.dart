/* import 'package:flutter/material.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final int projectIndex;

  const ProjectDetailsScreen({Key? key, required this.projectIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProjectDetailsPageView(projectIndex: projectIndex),
    );
  }
}

class ProjectDetailsPageView extends StatefulWidget {
  final int projectIndex;

  const ProjectDetailsPageView({Key? key, required this.projectIndex})
      : super(key: key);

  @override
  _ProjectDetailsPageViewState createState() =>
      _ProjectDetailsPageViewState(projectIndex);
}

class _ProjectDetailsPageViewState extends State<ProjectDetailsPageView> {
  final int projectIndex;
  late PageController _pageController;
  final List<String> sections = [
    'Story',
    'Details',
    'Risks',
    'F&Q',
    'Comments',
    'Who Are We?',
  ];
  int selectedPageIndex = 0;

  _ProjectDetailsPageViewState(this.projectIndex);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 45, 12, 72),
      child: Column(
        children: [
          Container(
            height: 100,
            color: const Color.fromARGB(255, 45, 12, 72),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sections.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      selectedPageIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Text(
                      sections[index],
                      style: TextStyle(
                        color: selectedPageIndex == index
                            ? Colors
                                .amber // Seçili sayfa altını çizildiğinde kullanılacak renk
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: selectedPageIndex == index
                            ? TextDecoration
                                .underline // Seçili sayfa altını çizer
                            : TextDecoration
                                .none, // Diğer sayfalarda altını çizmez
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPageIndex = index;
                });
              },
              children: sections.map((section) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      section,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
 */

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
