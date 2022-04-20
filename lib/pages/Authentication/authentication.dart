import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xculture_admin/constants/controllers.dart';
import 'package:xculture_admin/constants/style.dart';
import 'package:xculture_admin/helpers/responsiveness.dart';
import 'package:xculture_admin/layout.dart';
import 'package:xculture_admin/widgets/theText.dart';


class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);
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
              TextField(
                decoration: InputDecoration(
                    labelText: "Email address",
                    hintText: "admin1@gmail.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "123456",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
               SizedBox(
                height: 15,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Checkbox(value: true, onChanged: (value){}),
              //         TheTextWidget(
              //           text: "Remeber Me",
              //           color: red,
              //           weight: FontWeight.normal,
              //           size: 12,),
              //       ],
              //     ),

              //     TheTextWidget(
              //       text: "Forgot password?",
              //       color: red,
              //       weight: FontWeight.normal,
              //       size: 12,
              //     )
              //   ],
              // ),
                SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  Get.offAll(()=> SiteLayout());
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
