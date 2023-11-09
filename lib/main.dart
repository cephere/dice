import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  int total = 2;
  String yes = 'Dice roll are equal';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextButton(
                          onPressed: (){
                            setState(() {
                              Gacha();
                              Sum();
                              Compare();
                            });
                            print('Left dice is clicked');
                            print(left);
                          },
                          child: Image.asset('images/dice$left.png'))
                  )),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextButton(
                          onPressed: (){
                            setState(() {
                              Gacha();
                              Sum();
                              Compare();
                            });
                            print('Right dice is clicked');
                            print(right);
                          },
                          child: Image.asset('images/dice$right.png'))
                  )),
            ],
          ),
        ),

        Text('The total roll is $total \n $yes',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void Gacha(){
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
  }

  void Sum(){
    total = left + right;
  }
  void Compare(){
    if (left > right){
      yes = 'Left dice is higher';
    }
    else if(right == left){
      yes = 'Dice roll are equal';
    }else{
      yes = 'Right dice is higher';
    }
  }
}

