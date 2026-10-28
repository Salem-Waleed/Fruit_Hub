import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub_app/core/error/exception.dart';

class FirebaseAuthService {
  //class user here it generated with the help of firebase auth package
  Future<User> createUserWithEmailAndPassword(
    {required String email, required String password}
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService${e.toString()} ');
      if (e.code == 'weak-password') {
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      }
      else if(e.code == 'network-request-failed'){
        throw CustomException('check intenet connection');
      }
      else {
        throw CustomException('An error occurred while creating the user.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService${e.toString()} ');
      throw CustomException('An error occurred while creating the user.');
    }
   
  }
  Future<User> signInWithEmailAndPassword(
    {required String email, required String password}
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService${e.toString()} ');
      if (e.code == 'user-not-found') {
        throw CustomException('البريد الألكتروني او كلمة المرور غير صحيحة');
      } else if (e.code == 'wrong-password') {
        throw CustomException('البريد الألكتروني او كلمة المرور غير صحيحة');
      }
      else if(e.code == 'network-request-failed'){
        throw CustomException('تأكد من اتصالك بالأنترنت');
      }
      else {
        throw CustomException('An error occurred while creating the user.');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService${e.toString()} ');
      throw CustomException('An error occurred while creating the user.');
    }
   
  }


  
}
