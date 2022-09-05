import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  String p1 = "X";
  String p2 = "O";
  String msg = "Game Is Running..";

  int cnt = 0;
  int checkwin = 0;

  List l = List.filled(9, "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic_Tac_Toy_Auto"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Row(
                children: [abc(0), abc(1), abc(2)],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [abc(3), abc(4), abc(5)],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [abc(6), abc(7), abc(8)],
              )),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      l = List.filled(9, "");
                      cnt = 0;
                      checkwin = 0;
                      msg = "Game Is Running...";
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, bottom: 10, right: 10),
                      alignment: Alignment.center,
                      color: Colors.brown,
                      child: Text("Reset",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  )),
                  Expanded(child: Container()),
                  Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 10, bottom: 10, right: 20),
                          alignment: Alignment.center,
                          color: Colors.brown,
                          child: Text(msg,
                              style: TextStyle(fontSize: 30, color: Colors.white)),

                      ))
                ],
              ))
        ],
    ),
    );
  }

  Widget abc(int i) {
    return Expanded(
        child: InkWell(
      onTap: checkwin == 0
          ? () {
              if (l[i] == "" && checkwin == 0) {
                l[i] = p1;
                win();
                if (checkwin == 0 && cnt < 4) {
                  while (true) {
                    int r = Random().nextInt(9);
                    if (l[r] == "") {
                      l[r] = p2;
                      win();
                      break;
                    }
                  }
                }
              }
              cnt++;
              setState(() {});
            }
          : null,
      child: Container(
        margin: EdgeInsets.all(10),
        color: (l[i] == p1)
            ? Colors.yellowAccent
            : (l[i] == p2 ? Colors.greenAccent : Colors.lime),
        alignment: Alignment.center,
        child: Text(l[i],
            style: TextStyle(fontSize: 130, color: Colors.deepPurple)),
      ),
    ));
  }

  win() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1)) {
      msg = "$p1 is Winner...";
      checkwin = 1;
    } else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2)) {
      msg = "$p2 is Winner...";
      checkwin = 1;
    } else if (cnt>3) {
      msg = "Game Is Draw....";
    }
  }
}
