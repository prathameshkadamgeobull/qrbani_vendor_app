import 'package:equatable/equatable.dart';

class BankDetailsModel extends Equatable {
  final String businessName;
  final String accountType;
  final bool verified;

  final String bankName;
  final String accountHolderName;
  final String accountNumber;
  final String accountCategory;
  final String branchName;
  final String iban;
  final String swiftCode;
  final String addedOn;

  const BankDetailsModel({
    required this.businessName,
    required this.accountType,
    required this.verified,
    required this.bankName,
    required this.accountHolderName,
    required this.accountNumber,
    required this.accountCategory,
    required this.branchName,
    required this.iban,
    required this.swiftCode,
    required this.addedOn,
  });

  BankDetailsModel copyWith({
    String? businessName,
    String? accountType,
    bool? verified,
    String? bankName,
    String? accountHolderName,
    String? accountNumber,
    String? accountCategory,
    String? branchName,
    String? iban,
    String? swiftCode,
    String? addedOn,
  }) {
    return BankDetailsModel(
      businessName: businessName ?? this.businessName,
      accountType: accountType ?? this.accountType,
      verified: verified ?? this.verified,
      bankName: bankName ?? this.bankName,
      accountHolderName:
      accountHolderName ?? this.accountHolderName,
      accountNumber: accountNumber ?? this.accountNumber,
      accountCategory:
      accountCategory ?? this.accountCategory,
      branchName: branchName ?? this.branchName,
      iban: iban ?? this.iban,
      swiftCode: swiftCode ?? this.swiftCode,
      addedOn: addedOn ?? this.addedOn,
    );
  }

  @override
  List<Object?> get props => [
    businessName,
    accountType,
    verified,
    bankName,
    accountHolderName,
    accountNumber,
    accountCategory,
    branchName,
    iban,
    swiftCode,
    addedOn,
  ];
}