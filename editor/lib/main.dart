import 'package:editor/editor/editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:spoty/spoty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MacosApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: const [],
      body: MacosWindow(
        sidebar: Sidebar(
          minWidth: 200,
          isResizable: false,
          builder: (context, controller) {
            return SidebarItems(
              currentIndex: 0,
              onChanged: (i) => {},
              scrollController: controller,
              itemSize: SidebarItemSize.large,
              items: const [
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.pen),
                  label: Text('Editor'),
                ),
              ],
            );
          },
        ),
        child: const EditorView(),
      ),
    );
  }
}
