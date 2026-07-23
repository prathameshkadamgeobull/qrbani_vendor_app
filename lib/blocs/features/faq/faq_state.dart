import 'package:equatable/equatable.dart';

import '../../../models/faq_model.dart';

abstract class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object?> get props => [];
}

/// Initial State
class FaqInitial extends FaqState {}

/// Loading State
class FaqLoading extends FaqState {}

/// Loaded State
class FaqLoaded extends FaqState {
  final List<FaqModel> faqs;
  final String selectedCategory;
  final String searchQuery;

  const FaqLoaded({
    required this.faqs,
    this.selectedCategory = "All",
    this.searchQuery = "",
  });

  FaqLoaded copyWith({
    List<FaqModel>? faqs,
    String? selectedCategory,
    String? searchQuery,
  }) {
    return FaqLoaded(
      faqs: faqs ?? this.faqs,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
    faqs,
    selectedCategory,
    searchQuery,
  ];
}

/// Error State
class FaqError extends FaqState {
  final String message;

  const FaqError(this.message);

  @override
  List<Object?> get props => [message];
}