import 'package:flutter/material.dart';

void main() => runApp(const InfiniteScrollApp());

class InfiniteScrollApp extends StatelessWidget {
  const InfiniteScrollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InfiniteScrollList(),
    );
  }
}

class InfiniteScrollList extends StatefulWidget {
  const InfiniteScrollList({super.key});

  @override
  _InfiniteScrollListState createState() => _InfiniteScrollListState();
}

class _InfiniteScrollListState extends State<InfiniteScrollList> {
  final List<int> _items = List.generate(20, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinite Scroll')),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!scrollInfo.metrics.atEdge && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _loadMoreItems();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Item ${_items[index]}'));
          },
        ),
      ),
    );
  }

  void _loadMoreItems() {
    setState(() {
      final nextItems = List.generate(20, (index) => _items.length + index);
      _items.addAll(nextItems);
    });
  }
}