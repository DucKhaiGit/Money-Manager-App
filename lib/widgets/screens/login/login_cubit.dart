import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_manager/common/enum/load_status.dart';

import '../../../models/login.dart';
import '../../../repositories/api.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Api api;
  LoginCubit(this.api) : super(LoginState.init());

  Future<void> checkLogin(Login login ) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    var result  = await api.checkLogin(login);
    if (result) {
      emit(state.copyWith(loadStatus: LoadStatus.Done));
    } else {
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }


}
