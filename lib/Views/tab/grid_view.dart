import 'package:flutter/material.dart';

class postgrid extends StatelessWidget {

  var images=[
    'assets/images/firstpicture.jpeg',
    'assets/images/homepicture1.jpeg',
    'assets/images/homepicture2.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
    
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns in the grid
      ),
      itemCount: images.length, // Number of pictures in the grid
      itemBuilder: (context, index) {
        
        // Replace this with your image loading logic
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
            
            color: Colors.black,
            

          ),
          child: Image.asset(
                images[index],
                
            fit: BoxFit.cover,
          
          ),
        );
      },
    );
  }
}
