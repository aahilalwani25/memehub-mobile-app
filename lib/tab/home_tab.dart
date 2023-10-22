import 'package:flutter/material.dart';

class home extends StatelessWidget{
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
                  body:SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 28,
                        ),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/firstpicture.jpeg',
                            height: 200,
                            fit: BoxFit.fitHeight,
                          ),


                        ),
                        ),
                      ],
                    ),
                     
                  ),
    
                
                  );
       
       
  }


}