import 'package:flutter/cupertino.dart';
import 'package:editor/editor/cubit/cubit.dart';
import 'package:editor/editor/widgets/editor_body.dart';
import 'package:macos_ui/macos_ui.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorCubit(),
      child: const EditorView(),
    );
  }
}

class EditorView extends StatelessWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorCubit = BlocProvider.of<EditorCubit>(context);

    return MacosScaffold(
      toolBar: ToolBar(
        title: const Text('Spoty Editor'),
        titleWidth: 200.0,
        actions: [
          ToolBarIconButton(
            icon: const MacosIcon(
              CupertinoIcons.clear,
            ),
            onPressed: () => debugPrint("Delete"),
            showLabel: false,
            label: "Reset",
          ),
          ToolBarPullDownButton(
            label: "Save",
            icon: CupertinoIcons.floppy_disk,
            items: [
              MacosPulldownMenuItem(
                label: "Save Config",
                title: const Text("Save Config"),
                onTap: () => editorCubit.saveConfig(),
              ),
              MacosPulldownMenuItem(
                label: "Copy Config",
                title: const Text(
                  "Copy Config",
                ),
                onTap: () => editorCubit.copyConfig(),
              ),
            ],
          ),
        ],
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) => EditorBody(),
        ),
      ],
    );
  }
}
