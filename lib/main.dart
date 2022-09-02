import 'package:balot/widgets/team_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/team_title.dart';
import './widgets/round_list.dart';
import './widgets/add_score.dart';
import 'package:collection/collection.dart';
import './widgets/add_names.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

//trying pulling files
//tryignwefsakje 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baloot Calculator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

void _showAlertDialog(BuildContext context, String winner) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(winner),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('لا',style: TextStyle(fontFamily: "Almarai"),),
        ),
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('نعم'),
        )
      ],
    ),
  );
}

class _HomePageState extends State<HomePage> {
  final List<int> team1 = [];
  final List<int> team2 = [];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHight = MediaQuery.of(context).size.height;
    final clearButton = SizedBox(
      child: CupertinoButton(
        child: const Text('تراجع'),
        color: Colors.lightGreen,
        onPressed: () {
          setState(() {
            team1.removeLast();
            team2.removeLast();
          });
        },
      ),
      height: deviceHight * 0.06,
      width: deviceWidth * 0.30,
    );

    void _resetGame() {
      setState(() {
        team1.clear();
        team2.clear();
      });
    }
     final goToRandomizer = SizedBox(
      child: CupertinoButton(
        child: const Text('random'),
        color: Colors.lightGreen,
        onPressed: (){ Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstPage()));}
     
    ),height: deviceHight * 0.06,
      width: deviceWidth * 0.30,);

    final goBackButton = SizedBox(
      child: NeumorphicButton(
        child: const Text('صكه جديدة'),
        
        onPressed: _resetGame,
      ),
      height: deviceHight * 0.06,
      width: deviceWidth * 0.30,
    );

    void _addScore(String t1, String t2) {
      int holdTeam1 = 0;
      int holdTeam2 = 0;

      if (t1.isNotEmpty && t2.isEmpty) {
        holdTeam1 = int.parse(t1);
      } else if (t1.isEmpty && t2.isNotEmpty) {
        holdTeam2 = int.parse(t2);
      } else if (t1.isNotEmpty && t2.isNotEmpty) {
        holdTeam1 = int.parse(t1);
        holdTeam2 = int.parse(t2);
      } else {
        return;
      }

      setState(() {
        team1.add(holdTeam1);
        team2.add(holdTeam2);
      });
      if (team1.sum >= 152 && team1.sum > team2.sum) {
        _showAlertDialog(
            context,
            ' حظ اوفر خسرتم\n لكم ' +
                team2.sum.toString() +
                ' ولهم ' +
                team1.sum.toString());
        team1.clear();
        team2.clear();
      } else if (team2.sum >= 152 && team2.sum > team1.sum) {
        _showAlertDialog(
            context,
            ' مبروك ربحتم\n لكم ' +
                team2.sum.toString() +
                ' ولهم ' +
                team1.sum.toString());
        team1.clear();
        team2.clear();
      }
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.darkBackgroundGray,
          middle: const Text(
            'حسبة بلوت',
            style: TextStyle(
                color: Colors.lightGreen, fontWeight: FontWeight.bold),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TeamTitle(),
              AddScore(_addScore),
              Container(
                margin: EdgeInsets.only(
                    left: deviceWidth * 0.1,
                    right: deviceWidth * 0.1,
                    bottom: deviceHight * 0.05,
                    top: deviceHight * 0.02),
                child: IntrinsicHeight(
                  child: Row(
                    children: <Widget>[
                      Rounds_list(team1),
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      Rounds_list(team2),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ),
                color: Colors.blueGrey[50],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [clearButton, goBackButton, goToRandomizer]),
            ],
          ),
        ),
      ),
    );
  }
}