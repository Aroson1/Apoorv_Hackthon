import 'package:flutter/material.dart';
import 'popover.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Custom Popover'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleFABPressed,
        child: const Icon(Icons.filter_alt_outlined),
      ),
    );
  }

  void _handleFABPressed() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          child: Column(
            children: [
              _buildListItem(
                context,
                title: const Text('Total Task'),
                leading: const Icon(Icons.check_circle_outline),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              _buildListItem(
                context,
                title: const Text('Due Soon'),
                leading: const Icon(Icons.inbox),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              _buildListItem(
                context,
                title: const Text('Completed'),
                leading: const Icon(Icons.check_circle),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              _buildListItem(
                context,
                title: const Text('Working On'),
                leading: const Icon(Icons.flag),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    Widget? title,
    Widget? leading,
    Widget? trailing,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (leading != null) leading,
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: DefaultTextStyle(
                style: theme.textTheme.titleLarge!,
                child: title,
              ),
            ),
          const Spacer(),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
