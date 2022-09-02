import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './random.dart';


class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
static List<String> _names = [];
  
}
List get _names{
  return _names;
}

class _FirstPageState extends State<FirstPage> {
  final _textController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(90),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  iconColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: "enter names"),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            onPressed: (() {
              setState(() {
                FirstPage._names.add(_textController.text);
                _textController.clear();
              });
            }),
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: (() {
                setState(() {
                  FirstPage._names.clear();
                });
              }),
              child: Text(
                "remove",
                style: TextStyle(color: Colors.white),
              )),
          ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () { 
                (FirstPage._names.length >= 4)
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Rand_pg_2(FirstPage._names)))
                        
                    : showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                          title: const Text('Alert'),
                          content:
                              const Text('not enough players'),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        ),
                      );
              },
              child: Text("random")),
          Expanded(
            child: ListView.builder(
              itemCount: FirstPage._names.length,
              prototypeItem: ListTile(),
              itemBuilder: (context, index) {
                return Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: ListTile(
                    title: Text(FirstPage._names[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
