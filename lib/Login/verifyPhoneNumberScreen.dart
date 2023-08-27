import 'dart:developer';

import 'package:fbclub/Login/pin_input_field.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Functions_common/show_toast.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  static const id = 'VerifyPhoneNumberScreen';

  final String phoneNumber;

  const VerifyPhoneNumberScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FirebasePhoneAuthHandler(
        phoneNumber: widget.phoneNumber,
        signOutOnSuccessfulVerification: false,
        linkWithExistingUser: false,
        autoRetrievalTimeOutDuration: const Duration(seconds: 60),
        otpExpirationDuration: const Duration(seconds: 60),
        onCodeSent: () {
          log(VerifyPhoneNumberScreen.id, name: 'OTP sent!');
        },
        onLoginSuccess: (userCredential, autoVerified) async {
          log(
            VerifyPhoneNumberScreen.id,
            name: autoVerified
                ? 'OTP was fetched automatically!'
                : 'OTP was verified manually!',
          );

          toastMsg('Phone number verified successfully!');

          log(
            VerifyPhoneNumberScreen.id,
            name: 'Login Success UID: ${userCredential.user?.uid}',
          );

          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   HomeScreen.id,
          //       (route) => false,
          // );
        },
        onLoginFailed: (authException, stackTrace) {
          log(
            VerifyPhoneNumberScreen.id,
            name: authException.message ?? '',
            error: authException,
            stackTrace: stackTrace,
          );

          switch (authException.code) {
            case 'invalid-phone-number':
            // invalid phone number
              return toastMsg('Invalid phone number!');
            case 'invalid-verification-code':
            // invalid otp entered
              return toastMsg('The entered OTP is invalid!');
          // handle other error codes
            default:
              toastMsg('Something went wrong!');
          // handle error further if needed
          }
        },
        onError: (error, stackTrace) {
          log(
            VerifyPhoneNumberScreen.id,
            error: error,
            stackTrace: stackTrace,
          );

          toastMsg('An error occurred!');
        },
        builder: (context, controller) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 0,
              leading: const SizedBox.shrink(),
              title: const Text('Verify Phone Number'),
              actions: [
                if (controller.codeSent)
                  TextButton(
                    onPressed: controller.isOtpExpired
                        ? () async {
                      log(VerifyPhoneNumberScreen.id, name: 'Resend OTP');
                      await controller.sendOTP();
                    }
                        : null,
                    child: Text(
                      controller.isOtpExpired
                          ? 'Resend'
                          : '${controller.otpExpirationTimeLeft.inSeconds}s',
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                const SizedBox(width: 5),
              ],
            ),
            body: controller.isSendingCode
                ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(animating: true,),
                SizedBox(height: 50),
                Center(
                  child: Text(
                    'Sending OTP',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            )
                : ListView(
              padding: const EdgeInsets.all(20),
              controller: scrollController,
              children: [
                Text(
                  "We've sent an SMS with a verification code to ${widget.phoneNumber}",
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),
                const Divider(),
                if (controller.isListeningForOtpAutoRetrieve)
                  const Column(
                    children: [
                      CupertinoActivityIndicator(animating: true,),
                      SizedBox(height: 50),
                      Text(
                        'Listening for OTP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15),
                      Divider(),
                      Text('OR', textAlign: TextAlign.center),
                      Divider(),
                    ],
                  ),
                const SizedBox(height: 15),
                const Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                PinInputField(
                  length: 6,
                  onFocusChange: (hasFocus) async {
                    if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                  },
                  onSubmit: (enteredOtp) async {
                    final verified =
                    await controller.verifyOtp(enteredOtp);
                    if (verified) {
                      // number verify success
                      // will call onLoginSuccess handler
                    } else {
                      // phone verification failed
                      // will call onLoginFailed or onError callbacks with the error
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}