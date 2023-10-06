import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String selectedSize = "";
  Color selectedColor = Colors.grey;

  void _onButtonTap(String size, Color color) {
    setState(() {
      selectedSize = size;
      selectedColor = color;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $size'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Size Selector')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton("S", Colors.blue),
                _buildButton("M", Colors.green),
                _buildButton("L", Colors.orange),
                _buildButton("XL", Colors.red),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(10),
             child: Row(
               children: [
                 _buildButton("XXL", Colors.pink),
                 SizedBox(width: 15,),
                 _buildButton("XXXL", Colors.yellow),
               ],
             ),
           ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String size, Color color) {
    return ElevatedButton(
      onPressed: () => _onButtonTap(size, color),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          selectedSize == size ? color : Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(size),
      ),
    );
  }
}
