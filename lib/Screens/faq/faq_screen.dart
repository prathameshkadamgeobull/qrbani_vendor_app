import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/features/faq/faq_bloc.dart';
import '../../../blocs/features/faq/faq_event.dart';
import '../../../blocs/features/faq/faq_state.dart';

import 'widgets/faq_search_bar.dart';
import 'widgets/faq_category_chip.dart';
import 'widgets/faq_tile.dart';
import 'widgets/empty_faq.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> categories = [
    "All",
    "Orders",
    "Animal Verification",
    "Inventory",
    "Time Slots",
    "Payouts",
    "Reports",
    "Account",
    "Notifications",
  ];

  @override
  void initState() {
    super.initState();
    context.read<FaqBloc>().add(LoadFaqs());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff0A6A3F),
        title: const Text(
          "FAQs",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: BlocBuilder<FaqBloc, FaqState>(
        builder: (context, state) {
          if (state is FaqLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FaqLoaded) {
            return Column(
              children: [

                /// Search Bar
                FaqSearchBar(
                  controller: _searchController,
                  onChanged: (value) {
                    context.read<FaqBloc>().add(
                      SearchFaqs(value),
                    );
                  },
                ),

                /// Categories
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (_, index) {
                      final category = categories[index];

                      return FaqCategoryChip(
                        title: category,
                        selected:
                        state.selectedCategory == category,
                        onTap: () {
                          context.read<FaqBloc>().add(
                            FilterFaqCategory(category),
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 8),

                /// FAQ List
                Expanded(
                  child: state.faqs.isEmpty
                      ? const EmptyFaq()
                      : ListView.builder(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemCount: state.faqs.length,
                    itemBuilder: (_, index) {
                      return FaqTile(
                        faq: state.faqs[index],
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: Text("Something went wrong"),
          );
        },
      ),
    );
  }
}