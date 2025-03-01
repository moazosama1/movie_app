import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/core/widgets/custom_button_onboarding.dart';
import 'package:movie_app/feature/auth/presentation/view/auth_view.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/custom_button_skip_onboarding.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/list_onboarding.dart';
import 'package:movie_app/feature/splash/presentation/view_model/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});
  static const String routeName = kOnboardingView;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OnboardingProvider>(context);
    var theme = Theme.of(context);

    return Stack(
      children: [
        PageView.builder(
          controller: provider.pageController,
          onPageChanged: provider.updateIndex,
          itemCount: screenOnboarding.length,
          itemBuilder: (context, index) {
            return screenOnboarding[index];
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButtonSkipOnboarding(
                onTap: provider.skipToLastPage,
              ),
              const Spacer(),
              Column(
                children: [
                  textOnboarding[provider.initialIndex],
                  const SizedBox(height: 20),
                  CustomButtonOnboarding(
                    title: provider.isLastScreen ? "Go to Login" : "Continue",
                    onTap: () async {
                      if (provider.isLastScreen) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AuthView.routeName,
                          (route) => false,
                        );
                      } else {
                        provider.nextPage();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  SmoothPageIndicator(
                    controller: provider.pageController,
                    count: screenOnboarding.length,
                    effect: ExpandingDotsEffect(
                      spacing: 10,
                      expansionFactor: 2,
                      radius: 10.0,
                      dotWidth: 10.0,
                      dotHeight: 7.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.0,
                      dotColor: Colors.grey.shade700,
                      activeDotColor: theme.colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
