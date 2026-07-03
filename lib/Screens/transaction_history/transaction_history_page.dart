import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrbani_vender_app/Screens/transaction_history/widget/transaction_tile.dart';

import '../../blocs/features/transaction_history/transaction_bloc.dart';
import '../../blocs/features/transaction_history/transaction_event.dart';
import '../../blocs/features/transaction_history/transaction_state.dart';
import 'repository/transaction_repository.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryPage> createState() =>
      _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  late final TransactionBloc _bloc;

  String selectedFilter = "All Transactions";

  final List<String> filters = [
    "All Transactions",
    "Credits",
    "Debits",
  ];

  @override
  void initState() {
    super.initState();
    _bloc = TransactionBloc(TransactionRepository());
    _bloc.add(LoadTransactions());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            "Transaction History",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedFilter,
                    isExpanded: true,
                    items: filters
                        .map(
                          (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedFilter = value;
                      });
                    },
                  ),
                ),
              ),
            ),

            Expanded(
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is TransactionLoaded) {
                    var list = state.transactions;

                    if (selectedFilter == "Credits") {
                      list = list.where((e) => e.isCredit).toList();
                    } else if (selectedFilter == "Debits") {
                      list = list.where((e) => !e.isCredit).toList();
                    }

                    if (list.isEmpty) {
                      return const Center(
                        child: Text("No Transactions Found"),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return TransactionTile(
                          transaction: list[index],
                        );
                      },
                    );
                  }

                  if (state is TransactionError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}