import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truck_tracking/provider/theme_provider.dart';
import 'package:truck_tracking/screens/Login_Page/login_page.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  //FOR FACEBOOK LOGIN 
  // Future<UserCredential?> signInWithFacebook() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   final userData = await FacebookAuth.instance.getUserData();
  //   if(result.status == LoginStatus.success){
  //     // Create a credential from the access token
  //     final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
  //     // Once signed in, return the UserCredential
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
      imageUrl = user.photoURL;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
      FirebaseFirestore.instance.collection('users').doc(userEmail).set({"name":name,"email":userEmail});
      print("name: $name");
      print("userEmail: $userEmail");
      print("imageUrl: $imageUrl");
    }
    return user;
  }



  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Firebase.initializeApp(options: FirebaseOptions(
       apiKey: "AIzaSyBcrfTEhQAo9luCRmo_HK4Vp3jHMJNgcEQ",
    authDomain: "fleet-vision-360.firebaseapp.com",
    projectId: "fleet-vision-360",
    storageBucket: "fleet-vision-360.appspot.com",
    messagingSenderId: "82682254498",
    appId: "1:82682254498:web:a3f2d683ea7c18ecf833fb"
    ));
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    TextEditingController _fullNameController = TextEditingController();

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
              SizedBox(height: 60,),
              BlurryContainer(
                width: 550,
                height: 595,
                blur: 5,
                elevation: 10,
                color: themeProvider.themeData.scaffoldBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text("Regsiter",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,),),
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 430,
                      child: Column(
                        children: [

                          //Full Name
                          Container(
                            padding: const EdgeInsets.only(top: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextField(
                              controller: _fullNameController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x80E3E3E3)),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),

                                prefixIcon: Icon(Icons.account_box_rounded),
                                hintText: "Enter Your Name",
                                filled: true,
                                fillColor: themeProvider.themeData.scaffoldBackgroundColor,

                              ),
                            ),
                          ),

                          SizedBox(height: 20,),
                          //Email
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x80E3E3E3)),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),

                                prefixIcon: Icon(Icons.email_rounded),
                                hintText: "Enter your email",
                                filled: true,
                                fillColor: themeProvider.themeData.scaffoldBackgroundColor,

                              ),
                            ),
                          ),


                          SizedBox(height: 20,),

                          //Password Text Field
                          
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x80E3E3E3)),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),

                                prefixIcon: Icon(Icons.lock),
                                hintText: "Enter your password",
                                filled: true,
                                fillColor: themeProvider.themeData.scaffoldBackgroundColor,

                              ),
                            ),
                          ),


                          SizedBox(height: 20,),

                          //Confirm Password
                          
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextField(
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0x80E3E3E3)),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),

                                prefixIcon: Icon(Icons.lock),
                                hintText: "Re-enter your password",
                                filled: true,
                                fillColor: themeProvider.themeData.scaffoldBackgroundColor,

                              ),
                            ),
                          ),

                          SizedBox(height: 20,),


                          //Login Page route
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                            },
                            child: Container(
                              child: Text("Already have an account? Click Here",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200,decoration: TextDecoration.underline),textAlign: TextAlign.right),

                            ),
                          ),







                          Container(
                            padding: const EdgeInsets.only(top: 25),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            alignment: Alignment.topCenter,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 6,
                                  padding: const EdgeInsets.symmetric(horizontal: 178, vertical: 22),
                                  backgroundColor: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Text(
                                  'Register',
                                  style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
                              ),
                              onPressed: () async{
                                //Registration of user
                                if(_passwordController.text == _confirmPasswordController.text){
                                  try {
                                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );

                                    FirebaseFirestore.instance.collection('users').doc(_emailController.text).set({"name":_fullNameController.text,"email":_emailController.text});

                                    print("User Registered");
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print('The password provided is too weak.');
                                    } else if (e.code == 'email-already-in-use') {
                                      print('The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                } else{
                                  print('Password not Matched');
                                }
                              },
                            ),
                          ),




                          SizedBox(height: 10,),


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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
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

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [

                    Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    ),
                    Text('Dark Mode'),
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