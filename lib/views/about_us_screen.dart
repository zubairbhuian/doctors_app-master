
import 'package:doctors_app/utils/const_color.dart';
import 'package:doctors_app/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AboutusScreen extends StatefulWidget {

 const AboutusScreen({Key? key}) : super(key: key);

  @override
  State<AboutusScreen> createState() => _AboutusScreenState();
}

class _AboutusScreenState extends State<AboutusScreen> {
  dynamic userName;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: Text("ABOUT US"),),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 22),
              child: Column(
                children: [
                  Text("Welcome to CureWays, your trusted partner in medical tourism and healthcare services!",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ConstantsColor.primaryColor
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("At CureWays, we are passionate about providing comprehensive and innovative solutions to make healthcare accessible and hassle-free. We understand that navigating the healthcare system can be overwhelming, especially when it involves travelling to another country or coordinating with multiple providers. That's why we are here to simplify the process and ensure a seamless experience for you.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("Our Range of Services:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ConstantsColor.primaryColor
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text.rich(
                    TextSpan(
                      text: '1. Medical Tourism:  ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'We specialize in medical tourism, connecting patients with renowned healthcare facilities and expert medical professionals worldwide. Whether you are seeking specialized treatments, surgical procedures, or advanced healthcare options, we will assist you in finding the best destinations and providers that suit your specific needs.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text.rich(
                    TextSpan(
                      text: '2.Domestic and International Doctor Appointments: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'We make it easy for you to schedule appointments with doctors, both locally and internationally. Our extensive network of trusted doctors and specialists ensures that you receive top-notch care, regardless of your location.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text.rich(
                    TextSpan(
                      text: '3.Visa Invitation Letters:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'We understand the importance of smooth travel arrangements for international patients. Our team is dedicated to assisting you with the necessary paperwork and requirements, including visa invitation letters so that you can focus on your health and well-being.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text.rich(
                    TextSpan(
                      text: '4.Health Monitoring Services:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'We offer comprehensive health monitoring services, allowing you to keep track of your health parameters from the comfort of your home. With advanced monitoring devices and user-friendly platforms, we empower you to take proactive steps towards a healthier lifestyle.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text.rich(
                    TextSpan(
                      text: '5.Service Diagnostic Labs at Home:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'We bring convenience to your doorstep with our service diagnostic labs. Our skilled professionals collect samples from your home, ensuring accuracy and reliability in test results, without the need for you to visit a lab.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text.rich(
                    TextSpan(
                      text: '6.Emergency Doctor Counseling:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'In times of medical emergencies, having access to immediate medical advice is crucial. Our emergency doctor counseling service connects you with experienced professionals who can provide timely guidance and support, helping you make informed decisions about your health.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text.rich(
                    TextSpan(
                      text: '7.Digital Health Tracking Service:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ConstantsColor.primaryColor
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Our digital health tracking service combines technology and healthcare to help you monitor and manage your health effectively. From tracking vital signs to managing medication schedules, our user-friendly platform keeps you informed and in control.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black
                          ),),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text("At CureWays, your satisfaction, safety, and personalized care are our top priorities. Our dedicated team of healthcare professionals and customer service representatives work tirelessly to ensure that you receive the highest quality of care throughout your medical journey",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black
                  ),
                  ),
                  SizedBox(height: 32,),
                  Text("We believe that everyone deserves access to world-class healthcare. Our mission is to bridge the gap between patients and exceptional healthcare services worldwide. ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text("Trust CureWays to be your partner in your pursuit of good health, and let us guide you towards a better, healthier future.",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 32,),
                  Text("Get in touch with us today to learn more about our services and embark on your journey towards optimal health and wellness with CureWays.",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 32,),
              
              
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
