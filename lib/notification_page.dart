import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key, required this.receivedAction})
      : super(key: key);

  final ReceivedAction receivedAction;

  @override
  Widget build(BuildContext context) {
    bool hasLargeIcon = receivedAction.largeIconImage != null;
    bool hasBigPicture = receivedAction.bigPictureImage != null;
    double bigPictureSize = MediaQuery.of(context).size.height * .4;
    double largeIconSize =
        MediaQuery.of(context).size.height * (hasBigPicture ? .12 : .2);

    return Scaffold(
      appBar: AppBar(
        title: Text(receivedAction.title ?? receivedAction.body ?? ''),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height:
                hasBigPicture ? bigPictureSize + 40 : largeIconSize + 60,
                child: hasBigPicture
                    ? Stack(
                  children: [
                    if (hasBigPicture)
                      FadeInImage(
                        placeholder: const NetworkImage(
                            'https://cdn.syncfusion.com/content/images/common/placeholder.gif'),
                        //AssetImage('assets/images/placeholder.gif'),
                        height: bigPictureSize,
                        width: MediaQuery.of(context).size.width,
                        image: receivedAction.bigPictureImage!,
                        fit: BoxFit.cover,
                      ),
                    if (hasLargeIcon)
                      Positioned(
                        bottom: 15,
                        left: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(largeIconSize)),
                          child: FadeInImage(
                            placeholder: const NetworkImage(
                                'https://cdn.syncfusion.com/content/images/common/placeholder.gif'),
                            //AssetImage('assets/images/placeholder.gif'),
                            height: largeIconSize,
                            width: largeIconSize,
                            image: receivedAction.largeIconImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                  ],
                )
                    : Center(
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.all(Radius.circular(largeIconSize)),
                    child: FadeInImage(
                      placeholder: const NetworkImage(
                          'https://cdn.syncfusion.com/content/images/common/placeholder.gif'),
                      //AssetImage('assets/images/placeholder.gif'),
                      height: largeIconSize,
                      width: largeIconSize,
                      image: receivedAction.largeIconImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                        if (receivedAction.title?.isNotEmpty ?? false)
                          TextSpan(
                            text: receivedAction.title!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        if ((receivedAction.title?.isNotEmpty ?? false) &&
                            (receivedAction.body?.isNotEmpty ?? false))
                          TextSpan(
                            text: '\n\n',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        if (receivedAction.body?.isNotEmpty ?? false)
                          TextSpan(
                            text: receivedAction.body!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                      ]))
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Text(receivedAction.toString()),
            ),
          ],
        ),
      ),
    );
  }
}