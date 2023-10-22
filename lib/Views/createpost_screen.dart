import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Bloc/post/post_bloc.dart';
import 'package:memehub_mobile_app/global/components/button.dart';
import 'package:memehub_mobile_app/global/styles.dart';

class CreatePostScreen extends StatelessWidget {
  String name;
  TextEditingController _description_controller = TextEditingController();
  var privacies = [
    'Public', //id=1
    'Private' //id=2
  ];

  CreatePostScreen({Key? key, required String this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Styles styles = Styles(context: context);
    return Scaffold(
        body: BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                //profile pic
                const CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage('assets/images/profilepicture.jpeg'),
                ),
                SizedBox(
                  width: styles.getWidth(0.09),
                ),
                Text(name),
              ]),
              DropdownButton(
                // Initial Value
                value:
                    (state is PrivacyChangedState) ? state.privacy : 'Public',
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: privacies.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  context
                      .read<PostBloc>()
                      .add(PrivacyButtonPressedEvent(privacy: newValue!));
                },
              ),
              SizedBox(
                width: styles.getWidth(0.8),
                height: styles.getHeight(0.3),
                child: const TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "What's on your giggle?",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: styles.getWidth(0.4),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.photo,
                              color: Colors.white,
                            ),
                            Text(
                              'Add Photo',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    width: styles.getWidth(0.4),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.video_camera_back,
                              color: Colors.white,
                            ),
                            Text(
                              'Add Video',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  ),
                  
                ],
              )
            ],
          ),
        );
      },
    ));
  }
}
