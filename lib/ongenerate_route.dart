import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'notification_controller.dart';
import 'notification_page.dart';

const String routeHome = '/', routeNotification = '/notification-page';

List<Route<dynamic>> onGenerateInitialRoutes(String initialRouteName) {
  List<Route<dynamic>> pageStack = [];
  pageStack.add(MaterialPageRoute(
      builder: (_) =>
      const MyHomePage(title: 'Awesome Notifications Example App')));
  if (initialRouteName == routeNotification &&
      NotificationController.initialAction != null) {
    pageStack.add(MaterialPageRoute(
        builder: (_) => NotificationPage(
            receivedAction: NotificationController.initialAction!)));
  }
  return pageStack;
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeHome:
      return MaterialPageRoute(
          builder: (_) =>
          const MyHomePage(title: 'Awesome Notifications Example App'));

    case routeNotification:
      ReceivedAction receivedAction = settings.arguments as ReceivedAction;
      return MaterialPageRoute(
          builder: (_) => NotificationPage(receivedAction: receivedAction));
  }
  return null;
}