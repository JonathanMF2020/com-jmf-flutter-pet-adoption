import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/home/domain/usecases/get_account.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(this.getAccount) : super(AccountLoading()) {
    on<CheckAccountEvent>(onCheckHome);
  }
  final GetAccount getAccount;

  Future<void> onCheckHome(
      CheckAccountEvent event, Emitter<AccountState> emit) async {
    emit(AccountLoadingService());
    final dataState = await getAccount();
    if (dataState is DataSuccess) {
      if (dataState.data!.isEmpty) {
        emit(AccountUnLoad());
      }
      emit(AccountSuccess(dataState.data!));
    } else {
      emit(AccountUnLoad());
    }
  }
}
