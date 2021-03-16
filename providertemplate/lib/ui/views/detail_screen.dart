import 'package:flutter/material.dart';
import 'package:providertemplate/business_logic/view_models/chicken_screen_viewmodel.dart';

class DetailScreen extends StatelessWidget {
  static const routName = '/detail';

  @override
  Widget build(BuildContext context) {
    final ChickenPresentation args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(args.name),
            Text(args.description),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the first screen by popping the current route
                // off the stack.
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
