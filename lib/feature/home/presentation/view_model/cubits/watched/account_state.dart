part of 'account_cubit.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class AccountSuccess extends AccountState {
  final AccountModel? accountModel;

  AccountSuccess({this.accountModel});
}

final class AccountLoading extends AccountState {}

final class AccountFailure extends AccountState {
  final String errorMessage;

  AccountFailure({required this.errorMessage});
}
