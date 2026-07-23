import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../blocs/features/bank_details/bank_details_bloc.dart';
import '../../../blocs/features/bank_details/bank_details_event.dart';

class DeleteDialog extends StatelessWidget {
  final BankDetailsBloc bloc;

  const DeleteDialog({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      contentPadding: const EdgeInsets.fromLTRB(
        24,
        28,
        24,
        20,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Warning Icon
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 36,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Delete Bank Details?",
            textAlign: TextAlign.center,
            style: AppTextStyles.cardTitle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "Are you sure you want to remove your bank details?\nThis action cannot be undone.",
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              color: Colors.grey.shade700,
              fontSize: 15,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 28),

          Row(
            children: [

              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: AppTextStyles.button.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: ElevatedButton(
                  onPressed: () {

                    bloc.add(
                      DeleteBankDetails(),
                    );

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Bank details deleted successfully",
                        ),
                        backgroundColor: Color(0xff0B8A47),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    "Delete",
                    style: AppTextStyles.button.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}