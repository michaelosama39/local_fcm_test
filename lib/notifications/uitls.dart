import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:local_fcm_test/main.dart';

///  *********************************************
///     REQUESTING NOTIFICATION PERMISSIONS
///  *********************************************
///
Future<bool> displayNotificationRationale() async {
  bool userAuthorized = false;
  BuildContext context = MyApp.navigatorKey.currentContext!;
  await showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('Get Notified!',
              style: Theme.of(context).textTheme.titleLarge),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/animated-bell.gif',
                      height: MediaQuery.of(context).size.height * 0.3,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                  'Allow Awesome Notifications to send you beautiful notifications!'),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Deny',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.red),
                )),
            TextButton(
                onPressed: () async {
                  userAuthorized = true;
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  'Allow',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.deepPurple),
                )),
          ],
        );
      });
  return userAuthorized &&
      await AwesomeNotifications().requestPermissionToSendNotifications();
}
