import 'package:flutter/material.dart';
import 'package:memehub_mobile_app/Models/reels_list.dart';
import 'package:memehub_mobile_app/Views/Reels/reels_view.dart';
import 'package:memehub_mobile_app/Views/tab/notification_screen.dart';
import 'package:reels_viewer/reels_viewer.dart';
import 'tab/home_tab.dart';
import 'tab/trending_tab.dart';

class homescreen extends StatelessWidget {
  int profile_id;
  homescreen({Key? key, required this.profile_id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: [
            GestureDetector(
              child: Icon(Icons.notifications),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) => notification_screen(id: this.profile_id,)));
              },
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.chat),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(
          children: [
            const TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.videocam_sharp,
                  color: Colors.black,
                ),
              ),
              // Tab(
              //   icon:  Icon(
              //     Icons.settings,
              //     color: Colors.black,
              //   ),
              // )
            ]),
            Expanded(
              child: TabBarView(children: [
                //1tab
                Home(
                  profile_id: profile_id,
                  my_profile_id: profile_id,
                ),
                // Home(profile_id: profile_id,),
                //2 tab
                Reels_View(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
