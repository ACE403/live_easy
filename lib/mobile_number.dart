import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'languages.dart';
import 'otp.dart';

class MobileNumber extends StatefulWidget {
  static const routename = '/mobilenumber';

  MobileNumber({super.key});
  static String verify = '';
  static var phone = '';
  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final AmountController = TextEditingController();

  void _submitData() async {
    final enteredAmount = double.parse(AmountController.text);
    if (AmountController.text.isEmpty) {
      return;
    }
    print(MobileNumber.verify);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${'+91' + MobileNumber.phone}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        codeAutoRetrievalTimeout:
        (String verificationId) {
          // Auto-resolution timed out...
        };
        MobileNumber.verify = verificationId;
        Navigator.of(context).pushNamed(
            // arguments: SecondScreenArguments(number: MobileNumber.phone),
            Otp.routename);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        height: screenHeight,
        width: screenWidth,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'selectm'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                'changem'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              width: screenWidth,
              height: 60,
              margin: EdgeInsets.only(bottom: 25, left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/india.png',
                    fit: BoxFit.contain,
                  ),
                  Text('+91 -   '),
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: TextFormField(
                      onChanged: (value) {
                        MobileNumber.phone = value;
                      },
                      onFieldSubmitted: (_) => _submitData(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        hintText: 'Mobile Number',
                        // labelText: 'Mobile Number'
                      ),
                      cursorHeight: 25,
                      controller: AmountController,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: screenWidth,
                height: 55,
                child: ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                    primary: Color.fromRGBO(46, 59, 98, 1), // Background color
                  ),
                  child: Text('CONTINUE'),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: screenWidth,
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/images/wave.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
