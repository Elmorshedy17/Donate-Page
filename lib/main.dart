import 'package:flutter/material.dart';
import 'package:scoped_angela/DonationModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'DonationModelScreen.dart';

void main() => runApp(MyApp());

DonationModel donationModel = DonationModel();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: donationModel,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DontaionModelScreen(),
      ),
    );
  }
}
