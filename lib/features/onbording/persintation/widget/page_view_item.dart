import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_app/constant.dart';
import 'package:fruit_hub_app/core/services/shared_preferences.dart';
import 'package:fruit_hub_app/features/auth/presentation/view/signIn_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitel,
    required this.titel,
    required this.isVisibile,
  });
  final String image, backgroundImage;
  final String subTitel;
  final Widget titel;
  final bool isVisibile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(image, fit: BoxFit.contain),
              ),

              Visibility(
                visible: isVisibile,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setBool(kIsOnBoradingViewSeen, true);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginView.routeName);
                    },
                    child: Text('تخط'),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        titel,
        SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(subTitel, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
