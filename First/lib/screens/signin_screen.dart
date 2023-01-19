import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/reusable_widgets/reusable_widgets.dart';
import 'package:first/screens/home_screen.dart';
// import 'package:first/screens/signupscreen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen ({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.yellow])
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:SingleChildScrollView(
            child:Padding(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget('https://cdn.pixabay.com/photo/2015/11/26/16/28/vintage-1064142__480.png'),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Username", Icons.person_outline, false, _emailTextController),
                  SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                  signInSignUpButton(context, true, () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text, 
                        password: _passwordTextController.text).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace){
                        print("Error ${error.toString()}");
                    });
                  }),
                  // signUpOption()
                ],
              ),
            )
          )
        )
    );
  }
}
    // Row signUpOption() {
    //   return Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Text("Don't have account?", style: TextStyle(color: Colors.white70)),
    //       GestureDetector(
    //         onTap: () {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => SignUpScreen()));
    //         },
    //         child: const Text(
    //           "Sign Up",
    //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    //         ),
    //       )
    //     ],
    //   );
    // }


    Image logoWidget(String imageName){
      return Image.network(imageName, fit: BoxFit.fitWidth, width: 240, height: 240,
      );
    }
