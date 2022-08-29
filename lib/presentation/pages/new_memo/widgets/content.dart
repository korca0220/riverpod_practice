import 'package:flutter/material.dart';

class ContentBody extends StatelessWidget {
  const ContentBody({
    Key? key,
    required this.contentController,
  }) : super(key: key);

  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(child: Text('Content')),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(8),
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: contentController,
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
