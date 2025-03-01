import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/onboarding_body.dart';
import 'package:movie_app/feature/splash/presentation/view_model/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const String routeName = kOnboardingView;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OnboardingProvider>(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Scaffold(
        body: OnboardingBody());
  }
}
