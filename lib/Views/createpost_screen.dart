import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Bloc/post/post_bloc.dart';
import 'package:memehub_mobile_app/global/styles.dart';

import '../global/components/toast_message.dart';

class CreatePostScreen extends StatelessWidget {
  final String name;
  final int id;
  final TextEditingController _description_controller = TextEditingController();
  final privacies = [
    'Public', //id=1
    'Private' //id=2
  ];

  CreatePostScreen({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Styles styles = Styles(context: context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Post'),
        ),
        body: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is PostSuccessfullyState) {
              ToastMessage(
                      context: context,
                      message: "Post successful",
                      type: 'success')
                  .show();
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          context.read<PostBloc>().add(PostButtonPressedEvent(
                              imageFile: (state is PhotoAddedState)
                                  ? state.photoFile
                                  : null,
                              description: _description_controller.text,
                              id: id));
                        },
                        child: const Text(
                          'POST',
                          style: TextStyle(color: Colors.white),
                        )),
                    Container(
                      child: Row(children: [
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropdownButton(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          // Initial Value
                          value: (state is PrivacyChangedState)
                              ? state.privacy
                              : 'Public',
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
                            context.read<PostBloc>().add(
                                PrivacyButtonPressedEvent(privacy: newValue!));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: styles.getWidth(1),
                      height: styles.getHeight(0.3),
                      child: TextField(
                        controller: _description_controller,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration: const InputDecoration(
                            hintText: "What's on your giggle?",
                            border: InputBorder.none),
                      ),
                    ),
                    (state is PhotoAddedState)
                        ? Image.file(
                            state.photoFile,
                            width: styles.getWidth(1),
                            height: styles.getHeight(0.6),
                          )
                        : Container(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: styles.getWidth(0.9),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () async {
                                // final upload = await UploadMediaController()
                                //     .getImageFromGallery();
                                // print(upload);

                                context
                                    .read<PostBloc>()
                                    .add(AddPhotoButtonPressed());
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Add Photo',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: styles.getWidth(0.9),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.video_camera_back,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Add Video',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: styles.getWidth(0.9),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.tag_faces,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Tag People',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: styles.getWidth(0.9),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Camera',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: styles.getWidth(0.9),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.gif,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'GIF',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
