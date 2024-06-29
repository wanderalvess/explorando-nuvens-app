import 'package:explorando_clima_app/pages/newPages/model_home_page.dart';
import 'package:explorando_clima_app/util/intersperse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleTextTabs extends StatefulWidget {
  const SimpleTextTabs(
      {required this.labels, required this.onTabChange, Key? key})
      : super(key: key);

  final List<String> labels;
  final Function(int) onTabChange;

  @override
  State<SimpleTextTabs> createState() => _SimpleTextTabsState();
}

class _SimpleTextTabsState extends State<SimpleTextTabs> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  callback() {
    // if (widget.onTabChange != null)
    widget.onTabChange(selectedIndex);
  }

  setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    callback();
  }

  Widget _buildIndividualTab({required String label, Function()? onTap}) {
    int indexOfLabel = widget.labels.indexOf(label);
    bool isActive = selectedIndex == indexOfLabel;

    return GestureDetector(
      onTap: () {
        setSelectedIndex(indexOfLabel);
      },
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          border: isActive
              ? const Border(
            bottom: BorderSide(
              width: 2,
            ),
          )
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.black : Colors.black.withOpacity(.6),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextTabs() {
    return widget.labels.map((label) {
      return _buildIndividualTab(
          label: label,
          onTap: () {
            setSelectedIndex(widget.labels.indexOf(label));
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: intersperse(
            const SizedBox(width: 24),
            _buildTextTabs(),
          ).toList(),
        ),
        const Divider(height: 0, thickness: 1),
      ],
    );
  }
}