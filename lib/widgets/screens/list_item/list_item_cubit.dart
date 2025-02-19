import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_manager/models/transaction.dart';

import '../../../common/enum/load_status.dart';
import '../../../common/enum/screen_size.dart';
import '../../../repositories/api.dart';

part 'list_item_state.dart';

class ListItemCubit extends Cubit<ListItemState> {
  Api api;
  ListItemCubit(this.api) : super(ListItemState.init());

  Future<void> loadData(int monthIdx) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading, selectedMonth: monthIdx));
    try {
      var months = await api.getMonths();
      emit(state.copyWith(months: months));
      var total = await api.getTotal();
      emit(state.copyWith(total: total));
      List<Transaction> trans = months.isEmpty ? []
          : await api.getTransactions(
          state.months[state.selectedMonth],
      );
      emit(state.copyWith(trans: trans, loadStatus: LoadStatus.Done));
    }catch (ex){
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }


  Future<void> deleteItem(String dateTime) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try{
    await api.deleteTransactions(dateTime);
    await loadData(state.selectedMonth );
    }catch (ex){
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  Future<void> addItem(Transaction transaction) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try{
      await api.addTransaction(transaction);
      await loadData(state.selectedMonth );
    }catch (ex){
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  Future<void> editItem(Transaction transaction) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try{
      await api.editTransaction(transaction);
      await loadData(state.selectedMonth );
    }catch (ex){
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }

  void setScreenSize(ScreenSize screenSize) {
    emit(state.copyWith(screenSize: screenSize));
  }

  void setSelectedIdx(int selectedIdx) {
    emit(state.copyWith(selectedIdx: selectedIdx));
  }
}

