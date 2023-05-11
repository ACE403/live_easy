import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_easy/profile.dart';
import 'package:pinput/pinput.dart';
import 'mobile_number.dart';

// class SecondScreenArguments {
// final String number;

// SecondScreenArguments({required this.number});
// }

class Otp extends StatefulWidget {
  static const routename = '/otp';
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    const defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(46, 59, 98, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Color.fromRGBO(147, 210, 243, 1),
      ),
    );

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as SecondScreenArguments;
    var code = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'verify'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                text: 'code'.tr,
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: '  ${MobileNumber.phone}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              onChanged: (value) {
                code = value;
              },
              showCursor: true,
            ),
            const Text(
              'Did\'t receive the code?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () async {
                  print(code);
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: MobileNumber.verify, smsCode: code);

                  Navigator.of(context).pushNamed(Profile.routename);
                  await auth.signInWithCredential(credential);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(46, 59, 98, 1), // Background color
                ),
                child: Text('VERIFY AND CONTINUE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
