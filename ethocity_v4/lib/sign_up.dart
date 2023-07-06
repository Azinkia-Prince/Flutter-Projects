import 'package:ethocity_v4/custom_class.dart';
import 'package:ethocity_v4/custom_functions.dart';
import 'package:ethocity_v4/firebase/authentication/auth_helper.dart';
import 'package:ethocity_v4/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signUp_page extends StatefulWidget {
  @override
  State<signUp_page> createState() => _signUp_pageState();
}

class _signUp_pageState extends State<signUp_page> {
  bool eye = true;
  bool test = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _deptController = TextEditingController();
  TextEditingController _secController = TextEditingController();
  TextEditingController _semController = TextEditingController();
  var clr_obj = clr();
  final _formKey = GlobalKey<FormState>();

  //Firebase Data Upload

  uploadData(email_address) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var current_user = _auth.currentUser;
    CollectionReference _collectionRef =
        await FirebaseFirestore.instance.collection("user");
    return _collectionRef.doc(email_address).set({
      "name": _nameController.text,
      "dept": _deptController.text,
      "sec": _secController.text,
      "sem": _semController.text,
    });
  }

  // uploadData(){
  //   Map<String,String>_infomap ={
  //   'name': _nameController.text,
  //   'dept':_deptController.text,
  //   'sec':_secController.text,
  //   'sem':_semController.text,
  // };
  //   final FirebaseAuth _auth = FirebaseAuth.instance;

  //    FirebaseFirestore.instance.collection('user').doc(_auth.currentUser).set(_infomap);
  // }

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
                gap(height: 100),
                Text(
                  "Sign Up",
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
                    controller: _nameController,
                    style: txt_style(
                      clr_obj.fld_clr,
                    ),
                    decoration: InputDecoration(
                        hintText: "Student Name",
                        hintStyle: txt_style(clr_obj.fld_clr),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr))),
                  ),
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
                  height: 55,
                  width: 280,
                  child: TextFormField(
                    controller: _deptController,
                    style: txt_style(clr_obj.fld_clr),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        hintText: "Department",
                        hintStyle: txt_style(clr_obj.fld_clr)),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 280,
                  child: TextFormField(
                    controller: _secController,
                    style: txt_style(clr_obj.fld_clr),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        hintText: "Section",
                        hintStyle: txt_style(clr_obj.fld_clr)),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: 280,
                  child: TextFormField(
                    controller: _semController,
                    style: txt_style(clr_obj.fld_clr),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: clr_obj.fld_clr)),
                        hintText: "Semester",
                        hintStyle: txt_style(clr_obj.fld_clr)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                //SignUp Method

                // InkWell(
                //   onTap: () {
                //     Registration(
                //         _mailController.text, _passController.text, context);
                //     uploadData(_mailController.text);
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
                //     child: Center(child: Text("Sign Up")),
                //   ),
                // ),
                FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  splashColor: Color.fromARGB(255, 4, 28, 48),
                  label: Text("Sign Up"),
                  onPressed: () {
                    Registration(
                        _mailController.text, _passController.text, context);
                    uploadData(_mailController.text);
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  backgroundColor: Color.fromARGB(43, 4, 54, 94),
                ),

                gap(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: txt_style(clr_obj.fld_clr),
                    ),
                    TextButton(                     
                      style: ButtonStyle(
                       overlayColor: MaterialStateProperty.all(Colors.transparent)
                      ),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signIn_page(),
                            )),
                        child: Text("Sign In"))
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
