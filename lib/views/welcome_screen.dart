import 'package:doctors_app/controllers/social_login_controller.dart';
import 'package:doctors_app/services/google_sig_in.dart';
import 'package:doctors_app/utils/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class WelcomescreenCheck extends StatefulWidget {
  const WelcomescreenCheck({Key? key}) : super(key: key);

  @override
  State<WelcomescreenCheck> createState() => _WelcomescreenCheckState();
}

class _WelcomescreenCheckState extends State<WelcomescreenCheck> {
  SocialLoginController socialLoginController = SocialLoginController();
  

  @override
  void didChangeDependencies() {
    socialLoginController = Get.put(SocialLoginController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (_, constraints) {
        final width = constraints.biggest.width;
        final height = constraints.biggest.height;
        return GetBuilder<SocialLoginController>(
          init: SocialLoginController(),
          builder: (auth) => Stack(
            children: <Widget>[
              const Positioned(
                right: -8,
                top: -8,
                child: Image(
                  image: AssetImage("assets/home_screen/ellipse_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: -8,
                top: -10,
                child: SvgPicture.asset(
                  "assets/welcome_screen/Ellipse 2.svg",
                  fit: BoxFit.cover,
                  color:kPrimaryColor,
                ),
              ),
              const Positioned(
                  right: 00,
                  top: 50,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "WELCOME",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "TO",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "VIRTUAL HEALTHCARE SERVICE",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
              const Positioned(
                  right: 00,
                  top: 105,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text(
                      "CURE WAYS",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Positioned(
                left: width * 0.15,
                top: height * 0.15,
                child: const Image(
                  image: AssetImage("assets/home_screen/Logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: width * .125,
                right: width * .125,
                top: height * .32,
                child: const Image(
                  image: AssetImage("assets/welcome_screen/doctor-visit 1.png"),
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                left: width * 00,
                right: width * 00,
                top: height * .70,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 50,
                              child: OutlinedButton(
                                onPressed: () async {
                                  final user = await GoogleSignInApi.login();
                                  kLogger.e(user?.photoUrl);
                                  if (user == null) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar((const SnackBar(
                                      content: Text("Sign In failed"),
                                    )));
                                  } else {
                                    auth.loginOnTap(context, user.displayName,
                                        user.email, user.photoUrl);
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  side:  const BorderSide(
                                      width: 1.0,
                                      color: kPrimaryColor),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          "assets/welcome_screen/Google.png",
                                        ),
                                        height: 40,
                                        width: 40,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Google',
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 26),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              // Positioned(
              //   top: height * .80,
              //   left: 14,
              //   child: SizedBox(
              //     width: 360.w,
              //     child: RichText(
              //         text: TextSpan(
              //             text: "Terms & Condition ",
              //             style:
              //                 TextStyle(color: kPrimaryColor, fontSize: 14.sp),
              //             recognizer: TapGestureRecognizer()
              //               ..onTap = () {
              //                 // Navigator.of(context).push(MaterialPageRoute(
              //                 //     builder: (context) =>
              //                 //         const TermsAndConditionScreen()));
              //               },
              //             children: [
              //           TextSpan(
              //             text: " And ",
              //             style: TextStyle(color: kTextColor, fontSize: 14.sp),
              //           ),
              //           TextSpan(
              //             //Disclaimer
              //             text: " Privacy Policy ",
              //             style:
              //                 TextStyle(color: kPrimaryColor, fontSize: 14.sp),
              //             recognizer: TapGestureRecognizer()
              //               ..onTap = () {
              //                 // Navigator.of(context).push(MaterialPageRoute(
              //                 //     builder: (context) =>
              //                 //         const PribacyPolicyScreen()));
              //               },
              //           ),
              //           TextSpan(
              //             text: " And ",
              //             style: TextStyle(color: kTextColor, fontSize: 14.sp),
              //           ),
              //           TextSpan(
              //             //Disclaimer
              //             text: " Disclaimer",
              //             style:
              //                 TextStyle(color: kPrimaryColor, fontSize: 14.sp),
              //             recognizer: TapGestureRecognizer()
              //               ..onTap = () {
              //                 // Navigator.of(context).push(MaterialPageRoute(
              //                 //     builder: (context) =>
              //                 //         const DisclaimerScreen()));
              //               },
              //           )
              //         ])),
              //   ),
              // )
           
           
            ],
          ),
        );
      }),
    );
  }

  // Future googleSignIn() async {
  //   final user = await GoogleSignInApi.login();
  //   if (user == null) {
  //     ScaffoldMessenger.of(context).showSnackBar((const SnackBar(
  //       content: Text("Sign In failed"),
  //     )));
  //   } else {
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => MainBoardCheck(
  //               userInfo: user,
  //             )));
  //   }
  // }
}
