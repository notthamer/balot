import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Rounds_list extends StatelessWidget {
  final List<int> _entry;

  Rounds_list(this._entry);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05),
                child: Column(children: [
                  _entry.length == 1
                      ? Text(
                          '0 + ${_entry[index].toString()}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.normal,
                            fontFamily: "SF-Pro"
                          ),
                        )
                      : Text(
                          '${_entry.sublist(0, index).sum.toString()} + ${_entry[index].toString()}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                  Text(
                    '------\n${_entry.sublist(0, index + 1).sum.toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.normal,
                      fontFamily: "SF-Pro"
                    ),
                  ),
                ]));
          },
          itemCount: _entry.length,
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.3,
    );
  }
}