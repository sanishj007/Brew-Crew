import 'package:brew_crew/models/localuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user Obj from firebase user
  Localuser? _userFromFirebaseUser(User user){
    return user != null ? Localuser(uid: user.uid): null;
  }

  //auth change stream
  Stream<Localuser?> get user {
    return _auth.authStateChanges()
        .map((User user) => _userFromFirebaseUser(user!)!);
  }
  //anonymous sign in
  Future signInAnonymous() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;

    }
  }

  //email & password sign in

  //register with email and password

  //sign out


}