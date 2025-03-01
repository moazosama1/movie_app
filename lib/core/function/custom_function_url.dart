import 'package:movie_app/core/utils/color_app.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFunctionUrl {
  static openUrlFunction(context,
      {required String? urlItem,
      required theme,
      required mediaQueryWidth}) async {
    final String? homepage = urlItem;

    if (homepage == null || homepage.isEmpty) {
      QuickAlert.show(
          context: context,
          borderRadius: 18,
          width: mediaQueryWidth * 0.3,
          textColor: theme.colorScheme.surface,
          confirmBtnColor: ColorApp.redColor,
          type: QuickAlertType.error,
          titleColor: theme.colorScheme.surface,
          title: 'Oops...',
          text: 'Sorry, url not found',
          backgroundColor: ColorApp.backgroundApp);
      return;
    }

    final Uri url = Uri.tryParse(homepage) ?? Uri();

    if (!await canLaunchUrl(url)) {
      print("Invalid or unsupported URL: $homepage");
      return;
    }

    final bool launched = await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
    );
  }
}
