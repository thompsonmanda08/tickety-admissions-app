import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:tickety_admission/values/colors.dart';

class SearchableDropdownMenu extends StatelessWidget {
  const SearchableDropdownMenu({
    super.key,
    required this.searchableItems,
    this.handleSelectItem,
    this.leading,
    this.trailing,
    this.hintText = "Search...",
  });

  final Function(SearchFieldListItem<dynamic>)? handleSelectItem;
  final List<String> searchableItems;
  final String hintText;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SearchField(
      hint: hintText,
      searchStyle: const TextStyle(
        color: primaryColor900,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      searchInputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          top: 30,
          bottom: 0,
          left: 15,
          right: 5,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: neutralColor600,
          ),
        ),
      ),
      itemHeight: 48,
      onSuggestionTap: handleSelectItem,
      suggestions: searchableItems
          .map(
            (searchableItem) => SearchFieldListItem(
              searchableItem,
              item: searchableItem,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: trailing != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: [
                    leading ?? const SizedBox.shrink(),
                    Text(
                      searchableItem,
                      style: const TextStyle(
                        color: primaryColor900,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing ?? const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}