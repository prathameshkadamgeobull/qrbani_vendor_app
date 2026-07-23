import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/faq_model.dart';
import 'faq_event.dart';
import 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc() : super(FaqInitial()) {
    on<LoadFaqs>(_loadFaqs);
    on<SearchFaqs>(_searchFaqs);
    on<FilterFaqCategory>(_filterCategory);
  }

  /// Master FAQ List
  final List<FaqModel> _allFaqs = [
    // ==========================
    // Orders
    // ==========================
    const FaqModel(
      category: "Orders",
      question: "How do I accept an order?",
      answer:
      "Open Orders, select a pending order and tap 'Start Processing'. The order status will change to In Progress.",
    ),
    const FaqModel(
      category: "Orders",
      question: "How do I cancel an order?",
      answer:
      "Only pending orders can be cancelled. Open the order details and tap 'Cancel Order'.",
    ),
    const FaqModel(
      category: "Orders",
      question: "What does Pending mean?",
      answer:
      "Pending means the customer has placed the order but processing has not started.",
    ),
    const FaqModel(
      category: "Orders",
      question: "What does Completed mean?",
      answer:
      "Completed means the order has been successfully processed and closed.",
    ),

    // ==========================
    // Animal Verification
    // ==========================
    const FaqModel(
      category: "Animal Verification",
      question: "How do I scan the QR code?",
      answer:
      "Open Animal Verification and point your camera at the QR code until the animal details appear.",
    ),
    const FaqModel(
      category: "Animal Verification",
      question: "Why is my QR code not scanning?",
      answer:
      "Check the lighting, clean the camera lens, hold the phone steady and ensure the QR code isn't damaged.",
    ),

    // ==========================
    // Inventory
    // ==========================
    const FaqModel(
      category: "Inventory",
      question: "How do I add inventory?",
      answer:
      "Go to Inventory and tap Add Inventory. Enter the required details and save.",
    ),
    const FaqModel(
      category: "Inventory",
      question: "How do I edit inventory?",
      answer:
      "Open Inventory, select an item, update the information and tap Save.",
    ),
    const FaqModel(
      category: "Inventory",
      question: "Why is my inventory not visible?",
      answer:
      "Ensure the quantity is greater than zero, the item is active and your internet connection is working.",
    ),

    // ==========================
    // Time Slots
    // ==========================
    const FaqModel(
      category: "Time Slots",
      question: "How do I create a time slot?",
      answer:
      "Go to Time Slots and tap Add Time Slot. Select the time and save.",
    ),
    const FaqModel(
      category: "Time Slots",
      question: "Can I edit today's slot?",
      answer:
      "Yes, if no customer has already booked that slot.",
    ),

    // ==========================
    // Payout
    // ==========================
    const FaqModel(
      category: "Payouts",
      question: "When will I receive my payout?",
      answer:
      "Payouts are processed according to your settlement schedule. You can view the expected payout date on the Payout screen.",
    ),
    const FaqModel(
      category: "Payouts",
      question: "Why is my payout pending?",
      answer:
      "It may be pending because of settlement processing or bank verification.",
    ),
    const FaqModel(
      category: "Payouts",
      question: "How do I request a payout?",
      answer:
      "Go to the Payout screen and tap Request Payout if your available balance meets the minimum requirement.",
    ),

    // ==========================
    // Reports
    // ==========================
    const FaqModel(
      category: "Reports",
      question: "Which reports are available?",
      answer:
      "Daily Report, Order Report, Revenue Report, Inventory Report, Tax Report and Payout Report.",
    ),
    const FaqModel(
      category: "Reports",
      question: "Why are today's reports not updated?",
      answer:
      "Reports are refreshed periodically. Pull to refresh or try again after a few minutes.",
    ),

    // ==========================
    // Account
    // ==========================
    const FaqModel(
      category: "Account",
      question: "How do I update my profile?",
      answer:
      "Go to Profile, tap Edit Profile, update the details and save.",
    ),
    const FaqModel(
      category: "Account",
      question: "How do I change my password?",
      answer:
      "Go to Settings > Change Password and follow the instructions.",
    ),

    // ==========================
    // Notifications
    // ==========================
    const FaqModel(
      category: "Notifications",
      question: "Why am I not receiving notifications?",
      answer:
      "Make sure notification permission is enabled and your internet connection is active.",
    ),
  ];

  void _loadFaqs(
      LoadFaqs event,
      Emitter<FaqState> emit,
      ) {
    emit(FaqLoading());

    emit(
      FaqLoaded(
        faqs: _allFaqs,
        selectedCategory: "All",
        searchQuery: "",
      ),
    );
  }

  void _searchFaqs(
      SearchFaqs event,
      Emitter<FaqState> emit,
      ) {
    final current = state;

    if (current is! FaqLoaded) return;

    List<FaqModel> filtered = _allFaqs;

    if (current.selectedCategory != "All") {
      filtered = filtered
          .where((e) => e.category == current.selectedCategory)
          .toList();
    }

    if (event.query.isNotEmpty) {
      filtered = filtered.where((faq) {
        return faq.question
            .toLowerCase()
            .contains(event.query.toLowerCase()) ||
            faq.answer
                .toLowerCase()
                .contains(event.query.toLowerCase());
      }).toList();
    }

    emit(
      current.copyWith(
        faqs: filtered,
        searchQuery: event.query,
      ),
    );
  }

  void _filterCategory(
      FilterFaqCategory event,
      Emitter<FaqState> emit,
      ) {
    final current = state;

    if (current is! FaqLoaded) return;

    List<FaqModel> filtered = _allFaqs;

    if (event.category != "All") {
      filtered = filtered
          .where((e) => e.category == event.category)
          .toList();
    }

    if (current.searchQuery.isNotEmpty) {
      filtered = filtered.where((faq) {
        return faq.question
            .toLowerCase()
            .contains(current.searchQuery.toLowerCase()) ||
            faq.answer
                .toLowerCase()
                .contains(current.searchQuery.toLowerCase());
      }).toList();
    }

    emit(
      current.copyWith(
        faqs: filtered,
        selectedCategory: event.category,
      ),
    );
  }
}