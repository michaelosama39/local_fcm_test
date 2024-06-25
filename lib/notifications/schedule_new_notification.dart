import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:local_fcm_test/notifications/uitls.dart';

Future<void> scheduleNewNotification() async {
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) isAllowed = await displayNotificationRationale();
  if (!isAllowed) return;

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: -1,
      // -1 is replaced by a random number
      channelKey: 'alerts',
      title: "Huston! The eagle has landed!",
      body: "A small step for a man, but a giant leap to Flutter's community!",
      bigPicture:
          'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
      largeIcon:
          'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
      notificationLayout: NotificationLayout.BigPicture,
      payload: {'notificationId': '1234567890'},
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'REDIRECT',
        label: 'Redirect',
      ),
      NotificationActionButton(
        key: 'DISMISS',
        label: 'Dismiss',
        actionType: ActionType.DismissAction,
        isDangerousOption: true,
      )
    ],
    schedule: NotificationCalendar.fromDate(
      date: DateTime.now().add(const Duration(seconds: 10)),
    ),
  );
}
