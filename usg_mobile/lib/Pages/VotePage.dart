import 'package:flutter/material.dart';
import 'package:better_polls/better_polls.dart';
import 'package:usg_mobile/Pages/votedPage.dart';

class votePage extends StatefulWidget {
  const votePage({super.key});

  @override
  State<votePage> createState() => _votePageState();
  } //build

class _votePageState extends State<votePage> {
    String user = "someone@mail.com"; //set equal to the users email
    String creator = "chcolby@student.neumont.edu"; //i'm not sure what this is used for tbh
    Map<String, int> usersWhoVoted = {
      'sam@mail.com': 3,
      'mike@mail.com': 2,
      'john@mail.com': 3,
      'kenny@mail.com': 0,
      'someone2@mail.com': 3, //make this match the user to dissable votes for the debug test
    };    //this is got to be a database list of all the people. i think the numbers are to show what people voted.

    double option1 = 0.0;
    double option2 = 0.0;
    double option3 = 0.0;
    double option4 = 0.0; //how many have voted that option before

    void setValues(Map<String, int> usersWhoVoted) {
      option1 = 0.0;
      option2 = 0.0;
      option3 = 0.0;
      option4 = 0.0;
      usersWhoVoted.forEach((email, voted) {
        switch (voted) {
          case 0:
            option1++;
            break;
          case 1:
            option2++;
            break;
          case 2:
            option3++;
            break;
          case 3:
            option4++;
            break;
        }
      });
    }

    @override
    Widget build(BuildContext context) {
      setValues(usersWhoVoted);
      return Scaffold(
        appBar: appBar(),
        body: body(),
      );
}

  //app bar
    AppBar appBar() {
      return AppBar(
        title: Text(
          '      USG',
          style: TextStyle(
              color: Colors.yellow.shade600, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black26,
        centerTitle: true,
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 60.0, 0.0),
          child: Image.asset('assets/images/Neumont_logo.png'),
        ),
      );
    }

  //body
  //next page button is in here
  Center body() {
    return Center(
      child: Column(
        children: [
          Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Color(0x62BBB8B8),
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 5),
              child:
                  Padding(padding: const EdgeInsets.all(32.0), child: poll())), //poll is all the poll stuff
          const Padding(padding: EdgeInsets.all(2.0)),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                alignment: Alignment.centerRight,
                side: const BorderSide(
                  width: 2.0,
                ),
                backgroundColor: Colors.white10,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return const votedPage();
               }));
              //Code for Yes goes here
              debugPrint('Next');
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }

  //all the poll stuff
  Polls poll() {
    return Polls(
      children: [
        Polls.options(title: 'Pazza', value: option1),
        Polls.options(title: 'Borgor', value: option2),
        Polls.options(title: 'Chezz', value: option3),
        Polls.options(title: 'Pickle', value: option4),
      ], //all the option names and the value they are matched with
      optionBarRadius: 24,
      borderWidth: 1,
      optionHeight: 50,
      optionSpacing: 12,
      question: const Padding(
        padding: EdgeInsets.fromLTRB(60,0,0,10),
        child: Text('What food u want?'),
      ),
      currentUser: user,
      creatorID: creator,
      voteData: usersWhoVoted,
      userChoice: usersWhoVoted[user],

      //colors
      onVoteBorderColor: Colors.black,
      voteCastedBorderColor: Colors.black,
      onVoteBackgroundColor: Colors.blue,
      leadingBackgroundColor: Colors.lightGreen,
      backgroundColor: Colors.white24,
      voteCastedBackgroundColor: Colors.white24,

      //this is the on clicks for the vote buttons
      onVote: (choice) {
        setState(() {
          usersWhoVoted[user] = choice;
        });
        if (choice == 0) {
          setState(() {
            option1 += 1.0;
          });
        }
        if (choice == 1) {
          setState(() {
            option2 += 1.0;
          });
        }
        if (choice == 2) {
          setState(() {
            option3 += 1.0;
          });
        }
        if (choice == 3) {
          setState(() {
            option4 += 1.0;
          });
        }
        },
    );
  }

}
