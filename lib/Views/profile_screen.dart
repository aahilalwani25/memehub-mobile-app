import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Views/tab/grid_view.dart';
import '../global/styles.dart';

class ProfileScreen extends StatelessWidget {
  String name;
  int id;
  ProfileScreen({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    Styles styles = Styles(context: context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit),),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings),),


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
      body: SingleChildScrollView(
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
                              CircleAvatar(
                                radius: 48,
                                backgroundImage: AssetImage(
                                    'assets/images/profilepicture.jpeg'),
                              ),
                              Positioned(
                                  bottom: 0, // Adjust the position as needed
                                  right: 0, // Adjust the position as needed
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors
                                          .black, // Background color of the edit symbol
                                    ),
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 20, // You can use any icon you like
                                      color: Colors.white, // Icon color
                                    ),
                                  ))
                            ]),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // MaterialButton(
                                  //   onPressed: () {},
                                  //   color: Colors.black,
                                  //   minWidth: double.infinity,
                                  //   padding: const EdgeInsets.symmetric(
                                  //     vertical: 16,
                                  //   ),
                                  //   shape: const RoundedRectangleBorder(
                                  //     borderRadius:
                                  //         BorderRadius.all(Radius.circular(4)),
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     children: [
                                  //       Icon(
                                  //         Icons.edit,
                                  //         color: Colors.white,
                                  //       ),
                                  //       Text(
                                  //         'Edit Profile',
                                  //         style: TextStyle(
                                  //           fontSize: 16,
                                  //           color: Colors.white,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
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
                                        Column(
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
                        const Text('I am daddy\'s princess'),
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
      ),
    );
  }
}
