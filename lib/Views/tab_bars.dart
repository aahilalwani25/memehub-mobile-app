import 'package:flutter/material.dart';
import 'tab/home_tab.dart';
import 'tab/trending_tab.dart';

class homescreen extends StatelessWidget{
  int profile_id=0;
   homescreen({Key? key, required this.profile_id}) : super(key: key);
  @override
  Widget build(BuildContext context){
  return DefaultTabController(

    length: 3,
    child: Scaffold(
     appBar: AppBar(
      title: const Text('HOME SCREEN'),
     ),
     body: Column(
      children: [
        const TabBar(tabs:[
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
          // Tab(
          //   icon:  Icon(
          //     Icons.settings,
          //     color: Colors.black,
          //   ),
          // )
        ] 
        ),
      Expanded(
        child: TabBarView(
          children:[
            //1tab
            Home(profile_id: profile_id,),
            //2 tab
            Trending(),
          ]
      
          ),
          ),
      ],
     ),
    ),
    
  );

}


}