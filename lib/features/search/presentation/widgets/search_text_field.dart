import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/local/l10n.dart';
import '../../../../core/core.dart';
import '../cubit/search_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().searchController,
      decoration: InputDecoration(
        labelText: AppStrings.of(AppConstants.context).search,
        border: OutlineInputBorder(),
        prefixIcon: IconButton(
          onPressed: () {
            PrinterHelper.print('search');
          },
          icon: const Icon(Icons.search),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            PrinterHelper.print('clear');
          },
          icon: const Icon(Icons.clear),
        ),
      ),
      onChanged: (value) {},
    );
  }
}

class SearchTextFieldContainer extends StatelessWidget {
  const SearchTextFieldContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //Text('ابحث عن حديث او اكتب كلمة دلالية ...', ),

          AppIcons.search,
          Text('بحث'),
        ],
      ),
    );
  }
}
