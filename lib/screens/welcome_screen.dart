import 'package:firebaseproject/screens/register_screen.dart';
import 'package:firebaseproject/widgets/custome_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Image.asset(
                  "assets/Sign.jpg"
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Let`s get Started",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Never a better time than now to start.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                      text: "Get Started",
                      onPressed: ()
                      {
                        Navigator.push(
                            context,
                             MaterialPageRoute(
                                builder: (context)=> const RegisterScreen()
                            )
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
