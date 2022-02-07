import 'package:ecommerceapp/utils/routes.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Form(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter UserName", labelText: "UserName"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        obscureText: true,
                      )
                    ],
                  ),
                )),
                SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: () async {
                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, MyRoute.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton ? 60 : 320.0,
                    height: 60.0,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    child: changeButton
                        ? Icon(Icons.done,color: Colors.white,)
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3,
                            ),
                          ),
                  ),
                )

                // Container(
                //   height: 50,
                //   width: 150,
                //   alignment: Alignment.center,
                //   child: Text(
                //     "Login",
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 18),
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.deepPurple,
                //     borderRadius: BorderRadius.circular(8)
                //   ),
                // )
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, MyRoute.homeRoute);
                //   },
                //   child: Text("Login"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
