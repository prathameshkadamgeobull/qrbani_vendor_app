class PayoutState {

  final double availableBalance;

  final String amount;

  final bool isValid;

  const PayoutState({

    required this.availableBalance,

    required this.amount,

    required this.isValid,

  });

  factory PayoutState.initial(){

    return const PayoutState(

      availableBalance:78650,

      amount:"",

      isValid:false,

    );

  }

  PayoutState copyWith({

    double? availableBalance,

    String? amount,

    bool? isValid,

  }){

    return PayoutState(

      availableBalance:
      availableBalance ?? this.availableBalance,

      amount:
      amount ?? this.amount,

      isValid:
      isValid ?? this.isValid,

    );

  }

}