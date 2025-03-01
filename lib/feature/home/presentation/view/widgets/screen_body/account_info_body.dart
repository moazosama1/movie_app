import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/error/custom_error_widget.dart';
import 'package:movie_app/core/shimmer/custom_account_info_shimmer.dart';
import 'package:movie_app/core/widgets/custom_button_large_app.dart';
import 'package:movie_app/feature/auth/presentation/view/auth_view.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/banner_widget/custom_banner_account.dart';
import 'package:movie_app/feature/home/presentation/view/widgets/custom_widget/custom_account_info.dart';
import 'package:movie_app/feature/home/presentation/view_model/cubits/account_info/account_cubit.dart';
import 'package:movie_app/feature/home/presentation/view_model/provider/main_provider.dart';
import 'package:provider/provider.dart';

class AccountInfoBody extends StatelessWidget {
  const AccountInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var cubit = BlocProvider.of<AccountCubit>(context);
    var provider = Provider.of<MainProvider>(context);

    return Stack(
      children: [
        BannerBgAccountInfo(),
        Column(
          children: [
            SizedBox(
              height: mediaQueryHeight * 0.18,
            ),
            BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                switch (state) {
                  case AccountInitial():
                    // TODO: Handle this case.
                    throw UnimplementedError();
                  case AccountSuccess():
                    return CustomAccountInfo(
                      accountModel: state.accountModel,
                    );
                  case AccountLoading():
                    return CustomAccountInfoShimmer();
                  case AccountFailure():
                    return CustomErrorWidget(
                      errorMessage: state.errorMessage,
                    );
                  case AccountAddItemLoading():
                    // TODO: Handle this case.
                    throw UnimplementedError();
                }
              },
            ),
            SizedBox(
              height: mediaQueryHeight * 0.08,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButtonLargeApp(
                  title: "Logout",
                  isLoading: provider.isLoading,
                  onTap: () async {
                    provider.customIsLoading();
                    await cubit.logoutAccount();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AuthView.routeName,
                      (route) => false,
                    );
                  },
                )),
          ],
        ),
      ],
    );
  }
}
