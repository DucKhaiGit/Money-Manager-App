class Transaction {
  final String dateTime;
  final String title;
  final double amount;
  final String content;

  const Transaction({
    required this.dateTime,
    required this.title,
    required this.amount,
    required this.content,
  });

  // ✅ Chuyển object thành Map (dùng cho database hoặc local storage)
  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime,
      'title': title,
      'amount': amount,
      'content': content,
    };
  }

  // ✅ Chuyển Map thành object (dùng khi lấy dữ liệu từ database hoặc local storage)
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      dateTime: map['dateTime'] ?? '',
      title: map['title'] ?? '',
      amount: map['amount'] ?? 0.0,
      content: map['content'] ?? '',
    );
  }

  // ✅ CopyWith giúp tạo object mới với một số giá trị thay đổi
  Transaction copyWith({String? dateTime, String? title, double? amount, String? content}) {
    return Transaction(
      dateTime: dateTime ?? this.dateTime,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      content: content ?? this.content,
    );
  }

  // ✅ Override == và hashCode để so sánh object
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Transaction &&
        other.dateTime == dateTime &&
        other.title == title &&
        other.amount == amount &&
        other.content == content;
  }

  @override
  int get hashCode => dateTime.hashCode ^ title.hashCode ^ amount.hashCode ^ content.hashCode;

  // ✅ toString để debug
  @override
  String toString() =>
      'Transaction(dateTime: $dateTime, title: $title, amount: $amount, content: $content)';
}
