import 'package:flutter/material.dart';
import 'package:r14firebasequizapp/widgetcustomcomponent/customwidgetcomponent.dart';

Widget custbutton(
    BuildContext context,
    Widget iconOrImage, // Icon or image for the custom button
    String buttonText, // Text for the button
    Function onPressed, // Function to execute when the button is pressed
    {Color? buttonColor}) {
  return SizedBox(
    height: 60,
    width: MediaQuery.of(context).size.width * 0.75,
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the value as needed
        ), backgroundColor: buttonColor ??
            Colors.deepPurpleAccent.shade200, // Customize the button color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconOrImage, // Either an Icon or an Image
          const SizedBox(width: 10),
          customtext(buttonText, Colors.white, 20),
        ],
      ),
    ),
  );
}

Widget customtextfield({
  required BuildContext context,
  required TextEditingController controller,
  required String hintText,
  IconData? prefixIcon,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  FormFieldValidator<String>? validator,
  ValueChanged<String>? onChanged,
  String? errorText,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    validator: validator,
    onChanged: onChanged,
    decoration: InputDecoration(
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      hintText: hintText,
      errorText: errorText, // Allow passing custom error text
    ),
  );
}

Widget dividerforloginsignup() {
  return const Row(
    children: [
      Expanded(
        child: Divider(
          color: Colors.black,
          height: 20,
        ),
      ),
      SizedBox(width: 10),
      Text(
        'or Continue with',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Divider(
          color: Colors.black,
          height: 20,
        ),
      ),
    ],
  );
}
