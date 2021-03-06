import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/api.dart';
import 'package:xculture_admin/helpers/auth.dart';
import 'package:xculture_admin/helpers/responsiveness.dart';
import 'package:xculture_admin/layout.dart';
import 'package:xculture_admin/widgets/theText.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({ Key? key }) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: Image.asset("assets/icons/Xculture.png"),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Login",
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  TheTextWidget(
                    text: "Welcome back to the admin panel.",
                    color: grey,
                    weight: FontWeight.normal,
                    size: 14,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (newValue) => email = newValue,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        } 

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email address",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      onSaved: (newValue) => password = newValue,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } 

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    )
                  ]
                )
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var success = await Auth.signIn(email!, password!);
                    if (success) {
                      Get.offAll(()=> SiteLayout());
                    }
                    else {
                      showDialog(
                        context: context, 
                        builder: (context) => AlertDialog(
                          title: const Text("Not Admin"),
                          content: const Text("Only admins are allowed"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, 
                              child: const Text("Ok")
                            )
                          ],
                        )
                      );
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(color: red, 
                  borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TheTextWidget(
                    text: "Login",
                    color: Colors.white,
                    weight: FontWeight.bold,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}
