import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertemplate/business_logic/view_models/chicken_screen_viewmodel.dart';
import 'package:providertemplate/services/service.locator.dart';
import 'package:providertemplate/ui/views/detail_screen.dart';
import './widgets/search_bar_widget.dart';
import './widgets/icon_with_bg_widget.dart';

class ChickenScreen extends StatefulWidget {
  @override
  _ChickenScreenState createState() => _ChickenScreenState();
}

class _ChickenScreenState extends State<ChickenScreen> {
  ChickenScreenViewModel model = serviceLocator<ChickenScreenViewModel>();

  @override
  void initState() {
    model.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChickenScreenViewModel>(
      create: (context) => model,
      child: Consumer<ChickenScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(title: Text('Chicken List'), actions: <Widget>[]),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchBarWidget(
                      width: 260,
                      inputTextController: model.inputTextController,
                    ),
                    IconWithBgWidget(
                        assetImage: 'assets/iconsRawPlay.png',
                        height: 44,
                        width: 44,
                        padding: 0,
                        bgColor: 0xffffffff,
                        onClick: () => model.submitTextInput())
                  ],
                ),
                quoteCurrencyList(model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget quoteCurrencyList(ChickenScreenViewModel model) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.allChicks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: IconWithBgWidget(
                assetImage: 'assets/audio.png',
              ),
              title: Text(model.allChicks[index].name),
              subtitle: Text(model.allChicks[index].age),
              onTap: () {
                Navigator.pushNamed(context, DetailScreen.routName,
                    arguments: model.allChicks[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
