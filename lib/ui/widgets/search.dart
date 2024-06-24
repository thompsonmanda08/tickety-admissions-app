import 'package:flutter/material.dart';
import 'package:tickety_admission/values/colors.dart';

class Search extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const Search({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: neutralColor300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Search transaction...',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xFF616161),
            size: 30.0,
          ),
        ),
        onChanged: (query) {
          onSearch(query);
        },
      ),
    );
  }
}
