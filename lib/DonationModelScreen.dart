import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_angela/DonationModel.dart';
import 'package:scoped_model/scoped_model.dart';

class DontaionModelScreen extends StatefulWidget {
  @override
  _DontaionModelScreenState createState() => _DontaionModelScreenState();
}

class _DontaionModelScreenState extends State<DontaionModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/mouse.jpg'),
        ),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              shadowColor: Color(0x802196f3),
              child: ScopedModelDescendant<DonationModel>(
builder: (context,child,model){
  if(model.donateClicked){
    return _buildContent(model);
  }else{
    return _buildInitContent(model);
  }
},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitContent(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 280.0,
        child: Column(
          children: <Widget>[
            _titleContainer(),
            _priceContainer(model),
            _donateContainer(model),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 280.0,
        child: Column(
          children: <Widget>[
            _thankYouContent(model),
            _backBotton(model),
          ],
        ),
      ),
    );
  }

  Widget _backBotton(DonationModel model) {
    return Container(
      padding:
          EdgeInsets.only(right: 10.0, bottom: 10.0, top: 25.0, left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.pets,
            size: 30.0,
            color: Color(0xffdd6b3d),
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            onPressed: () {
            model.donateClicked= false;
              },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            textColor: Colors.white,
            color: Color(0xffdd6b3d),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Donate More',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Icon(
            Icons.pets,
            size: 30.0,
            color: Color(0xffdd6b3d),
          ),
        ],
      ),
    );
  }

  Widget _thankYouContent(DonationModel model) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.pets,
            size: 40.0,
            color: Colors.black,
          ),
          Text(
            'STEWARD says',
            style: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'thank you for donating \u0024 ${model.count}',
            style: TextStyle(color: Color(0xffdd6b3d), fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  Widget _titleContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 20.0, bottom: 10.0, right: 10.0, left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'STEWARD',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Some dummy text here !!!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(
              'Cancel',
              style: TextStyle(color: Color(0xffdd6b3d), fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceContainer(DonationModel model) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              model.decrement();
            },
            child: Icon(
              Icons.remove,
              color: Color(0xffdd6b3d),
              size: 30.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Color(0xffFaF4F2),
            padding: EdgeInsets.all(14.0),
          ),
          Text(
            '\u0024 ${model.count}',
            style: TextStyle(color: Colors.black, fontSize: 44.0),
          ),
          RawMaterialButton(
            onPressed: () {
              model.increment();
            },
            child: Icon(
              Icons.add,
              color: Color(0xffdd6b3d),
              size: 30.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Color(0xffFaF4F2),
            padding: EdgeInsets.all(14.0),
          ),
        ],
      ),
    );
  }

  Widget _donateContainer(DonationModel model) {
    return Container(
      padding:
          EdgeInsets.only(right: 10.0, bottom: 10.0, top: 25.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              model.donateClicked=true;
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            textColor: Colors.white,
            color: Color(0xffdd6b3d),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Donate',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Icon(
                    Icons.pets,
                    size: 30.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
