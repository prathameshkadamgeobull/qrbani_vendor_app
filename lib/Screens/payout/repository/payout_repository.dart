
import '../../../models/payout_model.dart';

class PayoutRepository {

  Future<PayoutModel> getPayoutData() async {

    await Future.delayed(const Duration(seconds: 1));

    return PayoutModel(
      availableBalance: "SAR 78,650",
      nextPayout: "15 Jun 2024",
      payoutMethod: "Bank Transfer",
      bankName: "Al Rajhi Bank",
      accountNumber: "**** **** 5678",
    );
  }
}