import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation;
  late AnimationController animationController;


  @override
  void initState(){
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn
    ));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));

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
                      padding: EdgeInsets.fromLTRB(15, 100, 0, 0),
                      child: Text("Sign Up",
                        style: TextStyle(fontSize: 80,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(330, 100, 0, 0),
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
                          labelText: "NICK NAME",
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
                    SizedBox(height: 80,),
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
                            child: Text("SIGNUP", style: TextStyle(
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
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text("Go Back", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    );
  }
}
