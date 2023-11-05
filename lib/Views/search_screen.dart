import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff386a20), useMaterial3: true),
      title: 'Search App',
      home: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  List<Person> selectedPersons = [];
  List<Person> allPersons = [
    // Person(
    //     name: "Chestnut-headed Bee-eater",
    //     image: "assets/Persons/Person-1.jpg"),
    // Person(name: "Eurasian Hoopoe", image: "assets/Persons/Person-2.jpg"),
    // Person(name: "Changeable Hawk-eagle", image: "assets/Persons/Person-3.jpg"),
    // Person(name: "Brahminy Starling", image: "assets/Persons/Person-4.jpg"),
    // Person(name: "Blue-tailed Bee-eater", image: "assets/Persons/Person-5.jpg"),
    // Person(name: "Indian Peafowl", image: "assets/Persons/Person-6.jpg"),
    // Person(name: "Common Kingfisher", image: "assets/Persons/Person-7.jpg"),
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(searchListener);
  }

  @override
  void dispose() {
    controller.removeListener(searchListener);
    controller.dispose();
    super.dispose();
  }

  void searchListener() {
    search(controller.text);
  }

  void search(String query)async {

    final response = await http.post(
        Uri.parse('http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/friend/search'),
        headers: {'Accept': 'application/json'},
        body: {
          'search': query,
        },
      );

      //if user successfully registers in
      if (response.statusCode == 200) {
        
      } else if (response.statusCode == 422) {
        
      }
    // if (query.isEmpty) {
    //   setState(() {
    //     selectedPersons = allPersons;
    //   });
    // } else {
    //   setState(() {
    //     selectedPersons = allPersons
    //         .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
    //         .toList();
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchBar(
              hintText: "Search",
              controller: controller,
              onChanged: (value) => search(value),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.search),
              trailing: const [Icon(Icons.mic)],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: selectedPersons.isEmpty
                        ? allPersons.length
                        : selectedPersons.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Person item = selectedPersons.isEmpty
                          ? allPersons[index]
                          : selectedPersons[index];

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    image: DecorationImage(
                                      image: AssetImage(item.image),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class SearchBarDemo extends StatelessWidget {
  SearchBarDemo({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchBar(
              hintText: "Search",
              controller: controller,
              surfaceTintColor:
                  const MaterialStatePropertyAll<Color>(Color(0xff0000d4)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.menu),
              trailing: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar3.jpg"),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SearchBar(
              hintText: "Search",
              controller: controller,
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.only(left: 15)),
              leading: const Icon(Icons.search),
              trailing: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SearchBar(
              hintText: "Search",
              controller: controller,
              surfaceTintColor:
                  const MaterialStatePropertyAll<Color>(Color(0xff2b3fc9)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.only(left: 15)),
              leading: const Icon(Icons.menu),
              trailing: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SearchBar(
              hintText: "Search",
              controller: controller,
              surfaceTintColor:
                  const MaterialStatePropertyAll<Color>(Color(0xffe94824)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 15)),
              leading: const Icon(Icons.search),
              trailing: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar3.jpg"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Person {
  final String name;
  final String image;

  Person({required this.name, required this.image});
}
