import 'package:firebaseproject/provider/auth_provider.dart';
import 'package:firebaseproject/screens/user_information.dart';
import 'package:firebaseproject/utils/utiles.dart';
import 'package:firebaseproject/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;

  const OTPScreen({super.key, required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
        body: SafeArea(
            child: isLoading == true
                ? const Center(
              child: CircularProgressIndicator(color: Colors.purple),)
                : Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 25, horizontal: 35),
                child: SingleChildScrollView(
                    child: Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                  Container(
                    width: 200.0,
                    height: 200.0,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple.shade50),
                    child: Image.asset("assets/signUp.jpg"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Verification",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Enter the OTP send to your phone number",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.purple.shade200)
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        onSubmitted: (value)
                        {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: CustomButton(
                            text: "Verify",
                            onPressed: ()
                            {
                              if(otpCode != null)
                              {
                                verifyOtp(context, otpCode!);

                              }else{
                                showSnackBar(context, "Enter 6-Digit code");
                              }
                            }
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text(
                        "Didn't receive any code?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Resend New Code",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple
                        ),
                      )
                ])))));
  }

  void verifyOtp(BuildContext context,String userOtp)
  {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: ()
        {
            ap.checkExistingUser().then((value) async{
              if(value == true){

              }else{
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context)=> const UserInformationScreen()),
                        (route) => false
                );
              }
            });
        }
    );
  }
}
