import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:ethocity_v4/firebase/authentication/auth_helper.dart';
import 'package:ethocity_v4/sign_up.dart';
import 'package:flutter/material.dart';

class signIn_page extends StatefulWidget {
  const signIn_page({super.key});

  @override
  State<signIn_page> createState() => _signIn_pageState();
}

class _signIn_pageState extends State<signIn_page> {
  bool eye = true;
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  var clr_obj = clr();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 16, 27),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                gap(height: 180),
                Text(
                  "Sign In",
                  style: txt_style(clr_obj.fld_clr,
                      fnt_sz: 27, fnt_w: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  width: 280,
                  child: TextFormField(
                    controller: _mailController,
                    style: txt_style(clr_obj.fld_clr),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: txt_style(clr_obj.fld_clr),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      } else if (value.length >= 14 || value.contains('@')) {
                        return null;
                      } else {
                        return "Enter a valid mail";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 280,
                  child: TextFormField(
                    controller: _passController,
                    style: txt_style(clr_obj.fld_clr),
                    obscureText: eye,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              eye = !eye;
                            });
                          },
                          icon: eye == true
                              ? Icon(
                                  Icons.visibility,
                                  color: clr_obj.fld_clr,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: clr_obj.fld_clr,
                                ),
                          splashColor: Colors.transparent,
                        ),
                        hintText: "Password",
                        hintStyle: txt_style(clr_obj.fld_clr)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      } else if (value.length <= 5) {
                        return "Password can't less than 4 digit";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // InkWell(
                //   onTap: () {
                //     SignIn(_mailController.text, _passController.text, context);
                //     FocusManager.instance.primaryFocus!.unfocus();
                //   },
                //   splashColor: Colors.transparent,
                //   highlightColor: Colors.transparent,
                //   child: Container(
                //     height: 37,
                //     width: 140,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(50),
                //         gradient: LinearGradient(colors: [
                //           Color.fromARGB(146, 141, 233, 210),
                //           Color.fromARGB(167, 53, 250, 201)
                //         ])),
                //     child: Center(child: Text("Sign In")),
                //   ),
                // ),

                FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  splashColor: Color.fromARGB(255, 4, 28, 48),
                  label: Text("Sign In"),
                  onPressed: () {
                    SignIn(_mailController.text, _passController.text, context);
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  backgroundColor: Color.fromARGB(43, 4, 54, 94),
                ),

                gap(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any account?",
                      style: txt_style(clr_obj.fld_clr),
                    ),
                    TextButton(
                      style: ButtonStyle(
                       overlayColor: MaterialStateProperty.all(Colors.transparent)
                      ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signUp_page(),
                            )),
                        child: Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
