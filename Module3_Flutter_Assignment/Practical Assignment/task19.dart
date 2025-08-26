import 'package:flutter/material.dart';

void main() => runApp(const SearchApp());

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Search Bar')),
        body: const SearchBar(),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _suggestions = ['Apple', 'Banana', 'Cherry', 'Date'];
  List<String> _filteredSuggestions = [];

  void _filterSuggestions(String query) {
    setState(() {
      _filteredSuggestions = _suggestions
          .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          onChanged: _filterSuggestions,
          decoration: const InputDecoration(labelText: 'Search'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredSuggestions.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(_filteredSuggestions[index]));
            },
          ),
        ),
      ],
    );
  }
}