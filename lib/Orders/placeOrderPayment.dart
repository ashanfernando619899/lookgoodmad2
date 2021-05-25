import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Store/mentrousers.dart';
import 'package:e_shop/Store/mentshirt.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget
{
  final String addressId;
  final double totalAmount;

  PaymentPage({Key key, this.addressId,this.totalAmount,}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}




class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [Colors.black38, Colors.red],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            title: Text(
              "LookGood",
              style: TextStyle(fontSize: 55.0,color: Colors.white, fontFamily: "Signatra"),
            ),
            centerTitle: true,

            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart,color: Colors.black,),
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) => CartPage());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  Positioned(
                    child: Stack(
                      children: [
                        Icon(
                          Icons.brightness_1,
                          size: 20.0,
                          color: Colors.green,
                        ),
                        Positioned(
                          top: 3.0,
                          bottom: 4.0,
                          child: Consumer<CartItemCounter>(
                              builder: (context,counter, _)
                              {
                                return Text(
                                  (EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList).length-1).toString(),
                                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w500),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          drawer: MyDrawer(),







          body: Center(child: Column(children: <Widget>[

            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Thankyou for shopping your order will be dilliverd soon.', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),




            // ==========================================================================================================================================================








          ]
          ))
      ),
    );
  }
}

