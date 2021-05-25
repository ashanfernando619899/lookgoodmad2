import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Store/storehome.dart';
import 'package:e_shop/Config/config.dart';

import 'productreviewauth.dart';



class Enterreview extends StatefulWidget {
  @override
  _Enterreview createState() => _Enterreview();
}



class _Enterreview extends State<Enterreview>
{
  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _reviewTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  final TextEditingController _cpasswordTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userImageUrl = "";
  File _imageFile;


  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,_screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [

            SizedBox(height: 8.0,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _nameTextEditingController,
                    data: Icons.person,
                    hintText: "Customer Name",
                    isObsecure: false,
                  ),

                  CustomTextField(
                    controller: _emailTextEditingController,
                    data: Icons.email,
                    hintText: "Customer Name",
                    isObsecure: false,
                  ),


                  CustomTextField(
                    controller: _reviewTextEditingController,
                    data: Icons.person,
                    hintText: "Customer Review",
                    isObsecure: false,
                  ),


                ],
              ),
            ),
            RaisedButton(
              onPressed: () {uploadAndSaveImage();},
              color: Colors.pink,
              child: Text("Publish", style: TextStyle(color: Colors.white),),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth * 0.8,
              color: Colors.pink,
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }




  Future<void>uploadAndSaveImage() async
  {


    _emailTextEditingController.text.isNotEmpty
        && _reviewTextEditingController.text.isNotEmpty
           && _nameTextEditingController.text.isNotEmpty

          ? uploadToStorage()

          :displayDialog("Please enter all the details");



  }

  displayDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (c)
        {
          return ErrorAlertDialog(message: msg,);
        }
    );
  }


  uploadToStorage() async
  {
    showDialog(
        context: context,
        builder: (c)
        {
          return LoadingAlertDialog(message: "'Publishing, Please wait....'",);
        }
    );

   /* String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

    StorageReference storageReference = FirebaseStorage.instance.ref().child(imageFileName);
    StorageUploadTask storageUploadTask = storageReference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
    await taskSnapshot.ref.getDownloadURL().then((urlImage){
      userImageUrl = urlImage;*/

      _registerUser();

    /*});*/
  }



  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerUser() async
  {
    FirebaseUser firebaseUser;
    await _auth.createUserWithEmailAndPassword
      (
      email: _emailTextEditingController.text.trim(),
      password:_reviewTextEditingController.text.trim(),
    ).then((auth){
      firebaseUser = auth.user;
    }).catchError((error){
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c)
          {
            return ErrorAlertDialog(message: error.message.toString(),);
          }

      );
    });

    if(firebaseUser != null)
    {
      saveUserInfoToFireStore(firebaseUser).then((value){
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => Authproductrev());
        Navigator.pushReplacement(context, route);
      });
    }
  }



  Future saveUserInfoToFireStore(FirebaseUser fUser) async
  {
    Firestore.instance.collection("Reviews").document(fUser.uid).setData({
      "uid": fUser.uid,
      "email": _emailTextEditingController.text.trim(),
      "name": _nameTextEditingController.text.trim(),
      "Review": _reviewTextEditingController.text.trim(),

    });

    await EcommerceApp.sharedPreferences.setString("uid", fUser.uid);
    await EcommerceApp.sharedPreferences.setString(EcommerceApp.userEmail, _emailTextEditingController.text);

    await EcommerceApp.sharedPreferences.setString(EcommerceApp.userName, _nameTextEditingController.text);
    await EcommerceApp.sharedPreferences.setString(EcommerceApp.userrev, _reviewTextEditingController.text);


  }
}

