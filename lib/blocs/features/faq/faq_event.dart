import 'package:equatable/equatable.dart';

abstract class FaqEvent extends Equatable {
  const FaqEvent();

  @override
  List<Object?> get props => [];
}

/// Load all FAQs
class LoadFaqs extends FaqEvent {}

/// Search FAQs
class SearchFaqs extends FaqEvent {
  final String query;

  const SearchFaqs(this.query);

  @override
  List<Object?> get props => [query];
}

/// Filter FAQs by category
class FilterFaqCategory extends FaqEvent {
  final String category;

  const FilterFaqCategory(this.category);

  @override
  List<Object?> get props => [category];
}