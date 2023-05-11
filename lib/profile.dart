import 'package:flutter/material.dart';

enum SingingCharacter { Shipper, Transporter }

class Profile extends StatefulWidget {
  static const routename = '/profile';
  bool isSelected = false;
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  SingingCharacter? _character = SingingCharacter.Shipper;
  late bool _isSelected;
  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Please select your profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isSelected = true;
                });
              },
              child: Container(
                  margin:
                      EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 20),
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black)),
                  child: ListTile(
                    isThreeLine: true,
                    title: Text(
                      'Shipper',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        'Lorem ipsum dolor sit amet,\n consectetur adipiscing'),
                    leading: Container(
                      width: 85,
                      child: Row(
                        children: [
                          Radio<SingingCharacter>(
                            value: SingingCharacter.Shipper,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          SizedBox(
                              width: 35,
                              child: Image.asset('assets/images/shipper.png')),
                        ],
                      ),
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isSelected = false;
                });
              },
              child: Container(
                margin:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black)),
                child: ListTile(
                  isThreeLine: true,
                  title: Text('Transporter',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'Lorem ipsum dolor sit amet,\n consectetur adipiscing'),
                  leading: Container(
                    width: 85,
                    child: Row(
                      children: [
                        Radio<SingingCharacter>(
                          value: SingingCharacter.Transporter,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                        SizedBox(
                            width: 35,
                            child:
                                Image.asset('assets/images/transporter.png')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(46, 59, 98, 1), // Background color
                ),
                child: Text(
                  'CONTINUE',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
