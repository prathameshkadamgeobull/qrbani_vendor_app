// import '../../../models/bank_details_model.dart';
//
// class BankDetailsRepository {
//   BankDetailsModel _bank = const BankDetailsModel(
//     businessName: "Al Noor Slaughterhouse",
//     accountType: "Business Account",
//     verified: true,
//     bankName: "National Bank of Saudi Arabia",
//     accountHolderName: "Al Noor Slaughterhouse",
//     accountNumber: "SA42 1000 0000 1234 5678 9012",
//     accountCategory: "Business Current Account",
//     branchName: "Riyadh Main Branch",
//     iban: "SA42100000000123456789012",
//     swiftCode: "NBSASARI",
//     addedOn: "12 May 2024",
//   );
//
//   Future<BankDetailsModel> getBankDetails() async {
//     await Future.delayed(
//       const Duration(milliseconds: 500),
//     );
//
//     return _bank;
//   }
//
//   Future<void> updateBankDetails(
//       BankDetailsModel details) async {
//     await Future.delayed(
//       const Duration(milliseconds: 500),
//     );
//
//     _bank = details;
//   }
//
//   Future<void> deleteBankDetails() async {
//     await Future.delayed(
//       const Duration(milliseconds: 500),
//     );
//
//     _bank = const BankDetailsModel(
//       businessName: "",
//       accountType: "",
//       verified: false,
//       bankName: "",
//       accountHolderName: "",
//       accountNumber: "",
//       accountCategory: "",
//       branchName: "",
//       iban: "",
//       swiftCode: "",
//       addedOn: "",
//     );
//   }
// }

import '../../../models/bank_details_model.dart';

class BankDetailsRepository {

  BankDetailsModel? _bank;

  Future<BankDetailsModel?> getBankDetails() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return _bank;
  }

  Future<void> updateBankDetails(
      BankDetailsModel details) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    _bank = details;
  }

  Future<void> deleteBankDetails() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    _bank = null;
  }
}