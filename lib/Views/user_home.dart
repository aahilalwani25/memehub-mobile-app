import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Views/createpost_screen.dart';
import 'package:memehub_mobile_app/Views/search_screen.dart';
import 'package:memehub_mobile_app/tab/home_tab.dart';
import 'package:memehub_mobile_app/tab/settings_tab.dart';
import 'package:memehub_mobile_app/tab/trending_tab.dart';
import 'main_user.dart';
import 'profile_screen.dart';

class Home extends StatelessWidget {
  String name;
  int id;
  Home({super.key, required this.id, required this.name});

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

 



Widget build(BuildContext context){
  return DefaultTabController(

    length: 3,
    child: Scaffold(
     appBar: AppBar(
      title: const Text('HOME SCREEN'),
     ),
     body: const Column(
      children: [
        TabBar(tabs:[
          Tab(
            icon:  Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          Tab(
            icon:  Icon(
              Icons.arrow_upward_outlined,
              color: Colors.black,
            ),
          ),
          Tab(
            icon:  Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ] 
        ),
      Expanded(
        child: TabBarView(
          children:[
            //1tab
            home(),

            //2 tab
            Trending(),
            //3tab
            settings(),
          ]
      
          ),
          ),
      ],
     ),
    ),
    
  );

}

