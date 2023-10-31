import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Views/createpost_screen.dart';
import 'package:memehub_mobile_app/Views/search_screen.dart';
import 'tab_bars.dart';
import 'profile_screen.dart';

class Dashboard extends StatelessWidget {
  String name;
  int id;
  Dashboard({super.key, required this.id, required this.name});

  @override
  

   Widget build(BuildContext context)
  {
     
    return CupertinoTabScaffold(
     
      tabBar:CupertinoTabBar(
        activeColor: Colors.black,
        items: const <BottomNavigationBarItem>[
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
                return CupertinoPageScaffold(child:CreatePostScreen(name: name,id: id,));
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

 



