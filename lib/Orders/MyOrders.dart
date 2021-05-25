import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:e_shop/Models/item.dart';
import 'package:e_shop/Orders/OrderDetailsPage.dart';
import 'package:e_shop/Store/childrenshoes.dart';
import 'package:e_shop/Store/childrentrousers.dart';
import 'package:e_shop/Store/childrentshirt.dart';
import 'package:e_shop/Store/menhats.dart';
import 'package:e_shop/Store/menshoes.dart';
import 'package:e_shop/Store/mentrousers.dart';
import 'package:e_shop/Store/mentshirt.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Store/product_page.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Store/womenhats.dart';
import 'package:e_shop/Store/womenshoes.dart';
import 'package:e_shop/Store/womentrousers.dart';
import 'package:e_shop/Store/womentshirt.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:e_shop/Widgets/searchBox.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/Config/config.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../Widgets/loadingWidget.dart';
import '../Widgets/orderCard.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}



class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
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
                child: Text('Mens products', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),

            Container(
              child: new Row(

                children: <Widget>[

                  new RaisedButton(
                    child: new Text("T-shirts"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Mentshirt());
                      Navigator.pushReplacement(context, route);
                    },
                  ),


                  new RaisedButton(
                    child: new Text("Trousers"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Mentrousers());
                      Navigator.pushReplacement(context, route);
                    },
                  ),

                  new RaisedButton(
                    child: new Text("Shoes"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Menshoes());
                      Navigator.pushReplacement(context, route);
                    },
                  ),

                  new RaisedButton(
                    child: new Text("Hats"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Menhats());
                      Navigator.pushReplacement(context, route);
                    },
                  ),


                ],
              ),
            ),


           // ==========================================================================================================================================================

            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Women products', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),

            Container(
              child: new Row(

                children: <Widget>[

                  new RaisedButton(
                    child: new Text("T-shirts"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Womentshirt());
                      Navigator.pushReplacement(context, route);
                    },
                  ),


                  new RaisedButton(
                    child: new Text("Trousers"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Womentrousers());
                      Navigator.pushReplacement(context, route);
                    },
                  ),

                  new RaisedButton(
                    child: new Text("Shoes"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Womenshoes());
                      Navigator.pushReplacement(context, route);
                    },
                  ),

                  new RaisedButton(
                    child: new Text("Hats"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Womenhats());
                      Navigator.pushReplacement(context, route);
                    },
                  ),


                ],
              ),
            ),

            //===========================================================================================================================

            Container(
              margin: EdgeInsets.all(25),
              child: FlatButton(
                child: Text('Children products', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),

            Container(
              child: new Row(

                children: <Widget>[

                  new RaisedButton(
                    child: new Text("T-shirts"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Childrentshirt());
                      Navigator.pushReplacement(context, route);
                    },
                  ),


                  new RaisedButton(
                    child: new Text("Trousers"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Childrentrousers());
                      Navigator.pushReplacement(context, route);
                    },
                  ),

                  new RaisedButton(
                    child: new Text("Shoes"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Childrenshoes());
                      Navigator.pushReplacement(context, route);
                    },
                  ),

                  new RaisedButton(
                    child: new Text("Hats"),
                    color:  Colors.blueAccent[600],
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (c) =>  Womenhats());
                      Navigator.pushReplacement(context, route);
                    },
                  ),


                ],
              ),
            ),




          ]
          ))
      ),
    );
  }
}

