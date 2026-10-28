import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/exception.dart';
import 'package:fruit_hub_app/core/error/failures.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/features/auth/data/model/user_model.dart';
import 'package:fruit_hub_app/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in repo impl ${e.toString()}');
      return left(ServerFailure('حذث خطأ ما الرجال المحاولة لاحقاً'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in repo impl ${e.toString()}');
      return left(ServerFailure('حذث خطأ ما الرجال المحاولة لاحقاً'));
    }
  }
}
