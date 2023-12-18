import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Bloc/post/post_bloc.dart';
import 'package:memehub_mobile_app/Views/tab/home_tab.dart';
import 'package:memehub_mobile_app/global/styles.dart';
import 'package:video_player/video_player.dart';
import '../../global/components/toast_message.dart';

class CreatePostScreen extends StatefulWidget {
  final String name;
  final int id;

  CreatePostScreen({Key? key, required this.name, required this.id})
      : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _descriptionController = TextEditingController();
  final privacies = ['Public', 'Private'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    Styles styles = Styles(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostSuccessfullyState) {
            ToastMessage(context: context, message: "Posted", type: 'success')
                .show();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (builder) => Home(
                      profile_id: widget.id, my_profile_id: widget.id,
                      // name: widget.name,
                      // my_profile_id: widget.id,
                    )));
          }

          else if (state is postuploadloading) {
            showDialog(
                context: context,
                builder: (builder) {
                  return AlertDialog(
                    content: SizedBox(
                      height: styles.getHeight(0.1),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          Text('Loading..'),
                        ],
                      ),
                    ),
                  );
                });
          }
          // else{
          //   ToastMessage(context: context, message: "Posted", type: 'error')
          //       .show();
          // }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      context.read<PostBloc>().add(PostButtonPressedEvent(
                            imageFile: (state is PhotoAddedState)
                                ? state.photoFile
                                : (state is VideoAddedState)
                                ? state.videoFile
                                :null,
                            description: _descriptionController.text,
                            id: widget.id,
                          ));
                    },
                    child: Text(
                      'POST',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
                        Text(widget.name),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        value: (state is PrivacyChangedState)
                            ? state.privacy
                            : 'Public',
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: privacies.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
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
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: const InputDecoration(
                        hintText: "What's on your giggle?",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  (state is PhotoAddedState)
                      ? Image.file(
                          state.photoFile,
                          width: styles.getWidth(1),
                          height: styles.getHeight(0.6),
                        )
                      : (state is VideoAddedState)
                          ? FutureBuilder(
                              future: state.initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  // If the VideoPlayerController has finished initialization, use
                                  // the data it provides to limit the aspect ratio of the video.
                                  return Column(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: state.videoPlayerController
                                            .value.aspectRatio,
                                        // Use the VideoPlayer widget to display the video.
                                        child: VideoPlayer(
                                            state.videoPlayerController),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                if (state.videoPlayerController
                                                    .value.isPlaying) {
                                                  await state
                                                      .videoPlayerController
                                                      .pause();
                                                } else {
                                                  // Check if the video has completed playing
                                                  if (state
                                                          .videoPlayerController
                                                          .value
                                                          .position ==
                                                      state
                                                          .videoPlayerController
                                                          .value
                                                          .duration) {
                                                    // If the video is completed, seek to the beginning
                                                    await state
                                                        .videoPlayerController
                                                        .seekTo(Duration.zero);
                                                    // await state
                                                    //     .videoPlayerController
                                                    //     .pause();
                                                  }
                                                  await state
                                                      .videoPlayerController
                                                      .play();
                                                }
                                                setState(() {});
                                              },
                                              icon: (state.videoPlayerController
                                                      .value.isPlaying)
                                                  ? Icon(Icons.pause)
                                                  : Icon(Icons.play_arrow)),
                                          // IconButton(
                                          //     onPressed: () async {
                                          //       if (state.videoPlayerController
                                          //           .value.isLooping) {
                                          //         //if the video is currently playing, pause it.
                                          //         await state
                                          //             .videoPlayerController
                                          //             .setLooping(false);
                                          //       } else {
                                          //         //If the video is paused or ended, play it.
                                          //         await state
                                          //             .videoPlayerController
                                          //             .setLooping(true);
                                          //       }
                                          //       setState(() {});
                                          //     },
                                          //     icon: (state.videoPlayerController
                                          //             .value.isLooping)
                                          //         ? Icon(Icons.loop_rounded)
                                          //         : Icon(Icons.lock)),
                                        ],
                                      )
                                    ],
                                  );
                                } else {
                                  // If the VideoPlayerController is still initializing, show a
                                  // loading spinner.
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          : Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildElevatedButton(
                        icon: Icons.photo,
                        label: 'Add Photo',
                        onPressed: () async {
                          context.read<PostBloc>().add(AddPhotoButtonPressed());
                        },
                      ),
                      buildElevatedButton(
                        icon: Icons.video_camera_back,
                        label: 'Add Reel',
                        onPressed: () {
                          context.read<PostBloc>().add(AddVideoButtonPressed());
                        },
                      ),
                      buildElevatedButton(
                        icon: Icons.tag_faces,
                        label: 'Tag People',
                        onPressed: () {},
                      ),
                      buildElevatedButton(
                        icon: Icons.camera_alt,
                        label: 'Camera',
                        onPressed: () {},
                      ),
                      buildElevatedButton(
                        icon: Icons.gif,
                        label: 'GIF',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildElevatedButton(
      {required IconData icon,
      required String label,
      required void Function()? onPressed}) {
    Styles styles = Styles(context: context);
    return SizedBox(
      width: styles.getWidth(0.9),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
