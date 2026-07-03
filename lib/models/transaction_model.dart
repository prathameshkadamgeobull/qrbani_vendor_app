class TransactionModel {
  final String? id;
  final String title;
  final String date;
  final String time;
  final double amount;
  final bool isCredit;

  TransactionModel({
    this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.amount,
    required this.isCredit,
  });
}