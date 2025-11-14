import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    /*
    I'm forcing the theme so the soft blue background is obvious
    Just making it clear that it's happening outside of the Flutter canvas
    */

    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 84, 127, 255),
        brightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: theme,
      home: _AppContent(),
    );
  }
}

class _AppContent extends StatefulWidget {
  @override
  State<_AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<_AppContent> {
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 3.38.1"),
        actions: [
          Material(
            child: FilledButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text("""
Starting in Flutter 3.38.0, if you try to use the down arrow to collapse the keyboard on Android Web, the body remains. This cannot be observed in Flutter 3.35.7, the previous latest Flutter stable release.

Removing focus by clicking "Unfocus" on this page works. But if you remove focus by clicking the down arrow on the bottom of the Android system keyboard, the content never adjusts. The visible content left is from the underlying HTML document.

Changing my phone's theme from light to dark and vice-versa will get it out of this bugged state, as well as getting the keyboard to pop up again, then doing an action that causes Flutter to collapse it on it's own (ie: clicking unfocus), will work as well.
"""),
                      ),
                    );
                  },
                );
              },
              child: Text("Explanation"),
            ),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextField(
                focusNode: _focusNode,
                decoration: InputDecoration(
                  label: Text("Text field label"),
                  hint: Text(
                    "Tap here, then use the arrow",
                    // style: TextStyle(color: Color.fromARGB(255, 209, 209, 209)),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),

            // just to demonstrate that clicking this usually unbugs it
            FilledButton.icon(
              onPressed: () {
                HapticFeedback.lightImpact();
                _focusNode.unfocus();
              },
              label: Text("Unfocus"),
            ),
          ],
        ),
      ),
    );
  }
}
