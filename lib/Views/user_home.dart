import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Views/profile_screen.dart';

class Home extends StatelessWidget {
  String name;
  int id;
  Home({super.key, required this.id, required this.name});

  @override
   Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar:CupertinoTabBar(
        activeColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ]),

        tabBuilder: (context, index)  {
          switch (index){
            case 0:
            return CupertinoTabView(
              builder: (context){
                return const CupertinoPageScaffold(child:homescreen());
              },
            );
            case 1:
            return CupertinoTabView(
              builder: (context){
                return const CupertinoPageScaffold(child:Searchscreen());
                },
            );
            case 2:
            return CupertinoTabView(
              builder: (context){
                return const CupertinoPageScaffold(child:createpostscreen());
                },
            );
            case 3:
            return CupertinoTabView(
              builder: (context){
                return CupertinoPageScaffold(child:ProfileScreen(id: id, name: name,));
                },
            );
          }
          return Container();
        },
    );
   }
}
class homescreen extends StatelessWidget{
  const homescreen({Key? key}) : super(key: key);
  @override
  Widget  build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Homescreen"),),
      
      );
  }
}
 
class Searchscreen extends StatelessWidget{
  const Searchscreen({Key? key}) : super(key: key);
  @override
  Widget  build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Search screen"),),
      
      );
  }
}
class createpostscreen extends StatelessWidget{
  const createpostscreen({Key? key}) : super(key: key);
  @override
  Widget  build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("createpostscreen"),),
      
      );
  }
}


