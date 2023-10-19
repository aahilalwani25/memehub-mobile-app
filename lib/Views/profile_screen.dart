import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

@override
Widget build(BuildContext context){
  return Scaffold(
    body: SingleChildScrollView(
    child: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background2.jpeg'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
          height: 260
          ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 12,
              ) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage('assets/images/profilepicture.jpeg'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            'Sam William',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                            const Text('SamWilliammm'),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: Colors.blue,
                              minWidth: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                ),
                                child: const Text(
                                  'Add Homey',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                            ],
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '58',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 4),
                            Text('Post',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            ),
                          ],  
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '500',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 4),
                            Text('Homies',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            ),
                          ],  
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '900',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            height: 4),
                            Text('Meme-Ometer',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            ),
                          ],
                           
                      ),
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
    ),
  );
  
}
}