import 'package:flutter/material.dart';
import 'package:editor/editor/cubit/cubit.dart';
import 'package:spoty/spoty.dart';

/// {@template editor_body}
/// Body of the EditorPage.
///
/// Add what it does
/// {@endtemplate}
class EditorBody extends StatelessWidget {
  /// {@macro editor_body}
  const EditorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _editorCubit = BlocProvider.of<EditorCubit>(context);

    return BlocBuilder<EditorCubit, EditorState>(
      bloc: _editorCubit,
      builder: (context, state) {
        return Column(
          children: [
            SpotyImageViewer(
              imageProvider: NetworkImage(
                'https://i.postimg.cc/FKDbbNg4/Lazy-Ambolli-in-the-Dark-Woods-original.jpg',
              ),
              onTap: (offset) => _editorCubit.onPointSelected(offset: offset),
            ),
          ],
        );
      },
    );
  }
}
