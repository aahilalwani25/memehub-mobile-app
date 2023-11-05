import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:memehub_mobile_app/Views/profile_screen.dart';

import '../Models/user.dart';

// class Searchscreen extends StatelessWidget {
  
//   Searchscreen({required this.id, super.key});
//   int id;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           colorSchemeSeed: const Color(0xff386a20), useMaterial3: true),
//       title: 'Search App',
//       home: const SearchScreen(),
//     );
//   }
// }

class SearchScreen extends StatefulWidget {
  int id;
  SearchScreen({required this.id,Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  List<Person> selectedPersons = [];
  List<Person> allPersons = [];

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

  void search(String query) async {
    if (query.isNotEmpty) {
      final response = await http.post(
        Uri.parse(
            'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/friend/search'),
        headers: {'Accept': 'application/json'},
        body: {
          'search': query,
        },
      );

      //if user successfully registers in
      if (response.statusCode == 200) {
        setState(() {
          selectedPersons = [];
        });
        final body = jsonDecode(response.body);
        // print(body['message']);
        for (var person in body["message"]) {
          print(person["username"]);
          setState(() {
            selectedPersons.add(Person(
                name: person['username'].toString(),
                image: "",
                prof_id_fk: person["user_id_fk"],
                city_id_fk: person["city_id_fk"]));
          });
        }
      } else if (response.statusCode == 422) {}
    }
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
                    itemCount:
                        selectedPersons.isEmpty ? 0 : selectedPersons.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Person? item = selectedPersons.isEmpty
                          ? null
                          : selectedPersons[index];

                      return (item != null)
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => ProfileScreen(
                                          my_profile_id_fk: widget.id,
                                            my_homie_id_fk: item.prof_id_fk!,
                                            name: item.name)));
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        item.name, // This line might cause the error
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }))
          ],
        ),
      ),
    );
  }
}
