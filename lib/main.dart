import 'dart:html';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double dx=100,dy=100;
  @override
  Widget build(BuildContext context) {
    var SensorsPlatform;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:StreamBuilder<GyroscopeEvent>(
        stream: SensorsPlatform.instance.gyroscopeEvents,
        builder:(_, snapshot){
          if(snapshot.hasData);
          dx=dx+snapshot.data!.y*10;
          dy=dy+snapshot.data!.x*10;
          return Transform.translate(offset: Offset(dx,dy),);
          child:const CircleAvatar(radius:20,);

        },

      ),
   
    );
  }
}

