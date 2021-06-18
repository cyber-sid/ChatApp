import 'package:chatapplication/screen/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}
TextEditingController emailTextEditingController =
new TextEditingController();
final formKey = GlobalKey<FormState>();
FirebaseAuth auth = FirebaseAuth.instance;


forgotPass() {
  if (formKey.currentState.validate()) {}
    auth.sendPasswordResetEmail(email: emailTextEditingController.text);

  }


class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body:Container(
        height: MediaQuery.of(context).size.height - 50,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
                child: Text("Reset your Password here:",
                  style: TextStyle(color: Colors.white,
                      fontSize: 15,
                      fontFamily: "Bhaloo"),)),
            Form(
              key: formKey,
              child: TextFormField(
                validator: (val) {
                  return RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(val)
                      ? null
                      : "Please provide a correct Email";
                },
                controller: emailTextEditingController,
                style: simpleTextDeco(),
                decoration: textFieldDeco("Existing e-mail"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                forgotPass();

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xff007EF4),
                        const Color(0xff2A75BC)
                      ],
                    )),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Send E-mail",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
         ),
    );
  }
}
