import 'dart:developer';

import 'package:bloc/bloc.dart';

class CustomBlocObserver extends BlocObserver {

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('[BlocObserver] ${bloc.runtimeType} transition: $transition');
  }

	@override
	void onChange(BlocBase<Object?> bloc, Change<Object?> change) {
		super.onChange(bloc, change);
		log('[BlocObserver] ${bloc.runtimeType} change: $change');
	}
}
