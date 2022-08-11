import 'package:brew_crew/Shared/constants.dart';
import'package:flutter/material.dart';

import '../../services/auth.dart';

    
    class Register extends StatefulWidget {

      final Function toggleView;
      Register({required this.toggleView});

      @override
      State<Register> createState() => _RegisterState();
    }
    
    class _RegisterState extends State<Register> {

      final AuthService _auth =AuthService();
      final _formKey = GlobalKey<FormState>();

      //text field state
      String email = '';
      String password = '';
      String error = '';

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            title: Text('Register For Brew Crew'),
            actions: [
              FlatButton.icon(
                onPressed: (){
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text ('Sign In'),
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key:_formKey,
              child: Column(
                children:<Widget> [
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration:textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => (val!.isEmpty && val != null)? 'Enter an e-Mail':null,
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration:textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => (val!.length < 6 && val != null)? 'Please enter a longer Password':null,
                    obscureText: true,
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Register',
                        style: TextStyle( color: Colors.white),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState!.validate()){
                          dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                          if (result == null){
                            setState(() => error = 'Please provide a valid Email');
                          }
                        };
                      },
                  ),
                  SizedBox(height: 12.0,),
                  Text(error,style: TextStyle(color:Colors.red,fontSize: 14.0))
                ],
              ),
            ),
          ),
        );
      }
    }
    