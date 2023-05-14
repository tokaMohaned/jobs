import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/local/sharedPreference.dart';
import '../../utilites/AppAssets.dart';
import '../../utilites/enums.dart';
import '../customeWidget/defaulit_form_field.dart';
import '../customeWidget/main_button.dart';
import '../pages/Login.dart';
import '../pages/homeScreen.dart';

class RegitrationScreen extends StatefulWidget {
  RegitrationScreen({Key? key}) : super(key: key);
  static const String routName = "RegistrationScreen";

  @override
  State<RegitrationScreen> createState() => _RegitrationScreenState();
}

class _RegitrationScreenState extends State<RegitrationScreen> {
  bool ispressed = false;
  var userNameController =
      TextEditingController(text: MyCache.getString(key: MyCacheKeys.name));

  var emailController =
      TextEditingController(text: MyCache.getString(key: MyCacheKeys.email));

  var passwordController =
      TextEditingController(text: MyCache.getString(key: MyCacheKeys.password));

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          Container(
            height: 5.h,
            width: 20.w,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Logo.png",
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: [
                        SizedBox(height: 1.h),
                        Text(
                          "Please create an account to find your dream job",
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 3.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultFormField(
                      //user name
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter user name';
                        }
                        //return null;
                      },
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      labelText: "Username",
                      backgroundColor: Colors.white,
                      prefixIcon: const Icon(Icons.person_outline),
                      inputEnabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        //borderRadius: BorderRadius.circular(20),
                      ),
                      inputFocusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        //borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultFormField(
                      //email
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter email';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9]+.[a-z]")
                            .hasMatch(value)) {
                          return "please enter valid mail";
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      inputEnabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        //borderRadius: BorderRadius.circular(20),
                      ),
                      inputFocusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        // borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
////////////////////////////////////////////////////////////////////////////////////////////////
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultFormField(
                        //password
                        obscureText: ispressed,
                        obscuringChar: ".",
                        maxLines: 1,
                        // onChanged: (value) {
                        //   passController = value;
                        //   setState(() {});
                        //
                        //   },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter passowrd';
                          }
                          if (value!.length < 8) {
                            return ("password must be at lease 8 characters");
                          }
                        },

                        controller: passwordController,
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon:
                            //ImageIcon(AssetImage("assets/images/eye-slash.png"),),
                            IconButton(
                          onPressed: () {
                            setState(() {
                              ispressed = !ispressed;
                            });
                          },
                          icon: ispressed
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        inputEnabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        inputFocusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25.h,
                  ),
                  //Spacer(),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Color(0xFf9CA3AF),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, LoginScreen.routName);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xFf3366FF),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),

                  MainButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        MyCache.putString(
                            key: MyCacheKeys.email,
                            value: emailController.text);
                        MyCache.putString(
                            key: MyCacheKeys.password,
                            value: passwordController.text);
                      }
                      Navigator.pushNamed(context, HomeScreen.routName);
                      print(emailController);
                    },
                    text: 'Create account',
                  ),

                  SizedBox(
                    height: 1.h,
                  ),

                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 36,
                            //width:64.5
                          )),
                    ),
                    const Text("Or Sign up With Account"),
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            height: 5.h,
                          )),
                    ),
                  ]),
                  Row(children: [
                    InkWell(
                      child: Image(
                        image: AssetImage(AppAssets.googleIcon),
                      ),
                    ),
                    Spacer(),

                    InkWell(
                        child: Image(
                      image: AssetImage(AppAssets.facebookIcon),
                    )),

                    // Container( width: 154,
                    //   child: ElevatedButton(
                    //     onPressed: (){},
                    //     child: ImageIcon(
                    //       AssetImage(AppAssets.facebookIcon),
                    //
                    //     ) ),
                    // ),
                    // const Spacer(),

                    // ElevatedButton(
                    //     onPressed: (){},
                    //     child: ImageIcon(
                    //       AssetImage("assets/images/facebook icon.png"),),),
                  ]),
                ], //chelderen of column
              ),
            ),
          ),
        ),
      ),
    );
  }
}
