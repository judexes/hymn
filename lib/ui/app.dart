import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import './home.dart';

class Hymn extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hymn',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  WelcomePageState createState() {
    return new WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Center(
                child: new ListView(shrinkWrap: true, children: <Widget>[
              Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: new Center(
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                        SizedBox(height: 80.0),
                        Column(children: <Widget>[
                          Image.asset('images/logo.png'),
                          SizedBox(height: 160.0),
                        ])
                      ])))),
              Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: new Center(
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                        SizedBox(height: 15.0),
                        Column(children: <Widget>[
                          RaisedButton(
                              textColor: Colors.white,
                              color: Colors.green,
                              child: Text('W E L C O M E'),
                              onPressed: () {
                                navigateToHomePage(context);
                              }),
                        ]),
                        SizedBox(height: 30.0),

                              ]))))
            ])),
          );
        });
  }
}

Future navigateToHomePage(context) async => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => HomePage()));
