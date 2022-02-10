// ignore_for_file: prefer_const_constructors, deprecated_member_use, unnecessary_new

import 'package:catalog/myroutes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flare_flutter/flare_actor.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  String animationType = "idle";
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();

  @override
  void initState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = "hands_up";
        });
      } else {
        setState(() {
          animationType = "hands_down";
        });
      }
    });
    super.initState();
  }

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeroute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.theme.canvasColor,
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 200,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: CircleAvatar(
                    radius: 0,
                    backgroundColor: context.theme.accentColor,
                    child: ClipOval(
                      child: new FlareActor(
                        "assets/images/animation/Teddy.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                        animation: animationType,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.accentColor,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      focusNode: usernameFocusNode,
                      style: TextStyle(color: context.accentColor),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: context.theme.accentColor),
                        labelStyle: TextStyle(color: context.theme.accentColor),
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            animationType = "fail";
                          });
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      style: TextStyle(
                        color: context.theme.accentColor,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: context.theme.accentColor),
                          labelStyle:
                              TextStyle(color: context.theme.accentColor),
                          hintText: "Enter Password",
                          labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            animationType = "fail";
                          });
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          setState(() {
                            animationType = "fail";
                          });
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          animationType = "success";
                        });
                        moveToHome(context);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: changebutton ? 50 : 140,
                        alignment: Alignment.center,
                        child: changebutton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Vx.white),
                              ),
                        decoration: BoxDecoration(
                            color: changebutton
                                ? Colors.green
                                : context.theme.buttonColor,
                            //shape: changebutton ? BoxShape.circle : BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(changebutton ? 50 : 8)),
                      ),
                    )
                    // ignore: prefer_const_constructors
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
