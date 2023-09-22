import 'package:flutter/material.dart';
import 'package:motion/motion.dart';

Future<void> showPermissionRequestDialog(BuildContext context,
    {required Function() onDone}) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog.adaptive(
            title: const Text('Permission required'),
            content: const Text(
                'On iOS 13+, you need to grant access to the gyroscope. A permission will be requested to proceed.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Motion.instance.requestPermission();
                },
                child: const Text('OK'),
              ),
            ],
          ));
}
