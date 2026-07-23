import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/constants/app_text_style.dart';
import '../../../blocs/features/bank_details/bank_details_bloc.dart';
import '../../../models/bank_details_model.dart';
import '../edit_bank_details_screen.dart';
import 'delete_dialog.dart';

class ActionCard extends StatelessWidget {
  final BankDetailsModel bank;

  const ActionCard({
    super.key,
    required this.bank,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Edit Button
        Expanded(
          child: SizedBox(
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<BankDetailsBloc>(),
                      child: EditBankDetailsScreen(
                        bank: bank,
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit_outlined,
                size: 20,
              ),
              label: Text(
                "Edit",
                style: AppTextStyles.button.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xff0B8A47),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 14),

        /// Delete Button
        Expanded(
          child: SizedBox(
            height: 54,
            child: OutlinedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => DeleteDialog(
                    bloc: context.read<BankDetailsBloc>(),
                  ),
                );
              },
              icon: const Icon(
                Icons.delete_outline,
                size: 20,
              ),
              label: Text(
                "Delete",
                style: AppTextStyles.button.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(
                  color: Colors.red,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}