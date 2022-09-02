import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AddScore extends StatelessWidget {
  final Function _addScore;

  AddScore(this._addScore);

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _teamOneScore = TextEditingController();
    final _teamTwoScore = TextEditingController();
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHight = MediaQuery.of(context).size.height;
    final button = CupertinoButton(
      child: const Text('سجل'),
      color: Colors.lightGreen,
      onPressed: () => _addScore(_teamOneScore.text, _teamTwoScore.text),

      //  onPressed: () =>  _showAlertDialog(context),
    );

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: deviceHight * 0.02, bottom: deviceHight * 0.02),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              width: deviceWidth * 0.25,
              height: deviceHight * 0.05,
              child: CupertinoTextField(
                controller: _teamOneScore,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: deviceWidth * 0.25,
              height: deviceHight * 0.05,
              child: CupertinoTextField(
                controller: _teamTwoScore,
                keyboardType: TextInputType.number,
              ),
            )
          ]),
        ),
        button,
      ],
    );
  }
}