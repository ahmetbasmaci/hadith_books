import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  bool get isInSearchMode => searchText.isNotEmpty;
  TextEditingController searchController = TextEditingController();
  String searchText = '';
}
