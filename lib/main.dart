import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_and_singup/signup.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimaton;
  late AnimationController animationController;

  @override
  void initState(){
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn
    ));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));

    muchDelayedAnimaton = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
    )
    );
  }


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context,  child)
    {
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              transform: Matrix4.translationValues(animation.value * width, 0, 0),
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                      child: Text("Hello",
                        style: TextStyle(fontSize: 80,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 185, 0, 0),
                      child: Text("There",
                        style: TextStyle(fontSize: 80,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(250, 185, 0, 0),
                      child: Text(".",
                        style: TextStyle(fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff44bd32),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(delayedAnimation.value * width, 0, 0),
              child: Container(
                padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: "EMAIL",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff44bd32)),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "PASSWORD",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff44bd32)),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment(1, 0),
                      padding: EdgeInsets.only(top: 15, left: 20),
                      child: InkWell(
                        child: Text("Forgot Password", style: TextStyle(
                          color: Color(0xff44bd32),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Container(
                      height: 60,
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        shadowColor: Colors.greenAccent,
                        color: Color(0xff44bd32),
                        elevation: 7,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text("LOGIN", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 60,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ImageIcon(
                                AssetImage("images/fbook.png"),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Center(
                              child: Text("Log in with facebook",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Transform(
              transform: Matrix4.translationValues(muchDelayedAnimaton.value * width, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New to Spotify ?", style: TextStyle(
                    fontSize: 15,
                  ),),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text("Register", style: TextStyle(
                      color: Color(0xff44bd32),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    );
  }
}
