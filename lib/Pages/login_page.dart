import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        //padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                Form(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 20.0),
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
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Text("Login"),
                  
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}