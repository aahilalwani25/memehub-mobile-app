import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Bloc/hommies/hommies_bloc.dart';

class HommiesScreen extends StatelessWidget {
  HommiesScreen({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Homies(id: id);
  }
}

class Homies extends StatefulWidget {
  final int id;
  Homies({required this.id, super.key});

  @override
  State<Homies> createState() => _Homies_ScreenState();
}

class _Homies_ScreenState extends State<Homies> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Homies')),
      body: BlocProvider<HommiesBloc>(
          create: (context) =>
              HommiesBloc()..add(HommiesFetchedEvent(id: widget.id)),
          child: BlocBuilder<HommiesBloc,HommiesState>(
            builder: (BuildContext context, state) {
              if (state is HommieLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              else if (state is HommieFetchedState) {
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
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profilepicture.jpeg"),
                        ),
                        title: Text("Ayub Latif"),
                      );
                    }).toList(),
                  ),
                );
              }else{
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
