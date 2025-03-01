import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/custom_button_large_app.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo.dart';
import 'package:movie_app/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:movie_app/feature/auth/presentation/view/widgets/custom_bg_auth.dart';
import 'package:movie_app/feature/auth/presentation/view/widgets/custom_rich_text.dart';
import 'package:movie_app/feature/auth/presentation/view_model/cubit/auth_cubit_cubit.dart';
import 'package:movie_app/feature/home/presentation/view/home_view.dart';

class AuthBody extends StatelessWidget {
  AuthBody({super.key});
  final AuthRepo authRepo = AuthRepoImpel();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Stack(
        children: [
          CustomBgAuth(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 9,
                ),
                CustomTextRich(),
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<AuthCubit, AuthCubitState>(
                  builder: (context, state) {
                    return CustomButtonLargeApp(
                      onTap: () async {
                        await BlocProvider.of<AuthCubit>(context)
                            .authenticateUser();
                        final String? sessionId = await authRepo.getSessionId();
                        if (sessionId != null) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeView.routeName,
                            (route) => false,
                          );
                        }
                      },
                      isLoading: state is AuthCubitLoading ? true : false,
                      title: state is AuthCubitInitial
                          ? "Login"
                          : state is AuthCubitSuccess
                              ? "Success"
                              : "Failure",
                    );
                  },
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
