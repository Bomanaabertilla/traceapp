import 'package:flutter/material.dart';

class SearchBarFilter extends StatefulWidget {
  const SearchBarFilter({super.key});

  @override
  State<SearchBarFilter> createState() => _SearchBarFilterState();
}

class _SearchBarFilterState extends State<SearchBarFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: SearchBar(
        hintText: 'Search by name or ID...',
        leading: Icon(Icons.menu),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
        backgroundColor: WidgetStatePropertyAll(Color(0xffE7E8EE)),
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        trailing: [Icon(Icons.search)],
      ),
    );
  }
}
