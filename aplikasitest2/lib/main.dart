import 'package:flutter/material.dart';
import 'quote.dart';
import 'card.dart';

void main() => runApp(const MaterialApp(
  home: QuotesList(),
));

class QuotesList extends StatefulWidget {
  const QuotesList({super.key});

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {

  List<Quote> quotes = [
    Quote(text: 'be yourself and mind yourself', author: 'oscar wild'),
    Quote(text: 'ignorance is a bliss', author: 'oscar wild'),
    Quote(text: 'feel good play good', author: 'oscar wild'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Awesome Quotes', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            // delete Function
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            }
        )).toList(),
      ),
    );
  }
}


