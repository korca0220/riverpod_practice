import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'widgets/content.dart';
import 'widgets/save_button.dart';
import 'widgets/title_heade.dart';

class NewMemo extends HookWidget {
  const NewMemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Memo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TitleHeader(titleController: titleController),
            const SizedBox(height: 20),
            ContentBody(contentController: contentController),
            const SizedBox(height: 20),
            SaveButton(
                title: titleController.text, content: contentController.text),
          ],
        ),
      ),
    );
  }
}
