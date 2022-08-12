import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.red,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) => ListTile(
                    title: Text('Item $index'),
                  )),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
