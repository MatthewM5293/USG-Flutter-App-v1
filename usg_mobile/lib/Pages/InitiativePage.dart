import 'package:flutter/material.dart';
import 'package:usg_mobile/Pages/Initiatives.dart';

class InitiativePage extends StatelessWidget {

  String title = Initiatives.initiatives[Initiatives.initToLoad].title;

  String desc = Initiatives.initiatives[Initiatives.initToLoad].description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'USG',
          style: TextStyle(
              color: Colors.yellow.shade600,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black26,
        centerTitle: true,
        flexibleSpace: Container(
          child: Image.asset('assets/images/Neumont_logo.png'),
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 90.0, 0.0),
        ),

      ),

      //your stuff

      body: Center(

        child: Column(

          children: [

            const Padding(padding: EdgeInsets.all(2.0)),

            Text(title.toString()), //initiative title

            Text(desc.toString()), //description box

            Row(

              children: [

                TextButton(

                  onPressed: (){
                    //Code for Yes goes here
                  },

                  child: const Text('Sign Initiative'),

                ),

                TextButton(

                  onPressed: (){
                    //Code for no here
                  },

                  child: const Text('Undo Signature'),

                ),

              ],

            ),

            TextButton( //Will go back to main

              onPressed: (){Navigator.pop(context);},

              child: const Text('Go Back'),

            ),

          ],

        ),

      ),

    );

  }

}

//body: ,
