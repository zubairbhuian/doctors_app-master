import 'package:doctors_app/controllers/login_controller.dart';
import 'package:doctors_app/services/constants/colors.dart';
import 'package:doctors_app/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  LoginController loginController = LoginController();

  @override
  void didChangeDependencies() {
    loginController = Get.put(LoginController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (login) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 185, left: 113, right: 113),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: ConstantsColor.primaryColor,
                      fontSize: 36,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  "Please provide your accurate information to log in to your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: login.emailController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.person_2_outlined),
                            labelText: 'Enter your email',
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal),
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: login.passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off_outlined),
                            labelText: 'Enter your password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal),
                            labelStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 33,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22),
                child: Center(
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () {
                        login.loginOnTap(
                          context,
                          login.emailController.text.toString().trim(),
                          login.passwordController.text.toString().trim(),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: ConstantsColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: login.loader == true
                          ? const CircularProgressIndicator(
                              color: ConstantsColor.backgroundColor,
                            )
                          : const Text(
                              'Sign in',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
