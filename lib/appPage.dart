import 'package:apexpositionapp/presentation/MainServise/MainServicePage.dart';
import 'package:apexpositionapp/widgets/LoadingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'appModel.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AppModel>(
        create: (_) => AppModel(),
        child: Consumer<AppModel>(
          builder: (context, model, child) {
            return Scaffold(
                resizeToAvoidBottomPadding: false,
                body: model.isLoading
                    ? LoadingPage()
                    : MainServicePage(model.LoginState));
          },
        ),
      ),
    );
  }
}
