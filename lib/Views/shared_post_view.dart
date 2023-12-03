import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/global/styles.dart';

class Shared_Post {
  final int postId;
  final String username;
  final String? originalPostDescription;
  final Image? image;
  final TextEditingController descriptionController = TextEditingController();

  Shared_Post(
      {required this.postId,
      this.originalPostDescription,
      required this.username,
      this.image});

  void show(BuildContext context) {
    Styles styles = Styles(context: context);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: WillPopScope(
            onWillPop: () async => true, // enable back button
            child: Container(
              height: styles.getHeight(0.6),
              padding: EdgeInsets.all(20),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/profilepicture.jpeg'),
                        ),
                        SizedBox(
                          width: styles.getWidth(0.09),
                        ),
                        Text(username),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            image!,
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                originalPostDescription!,
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                            ))
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: styles.getWidth(1),
                    height: styles.getHeight(0.2),
                    child: TextField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Share your giggle....",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      onPressed: () {},
                      child: Text(
                        "Share",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
