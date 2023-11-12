import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:memehub_mobile_app/Models/request.dart';

import '../Models/request.dart';

class RequestList extends StatefulWidget {
  final int id;
  const RequestList({super.key, required this.id});

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  List<HommyRequest> RequestLists = [];

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();

    var response = await http.post(Uri.parse(
        'http://${dotenv.env['IP_ADDRESS']}:${dotenv.env['PORT']}/api/user/friend/friendlist',),
        body: {
          "my_profile_id": widget.id
        });
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == "200") {
      List<dynamic> RequestDataList = data['list'];
      
      print(RequestDataList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (itemBuilder, index) {
        return Container(
            color: Colors.grey,
            child: Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/images/profilepicture.jpeg'),
                  ),
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John Doe'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Accept',
                                  style: TextStyle(color: Colors.green),
                                )),
                            ElevatedButton(
                                onPressed: () {}, child: Text('Reject')),
                          ],
                        ),
                        Divider()
                      ]),
                ),
              ],
            ),
          );
      });
  }
}
