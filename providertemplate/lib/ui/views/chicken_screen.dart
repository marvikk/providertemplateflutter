import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertemplate/business_logic/view_models/chicken_screen_viewmodel.dart';
import 'package:providertemplate/services/service.locator.dart';

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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              quoteCurrencyList(model),
            ],
          ),
        ),
      ),
    );
  }

  Expanded quoteCurrencyList(ChickenScreenViewModel model) {
    return Expanded(
      child: ListView.builder(
        itemCount: model.allChicks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 100,
                child: Text(
                  '${model.allChicks[index].name}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              title: Text(model.allChicks[index].name),
              subtitle: Text(model.allChicks[index].age),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
