import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/routes/app_route_constants.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String? newPassword;

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
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(Icons.chevron_left,
              color: primaryWhite,
              size: 15.5.sp,),
              Text('Back',
              style: TextStyle(
                color: primaryWhite,
                fontSize: 11.5.sp
              ),
              )
            ],
          ),
        ),
        actions: [
          Container(
          margin: EdgeInsets.only(right: 5.w),
          height: 18.h,
          width: 23.w,
          child: Image.asset(logoImg),
        )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //height: 20.h,
                      margin: EdgeInsets.only(top: 22.h, left: 15, right: 15),
                      child: Column(
                        children: [
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                label: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text('New Password'),
                                ),
                                filled: true,
                                fillColor: primaryWhite,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(15),
                                        right: Radius.circular(15)))),
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) {
                              //Validator
                              newPassword = value;
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
                          SizedBox(height: 2.h),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                label: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text('Confirm New Password'),
                                ),
                                filled: true,
                                fillColor: primaryWhite,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
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
                              if (value != newPassword) {
                                return 'Password does not match!';
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
                          'Reset Password',
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
            ],
          ),
        ),
      ),
    );
  }
}
