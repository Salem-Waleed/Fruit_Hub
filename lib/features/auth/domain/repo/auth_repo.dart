import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/failures.dart';
import 'package:fruit_hub_app/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name
  );
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name
  );
}
