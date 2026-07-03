import '../../../models/transaction_model.dart';

class TransactionRepository {
  Future<List<TransactionModel>> fetchTransactions() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      TransactionModel(
        id: "QB-2034-000258",
        title: "Order Payment",
        date: "10 Jun 2024",
        time: "08:15 AM",
        amount: 650,
        isCredit: true,
      ),
      TransactionModel(
        title: "Platform Fee",
        date: "10 Jun 2024",
        time: "08:15 AM",
        amount: 32.50,
        isCredit: false,
      ),
      TransactionModel(
        id: "QB-2034-000259",
        title: "Order Payment",
        date: "10 Jun 2024",
        time: "08:20 AM",
        amount: 750,
        isCredit: true,
      ),
      TransactionModel(
        title: "Payout to Bank",
        date: "09 Jun 2024",
        time: "12:20 PM",
        amount: 15000,
        isCredit: false,
      ),
      TransactionModel(
        id: "QB-2034-000260",
        title: "Order Payment",
        date: "10 Jun 2024",
        time: "06:05 AM",
        amount: 850,
        isCredit: true,
      ),
    ];
  }
}