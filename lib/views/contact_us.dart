import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_buttons.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(),
        Constants.sizedBox(height: 40.0),
        buildInputField('Full Name'),
        Constants.sizedBox(height: 20.0),
        buildInputField('Email Address'),
        Constants.sizedBox(height: 20.0),
        buildInputField('Mobile Number'),
        Constants.sizedBox(height: 20.0),
        buildInputField('Email Subject'),
        Constants.sizedBox(height: 20.0),
        buildMessageField(),
        Constants.sizedBox(height: 40.0),
        AppButtons.buildMaterialButton(
          buttonName: 'Send Message',
          onTap: () {
            // Logic to send the message can be added here
          },
        ),
        Constants.sizedBox(height: 30.0),
        buildContactMethods(),
      ],
    );
  }

  Widget buildInputField(String hintText) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      elevation: 8,
      child: TextField(
        cursorColor: AppColors.white,
        style: AppTextStyles.normalStyle(),
        decoration: buildInputDecoration(hintText: hintText),
      ),
    );
  }

  Widget buildMessageField() {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      elevation: 8,
      child: TextField(
        maxLines: 15,
        cursorColor: AppColors.white,
        style: AppTextStyles.normalStyle(),
        decoration: buildInputDecoration(hintText: 'Your Message'),
      ),
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Me!',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.comfortaaStyle(),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: AppColors.bgColor2,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    );
  }

  Widget buildContactMethods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () => launch('tel:+8801986560707'), // Replace with your number
          color: AppColors.white,
        ),
        IconButton(
          icon: const Icon(Icons.message),
          onPressed: () => launch('sms:+8801986560707'), // Replace with your number
          color: AppColors.white,
        ),
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: 'mdhasibmolla757@gmail.com', // Replace with the recipient's email
              query: 'subject=Portfolio Inquiry&body=Hello, I would like to discuss...', // Optional email subject and body
            );
            launch(emailUri.toString());
          },
          color: AppColors.white,
        ),
      ],
    );
  }
}
