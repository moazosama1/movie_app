import 'package:flutter/material.dart';

class CustomTextFiledSearch extends StatelessWidget {
  const CustomTextFiledSearch({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(
      style: theme.textTheme.labelSmall,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: theme.textTheme.labelMedium,
        suffixIcon: Icon(
          Icons.search,
          color: theme.colorScheme.surface,
          size: 30,
        ),
        border: methodStyleSearchBorder(theme),
        enabledBorder: methodStyleSearchBorder(theme),
        focusedBorder: methodStyleSearchBorder(theme),
      ),
    );
  }

  OutlineInputBorder methodStyleSearchBorder(ThemeData theme) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: theme.colorScheme.outline),
    );
  }
}
