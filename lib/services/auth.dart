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
        .map((User? user) => _userFromFirebaseUser(user!)!);
  }

  //auth change user stream

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
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //register with email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}


}