import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Views/person.dart';

class search_result extends StatefulWidget {
  const search_result({super.key});

  @override
  State<search_result> createState() => _search_resultState();
}

class _search_resultState extends State<search_result> {
  List<person> selectedpersons = [];
  List<person> allpersons = [
    person(name: "Chestnut-headed Bee-eater", image: "assets/persons/person-1.jpg"),
    person(name: "Eurasian Hoopoe", image: "assets/persons/person-2.jpg"),
    person(name: "Changeable Hawk-eagle", image: "assets/persons/person-3.jpg"),
    person(name: "Brahminy Starling", image: "assets/persons/person-4.jpg"),
    person(name: "Blue-tailed Bee-eater", image: "assets/persons/person-5.jpg"),
    person(name: "Indian Peafowl", image: "assets/persons/person-6.jpg"),
    person(name: "Common Kingfisher", image: "assets/persons/person-7.jpg"),
  ];
  @override

  Widget build(BuildContext context) {
    return const Placeholder(

    );
  }
}