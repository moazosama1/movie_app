import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFiledSearch extends StatelessWidget {
  CustomTextFiledSearch({super.key, this.onChange});
  void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextField(
      style: theme.textTheme.labelSmall,
      onChanged: onChange,
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
