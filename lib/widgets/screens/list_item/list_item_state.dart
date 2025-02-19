part of 'list_item_cubit.dart';

class ListItemState {
  final List<Transaction> trans;
  final List<String> months;
  final int selectedIdx;
  final int selectedMonth;
  final double total;
  final LoadStatus loadStatus;
  final ScreenSize screenSize;

  const ListItemState.init({
     this.trans = const[],
     this.months = const[],
     this.selectedIdx = -1,
     this.selectedMonth = 0,
     this.total = 0,
     this.loadStatus = LoadStatus.Init ,
    this.screenSize = ScreenSize.Small,
  });

  @override
  String toString() {
    return 'ListItemState{' +
        ' trans: ${trans.length},' +
        ' months: ${months.length},' +
        ' selectedIdx: $selectedIdx,' +
        ' selectedMonth: $selectedMonth,' +
        ' total: $total,' +
        ' loadStatus: $loadStatus,' +
        ' screenSize: $screenSize,' +
        '}';
  }
//<editor-fold desc="Data Methods">
  const ListItemState({
    required this.trans,
    required this.months,
    required this.selectedIdx,
    required this.selectedMonth,
    required this.total,
    required this.loadStatus,
    required this.screenSize,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListItemState &&
          runtimeType == other.runtimeType &&
          trans == other.trans &&
          months == other.months &&
          selectedIdx == other.selectedIdx &&
          selectedMonth == other.selectedMonth &&
          total == other.total &&
          loadStatus == other.loadStatus &&
          screenSize == other.screenSize);

  @override
  int get hashCode =>
      trans.hashCode ^
      months.hashCode ^
      selectedIdx.hashCode ^
      selectedMonth.hashCode ^
      total.hashCode ^
      loadStatus.hashCode ^
      screenSize.hashCode;

  ListItemState copyWith({
    List<Transaction>? trans,
    List<String>? months,
    int? selectedIdx,
    int? selectedMonth,
    double? total,
    LoadStatus? loadStatus,
    ScreenSize? screenSize,
  }) {
    return ListItemState(
      trans: trans ?? this.trans,
      months: months ?? this.months,
      selectedIdx: selectedIdx ?? this.selectedIdx,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      total: total ?? this.total,
      loadStatus: loadStatus ?? this.loadStatus,
      screenSize: screenSize ?? this.screenSize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'trans': this.trans,
      'months': this.months,
      'selectedIdx': this.selectedIdx,
      'selectedMonth': this.selectedMonth,
      'total': this.total,
      'loadStatus': this.loadStatus,
      'screenSize': this.screenSize,
    };
  }

  factory ListItemState.fromMap(Map<String, dynamic> map) {
    return ListItemState(
      trans: map['trans'] as List<Transaction>,
      months: map['months'] as List<String>,
      selectedIdx: map['selectedIdx'] as int,
      selectedMonth: map['selectedMonth'] as int,
      total: map['total'] as double,
      loadStatus: map['loadStatus'] as LoadStatus,
      screenSize: map['screenSize'] as ScreenSize,
    );
  }

//</editor-fold>
}

