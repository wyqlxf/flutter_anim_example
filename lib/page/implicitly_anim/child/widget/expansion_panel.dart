import 'package:flutter/material.dart';
import 'package:flutter_anim_example/common/widget/appbar_widget.dart';

class ExpansionPanelListPage extends StatefulWidget {
  const ExpansionPanelListPage({super.key});

  @override
  State<ExpansionPanelListPage> createState() => _ExpansionPanelListPageState();
}

class _ExpansionPanelListPageState extends State<ExpansionPanelListPage> {
  final List<Map> _data = List<Map>.generate(5, (int index) {
    return {
      'tile': 'Panel $index',
      'content':
          'An ExpansionPanelList is a feature in Flutter that allows for the creation of a list of expandable panels. '
              'Each panel typically contains a header and a body, with the ability to expand or collapse the body when the header is tapped.',
      'is_expanded': false,
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        'ExpansionPanelList',
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        elevation: 1,
        materialGapSize: 1,
        expandedHeaderPadding: EdgeInsets.zero,
        dividerColor: Colors.grey.withOpacity(0.5),
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            for (var element in _data) {
              element['is_expanded'] = false;
            }
            _data[index]['is_expanded'] = isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Map item) {
          return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  item['tile'],
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
            },
            body: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                item['content'],
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            isExpanded: item['is_expanded'],
          );
        }).toList(),
      ),
    );
  }
}
