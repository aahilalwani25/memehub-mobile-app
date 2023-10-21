import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Views/profile_screen.dart';

class mainscreen extends StatelessWidget {
  const mainscreen({super.key});

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
            /*case 4:
            return CupertinoTabView(
              builder: (context){
                return const CupertinoPageScaffold(child:Searchscreen());
                },
            );*/
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


