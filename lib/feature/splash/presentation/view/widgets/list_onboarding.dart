import 'package:movie_app/core/utils/image_path.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/custom_onboarding_screen.dart';
import 'package:movie_app/feature/splash/presentation/view/widgets/custom_text_onboarding.dart';

List<CustomOnboardingScreen> screenOnboarding = [
  CustomOnboardingScreen(
    imagePath: ImagePath.onboarding1Image,
  ),
  CustomOnboardingScreen(
    imagePath: ImagePath.onboarding2Image,
  ),
  CustomOnboardingScreen(
    imagePath: ImagePath.onboarding3Image,
  ),
  CustomOnboardingScreen(
    imagePath: ImagePath.onboarding4Image,
  ),
];
List<CustomTextOnboarding> textOnboarding = [
  CustomTextOnboarding(
    title: "Unlimited Entertainment Awaits",
    subTitle:
        "Discover the latest movies and TV shows all in one place, with high quality and no endless searching.",
  ),
  CustomTextOnboarding(
    title: "Save Your Favorites",
    subTitle:
        "Never miss out on what you love! Add movies and series to your favorites list and watch them anytime.",
  ),
  CustomTextOnboarding(
    title: "Find What You Love, Instantly",
    subTitle:
        "Use advanced search and curated categories to quickly find the perfect movie or show for you.",
  ),
  CustomTextOnboarding(
    title: "Never Miss a New Release",
    subTitle:
        "Get notified about the latest movies and trending shows, so you're always ahead of the game.",
  ),
];
