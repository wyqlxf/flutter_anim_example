import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

class ExpansionTilePage extends StatefulWidget {
  const ExpansionTilePage({super.key});

  @override
  State<ExpansionTilePage> createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'ExpansionTile',
      ),
      body: body(),
    );
  }

  Widget body() {
    TextStyle textStyle = const TextStyle(color: Colors.black, fontSize: 16);
    return ExpansionTile(
      title: const Text('选择时间'),
      iconColor: Colors.black,
      textColor: Colors.black,
      collapsedTextColor: Colors.black,
      collapsedIconColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: const Icon(Icons.access_alarm),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      onExpansionChanged: (value) {},
      initiallyExpanded: false,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('6:00 - 9:00', style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('9:00 - 12:00', style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('12:00 - 15:00', style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('15:00 - 18:00', style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('18:00 - 21:00', style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text('21:00 - 24:00', style: textStyle),
        ),
      ],
    );
  }
}
