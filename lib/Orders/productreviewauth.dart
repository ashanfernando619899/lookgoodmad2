import 'package:flutter/material.dart';
import 'enterreview.dart';
import 'viewreview.dart';
import 'package:e_shop/Config/config.dart';


class Authproductrev extends StatefulWidget {
  @override
  _Authproductrev createState() => _Authproductrev();
}

class _Authproductrev extends State<Authproductrev> {

  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            "Reviews",
            style: TextStyle(fontSize: 55.0,color: Colors.white, fontFamily: "Signatra"),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(

                text: "Your Review",
              ),
              Tab(

                text: "Other Reviews ",
              ),
            ],
            indicatorColor: Colors.white38,
            indicatorWeight: 5.0,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.black38, Colors.red],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

            ),
          ),
          child: TabBarView(
            children: [
              Enterreview(),
              Viewrev(),

            ],
          ),
        ),
      ),
    );
  }
}
