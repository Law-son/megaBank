import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:megabank/routes/app_route_constants.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';

//! Login screen class

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      GoRouter.of(context).pushNamed(MyAppRouteConstants.splashScreenRouteName);
    } else {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 17.h),
                child: Image.asset(logoImg),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //height: 20.h,
                      margin: EdgeInsets.only(top: 12.h, left: 15, right: 15),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                label: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text('Email'),
                                ),
                                filled: true,
                                fillColor: primaryWhite,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(15),
                                        right: Radius.circular(15)))),
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              //Validator
                            },
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 2.h),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                label: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text('Password'),
                                ),
                                filled: true,
                                fillColor: primaryWhite,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(15),
                                        right: Radius.circular(15)))),
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              //Validator
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password!';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters!';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 7.5.h,
                      margin: EdgeInsets.only(top: 8.5.h, left: 15, right: 15),
                      child: ElevatedButton(
                        onPressed: () => _submit(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryYellow,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(17),
                                    right: Radius.circular(17)))),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 21.5.h, bottom: 5.h),
                child: TextButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(MyAppRouteConstants.forgotPasswordRouteName);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
