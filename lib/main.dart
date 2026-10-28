import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_app/core/helper_function/on_generate_rauts.dart';
import 'package:fruit_hub_app/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/core/services/shared_preferences.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/features/splash/persntation/view/splash_view.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
Bloc.observer = CustomBlocObserver();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await Prefs.init();
  setupGetIt();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        scaffoldBackgroundColor: Colors.white,  
      ),
      

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''), // العربية أولاً
        Locale('en', ''), // الإنجليزية
      ],
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
