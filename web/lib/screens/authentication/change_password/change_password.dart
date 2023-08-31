import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:megabank/constants.dart';
import 'package:megabank/models/provider/page_index_provider.dart';
import 'package:megabank/routes/app_route_constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmedPasswordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      GoRouter.of(context).go(MyAppRouteConstants.homeRouteName);
      context.read<PageIndex>().setPasswordChangedText();
    }
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmedPasswordController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 25.w,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Icon(
                  Icons.chevron_left,
                  color: primaryWhite,
                  size: 20.sp,
                ),
              ),
              Text(
                'Back',
                style: TextStyle(color: primaryWhite, fontSize: 13.5.sp),
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
                      margin: EdgeInsets.only(top: 20.h, left: 15, right: 15),
                      child: Column(
                        children: [
                          TextFormField(
                            obscureText: true,
                            controller: oldPasswordController,
                            decoration: const InputDecoration(
                                label: Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text('Old Password'),
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
                              return null;
                            },
                          ),
                          SizedBox(height: 2.h),
                          TextFormField(
                            obscureText: true,
                            controller: newPasswordController,
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
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password!';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters!';
                              }
                              if (oldPasswordController.text == newPasswordController.text) {
                                return 'New password must not be the same as your old password.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 2.h),
                          TextFormField(
                            obscureText: true,
                            controller: confirmedPasswordController,
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
                              if (confirmedPasswordController.text != newPasswordController.text) {
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
                      margin: EdgeInsets.only(top: 4.h, left: 15, right: 15),
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
