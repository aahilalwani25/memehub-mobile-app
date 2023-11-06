import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memehub_mobile_app/Bloc/profile/profile_bloc.dart';
import 'package:memehub_mobile_app/Views/edit_profile.dart';
import 'package:memehub_mobile_app/Views/friends_view.dart';
import 'package:memehub_mobile_app/Views/grid_view.dart';

import 'package:memehub_mobile_app/Views/tab/settings_tab.dart';
import '../global/styles.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final int my_profile_id_fk, my_homie_id_fk;
  const ProfileScreen(
      {super.key,
      required this.my_homie_id_fk,
      required this.my_profile_id_fk,
      required this.name});

  @override
  Widget build(BuildContext context) {
    Styles styles = Styles(context: context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => EditProfilePage()));
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const Settingpage()));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
          context.read<ProfileBloc>().add(AddHomieButtonPressed(
                my_homie_id_fk: my_homie_id_fk,
                my_profile_id_fk: my_profile_id_fk,
              ));
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Stack(children: [
                                  const CircleAvatar(
                                    radius: 48,
                                    backgroundImage: AssetImage(
                                        'assets/images/profilepicture.jpeg'),
                                  ),
                                  Positioned(
                                      bottom:
                                          0, // Adjust the position as needed
                                      right: 0, // Adjust the position as needed
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors
                                              .black, // Background color of the edit symbol
                                        ),
                                        child: const Icon(
                                          Icons.add_a_photo,
                                          size:
                                              20, // You can use any icon you like
                                          color: Colors.white, // Icon color
                                        ),
                                      ))
                                ]),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  '58',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Post',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (builder) =>
                                                            HomiesScreen(
                                                                id: my_profile_id_fk)));
                                              },
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '500',
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'Homies',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  '900',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  'Meme-Ometer',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const Text('I am daddy\'s princess'),
                                //use materialButton
                                (my_homie_id_fk != my_profile_id_fk)
                                    ? ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<ProfileBloc>()
                                              .add(AddHomieButtonPressed(
                                                my_homie_id_fk: my_homie_id_fk,
                                                my_profile_id_fk:
                                                    my_profile_id_fk,
                                              ));
                                        },
                                        child: (state is HomieRequestedState)
                                            ? const Text("Requested")
                                            : (state is Loading)
                                                ? const CircularProgressIndicator()
                                                : const Text("Add homie"))
                                    : Container(),
                              ],
                            ),

                            // const Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Column(
                            //         children: [
                            //           Text(
                            //             '58',
                            //             style: TextStyle(
                            //               fontSize: 24,
                            //               color: Colors.black,
                            //             ),
                            //           ),
                            //           SizedBox(height: 4),
                            //           Text(
                            //             'Post',
                            //             style: TextStyle(
                            //               fontSize: 16,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       Column(
                            //         children: [
                            //           Text(
                            //             '500',
                            //             style: TextStyle(
                            //               fontSize: 24,
                            //               color: Colors.black,
                            //             ),
                            //           ),
                            //           SizedBox(height: 4),
                            //           Text(
                            //             'Homies',
                            //             style: TextStyle(
                            //               fontSize: 16,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //       Column(
                            //         children: [
                            //           Text(
                            //             '900',
                            //             style: TextStyle(
                            //               fontSize: 24,
                            //               color: Colors.black,
                            //             ),
                            //           ),
                            //           SizedBox(height: 4),
                            //           Text(
                            //             'Meme-Ometer',
                            //             style: TextStyle(
                            //               fontSize: 16,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ]),
                            const SizedBox(
                              height: 30,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  'Posts',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),

                                postgrid(),

                                //  SingleChildScrollView(
                                //     scrollDirection: Axis.vertical,
                                //     child: Column(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       children: [
                                //         const SizedBox(
                                //           width: 28,
                                //         ),
                                //         Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 8),
                                //           child: ClipRRect(
                                //             borderRadius: BorderRadius.circular(20),
                                //             child: Image.asset(
                                //               'assets/images/firstpicture.jpeg',
                                //               height: 200,
                                //               width: styles.getWidth(0.7),
                                //               fit: BoxFit.fitHeight,
                                //             ),
                                //           ),
                                //         ),
                                //         const SizedBox(
                                //           height: 28,
                                //         ),
                                //         Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 8),
                                //           child: ClipRRect(
                                //             borderRadius: BorderRadius.circular(20),
                                //             child: Image.asset(
                                //               'assets/images/firstpicture.jpeg',
                                //               height: 200,
                                //               width: styles.getWidth(0.7),
                                //               fit: BoxFit.fitHeight,
                                //             ),
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                //   const SizedBox(
                                //     height: 16,
                                //   ),
                                //   SingleChildScrollView(
                                //     scrollDirection: Axis.vertical,
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.start,
                                //       children: [
                                //         const SizedBox(
                                //           width: 28,
                                //         ),
                                //         Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 8),
                                //           child: ClipRRect(
                                //             borderRadius: BorderRadius.circular(20),
                                //             child: Image.asset(
                                //               'assets/images/homepicture1.jpeg',
                                //               height: 200,
                                //               fit: BoxFit.fitHeight,
                                //             ),
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
