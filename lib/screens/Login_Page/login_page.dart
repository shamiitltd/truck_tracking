// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, avoid_unnecessary_containers

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_tracking/provider/theme_provider.dart';
import 'package:truck_tracking/screens/Login_Page/registration_page.dart';
import 'package:truck_tracking/screens/Login_Page/reset_password.dart';
import 'package:truck_tracking/screens/dashboard/dashboard.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  // can be used in future for facebook login 
  // Future<UserCredential?> signInWithFacebook() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   final userData = await FacebookAuth.instance.getUserData();
  //   if(result.status == LoginStatus.success){
  //     // Create a credential from the access token
  //     final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
  //     // Once signed in, return the UserCredential
  //     print(userData);
  //     String name = userData['name'];
  //     String email = userData['email'];

  //     FirebaseFirestore.instance.collection('users').doc(email).set({"name":name,"email":email});
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   }
  //   return null;
  // }





  final GoogleSignIn googleSignIn = GoogleSignIn();
  String? name, imageUrl, userEmail, uid;

  Future<User?> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    // The GoogleAuthProvider can only be
    // used while running on the web
    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
      await auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }

    if (user != null) {
      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
      FirebaseFirestore.instance.collection('users').doc(userEmail).set({"name":name,"email":userEmail});
      print("name: $name");
      print("userEmail: $userEmail");
    }
    return user;
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyBcrfTEhQAo9luCRmo_HK4Vp3jHMJNgcEQ",
    authDomain: "fleet-vision-360.firebaseapp.com",
    projectId: "fleet-vision-360",
    storageBucket: "fleet-vision-360.appspot.com",
    messagingSenderId: "82682254498",
    appId: "1:82682254498:web:a3f2d683ea7c18ecf833fb"
    )
);

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(themeProvider.backgroundImage),
            fit: BoxFit.fitWidth,
          ),
        ),
        child:Align(

          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              BlurryContainer(
                width: 550,
                height: 570,
                elevation: 10,
                color: themeProvider.themeData.scaffoldBackgroundColor,

                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Column(
                  children: [
                    const SizedBox(height: 40,),
                    const Text("Log In",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,),),
                    const SizedBox(height: 30,),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 430,
                      child: Column(
                        children: [
                          //Email
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text("Email",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),textAlign: TextAlign.left),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(

                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x80E3E3E3)),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),

                                prefixIcon: const Icon(Icons.email_rounded),
                                hintText: "Enter your email",
                                filled: true,
                                fillColor: themeProvider.themeData.scaffoldBackgroundColor,

                              ),
                            ),
                          ),


                          const SizedBox(height: 40,),

                          //Password Text Field
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text("Password",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),textAlign: TextAlign.left),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x80E3E3E3)),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),

                                prefixIcon: const Icon(Icons.lock),
                                hintText: "Enter your password",
                                filled: true,
                                fillColor: themeProvider.themeData.scaffoldBackgroundColor,

                              ),
                            ),
                          ),


                          const SizedBox(height: 20,),

                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrationPage()));
                                },
                                child: Container(
                                  child: const Text("Don't have an account? Click Here",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w200,decoration: TextDecoration.underline),textAlign: TextAlign.right),

                                ),
                              ),

                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ResetPasswordScreen()));
                                },
                                child: Container(
                                  child: const Text("Forgot Password?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w200,decoration: TextDecoration.underline),textAlign: TextAlign.right),

                                ),
                              ),
                            ],
                          ),
                          //Forgot Password
                          const SizedBox(height: 40,),






                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            alignment: Alignment.topCenter,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 6,
                                  padding: const EdgeInsets.symmetric(horizontal: 187, vertical: 22),
                                  backgroundColor: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Text(
                                  'Log In',
                                  style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
                              ),
                              onPressed: () async{
                                try {
                                  FirebaseAuth.instance.signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text
                                  );
                                  print("User Logged in");
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashboard()));
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print('Wrong password provided for that user.');
                                  }
                                }
                              },
                            ),
                          ),




                          const SizedBox(height: 10,),


                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            alignment: Alignment.topCenter,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(

                                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 22),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage("assets/login_page/images/google_logo.png"),
                                    width: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 24, right: 8),
                                    child: Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () async{
                                signInWithGoogle();
                              },
                            ),
                          ),


                          // Container(
                          //   padding: const EdgeInsets.only(top: 20),
                          //   decoration: const BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10)),
                          //   ),
                          //   alignment: Alignment.topCenter,
                          //   child: ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //         padding: const EdgeInsets.symmetric(horizontal: 89, vertical: 22),
                          //         backgroundColor: Colors.white,
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(15))),
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: const [
                          //         Image(
                          //           image: AssetImage("assets/images/facebook_logo.png"),
                          //           width: 24,
                          //         ),
                          //         Padding(
                          //           padding: EdgeInsets.only(left: 24, right: 8),
                          //           child: Text(
                          //             'Continue with Facebook',
                          //             style: TextStyle(
                          //               fontSize: 18,
                          //               color: Colors.black,
                          //               fontWeight: FontWeight.w600,
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     onPressed: () async{
                          //       // signInWithFacebook();

                          //     },
                          //   ),
                          // ),







                        ],
                      ),
                    ),


                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [

                    Switch(
                      value: themeProvider.isDarkMode,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },

                    ),
                    const Text('Dark Mode',style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),),
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