import 'package:bloc/bloc.dart';
import 'package:fruit_hub_app/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hub_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => emit(SignupFailure(failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity)),
    );
  }

}
