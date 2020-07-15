import 'dart:io';

import 'package:destini_story/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/Background.jpg',
              ),
              fit: BoxFit.fitHeight),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(fontSize: 25.0, color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                    //Choice 1 made by user.
                  },
                  color: Color.fromRGBO(148, 138, 136, 1),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                      //Choice 2 made by user.
                    },
                    color: Color.fromRGBO(10, 200, 242, 1),
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: !storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        exit(0);
                      });
                      //Choice 2 made by user.
                    },
                    color: Colors.black,
                    child: Text(
                      'Close App',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
