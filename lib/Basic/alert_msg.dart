
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbclub/basic/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showAlert({required String title, required String message, required BuildContext context}) {
  showCupertinoDialog(context: context, builder: (context) {
    return CupertinoAlertDialog(
      title: Text(title, style: textTheme().titleMedium,),
      content: Text(message, style: textTheme().labelLarge,),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Feedback.forTap(context);
            Navigator.pop(context);
          },
          child: const Text('확인'),
        )
      ],
    );
  });
}

void showAlertWithImage({required String title, required String message, required String url, required BuildContext context}) {
  showCupertinoDialog(context: context, builder: (context) {
    return CupertinoAlertDialog(
      title: Text(title, style: textTheme().titleMedium,),
      content: Column(
        children: [
          Text(message, style: textTheme().labelLarge,),
          const SizedBox(height: 10,),
          CachedNetworkImage(imageUrl: url, height: 75, width: 75,)
        ],
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Feedback.forTap(context);
            Navigator.pop(context);
          },
          child: const Text('확인'),
        )
      ],
    );
  });
}

void showUpdate({required String title, required String message, required BuildContext context}) {
  showCupertinoDialog(context: context, builder: (context) {
    return CupertinoAlertDialog(
      title: Text(title, style: textTheme().titleMedium,),
      content: Text(message, style: textTheme().labelLarge,),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Feedback.forTap(context);
            launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.fleaplay.squad.flutter'));
            SystemNavigator.pop();
          },
          child: const Text('확인'),
        )
      ],
    );
  });
}

void showSelectUpdate({required String title, required String message, required BuildContext context}) {
  showCupertinoDialog(context: context, builder: (context) {
    return CupertinoAlertDialog(
      title: Text(title, style: textTheme().titleMedium,),
      content: Text(message, style: textTheme().labelLarge,),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Feedback.forTap(context);
            launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.fleaplay.squad.flutter'));
            SystemNavigator.pop();
          },
          child: const Text('지금설치'),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Feedback.forTap(context);
            Navigator.pop(context);
          },
          child: const Text('나중에'),
        )
      ],
    );
  });
}