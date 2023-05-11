import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'languages.dart';
import 'mobile_number.dart';

class changeLanguage extends StatefulWidget {
  @override
  State<changeLanguage> createState() => _changeLanguageState();
}

class _changeLanguageState extends State<changeLanguage> {
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(top: 200),
        height: screenHeight,
        width: screenWidth,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Image.asset('assets/images/image.png')),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'select'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'change'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 60,
                width: 216,
                child: InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          // value: _controller.selectedLanguage?.value,
                          hint: Text('language'.tr),
                          onChanged: (symbol) {
                            _controller.changeLanguage = symbol!;
                          },
                          items: languages.map((LanguageModel _language) {
                            return DropdownMenuItem<String>(
                              value: _language.symbol,
                              child: Text(_language.language),
                            );
                          }).toList())),
                ),
              ),
            ),
            SizedBox(
              height: 55,
              width: 216,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  primary: Color.fromRGBO(46, 59, 98, 1), // Background color
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(MobileNumber.routename);
                },
                child: Text('NEXT'),
              ),
            ),
            Spacer(),
            Stack(
              children: [
                SizedBox(
                  height: 91,
                  width: screenWidth,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    'assets/images/blue.png',
                  ),
                ),
                Image.asset('assets/images/grey.png')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
