import 'package:flutter/material.dart';
import 'package:editor/editor/cubit/cubit.dart';
import 'package:editor/editor/widgets/editor_body.dart';

class EditorView extends StatelessWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorCubit(),
      child: const Scaffold(
        body: EditorBody(),
      ),
    );
  }
}
