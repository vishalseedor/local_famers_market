import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget _NameTextField(String _name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Full Name',
        //  style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          height: 60.0,
          child: TextFormField(
          //  autovalidate: false,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: 'Enter your Full Name',
           //   hintStyle: kHintTextStyle,
            ),
            // initialValue: _name,
            // validator: (String value) {
            //   if (value.isEmpty) {
            //     return 'Name is Required.';
            //   }
            //   if (value.length < 3) {
            //     return 'Name must be more than 2 charater';
            //   }
            //   return null;
            // },
            // onSaved: (String value) {
            //   return _name = value;
            // },
          ),
        ),
          Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          height: 60.0,
          child: TextFormField(
          //  autovalidate: false,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: 'Enter your Full Name',
           //   hintStyle: kHintTextStyle,
            ),
            // initialValue: _name,
            // validator: (String value) {
            //   if (value.isEmpty) {
            //     return 'Name is Required.';
            //   }
            //   if (value.length < 3) {
            //     return 'Name must be more than 2 charater';
            //   }
            //   return null;
            // },
            // onSaved: (String value) {
            //   return _name = value;
            // },
          ),
        ),
        
      ],
    );
  }

  Widget _NICTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'NIC No:',
         // style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.text,
           // autovalidate: false,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.assignment_ind,
                color: Colors.white,
              ),
              hintText: 'Enter your NIC Number',
            //   hintStyle: kHintTextStyle,
            // ),
            // validator: (String value) {
            //   if (value.isEmpty) {
            //     return 'NIC is Required.';
            //   }
            //   return null;
            // },
            // onSaved: (String value) {
            //   return _nic = value;
            // },
          ),
        ),)
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon:Icon(Icons.close),
          onPressed:() => Navigator.of(context).pop(null),
        ),
        centerTitle: true ,
        title: Text('Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: ()async{
              print('Profile Updated!!!');
            },
            child: Container(
              padding: EdgeInsets.only(top: 17, right: 25),
              child: Text(
                'SAVE',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
      //  value: SystemUiOverlayStyle.light,
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 5.0,
                  ),
                  child: Form(
                  //  key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 15.0),
                        // imageAvatar,
                        // _NameTextField(_name),
                        SizedBox(
                          height: 15.0,
                        ),
                        _NICTextField(),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}