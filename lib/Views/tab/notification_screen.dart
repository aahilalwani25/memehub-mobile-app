import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Bloc/hommies/hommies_bloc.dart';

class notification_screen extends StatefulWidget {
  notification_screen({required this.id, super.key});
  final int id;
  @override
  State<notification_screen> createState() => _notification_screenState();
}

class _notification_screenState extends State<notification_screen> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: BlocProvider<HommiesBloc>(
          create: (context) => HommiesBloc()..add(HommiesFetchedEvent(id: widget.id)),
          child: BlocBuilder<HommiesBloc, HommiesState>(
            builder: (BuildContext context, state) {
              if (state is HommieLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HommieFetchedState) {
                final hommiesList = state.hommies;

                print(hommiesList);
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: hommiesList.map((hommieData) {
                      // int id = postData['id'] as int;
                      // String name = postData['description'].toString();
                      // String type = postData['type'];
                      // String imageUrl = postData['url'];
                      //print(id);

                      // if (type == "image") {
                      return (hommieData["is_status"] == "Pending")? ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profilepicture.jpeg"),
                        ),
                        title: Row(
                          children: [
                            Expanded(child: Text(hommieData["username"])),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              onPressed: (){

                            }, child: Text("Accept",style: TextStyle(color: Colors.white),)),
                            ElevatedButton(
                            
                              style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.black)),
                                //backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                              ),
                              onPressed: (){

                              
                            }, child: Text("Reject",style: TextStyle(color: Colors.black),)),
                          ],
                        )):Container()
                        // trailing://Row(
                        //       //children: [
                        //         ElevatedButton(onPressed: (){}, child: Text("Remove")),
                        //     //     ElevatedButton(onPressed: (){}, child: Text("Reject")),
                        //     //   ],
                        //     // )
                            
                      ;
                    }).toList(),
                  ),
                );
              } else {
                return const Center(child: Text("NO HOMIES TO SHOW"));
              }
            },
          )
          // ) ListView.builder(
          //     itemCount: 3,
          //     itemBuilder: (itemBuilder, index) {
          //       return ListTile(
          //         leading: CircleAvatar(
          //           backgroundImage:
          //               AssetImage("assets/images/profilepicture.jpeg"),
          //         ),
          //         title: Text("Ayub Latif"),
          //       );
          //     }),
          ),
    );
  }
}