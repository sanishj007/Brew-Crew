import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/localuser.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Localuser?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
