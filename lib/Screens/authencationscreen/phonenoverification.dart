import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:r14firebasequizapp/widgetcustomcomponent/authbuildwidgets.dart';
import 'package:provider/provider.dart';
import 'package:r14firebasequizapp/provider/phoneverifyprovider.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LottieBuilder.asset(
                'assets/animations/phonenumberscreen.json',
                reverse: true,
                repeat: false,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Consumer<PhoneVerifyProvider>(
                  builder: (context, phonevalue, child) => Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          items: [
                            for (var i = 0;
                                i < phonevalue.countrycode.length;
                                i++)
                              DropdownMenuItem<String>(
                                value: phonevalue.countrycode[i][0],
                                child: Text(phonevalue.countrycode[i][0]),
                              ),
                          ],
                          value: phonevalue.selectedCountryCode,
                          onChanged: (String? newValue) {
                            phonevalue.updatecountrycode(newValue!);
                          },
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            phonevalue.updatephonenumber(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              custbutton(
                context,
                const Icon(Icons.person_add, color: Colors.white),
                'Send Otp',
                () async {
                  await Provider.of<PhoneVerifyProvider>(context, listen: false)
                      .verifyphonenumber(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
