import 'package:flutter/material.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            children: [],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Handle the search action here
                        },
                      ),
                      hintText: "Search...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // Handle the text input and filtering logic here
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text("Your Content Here"),
      ),
    );
  }
}
