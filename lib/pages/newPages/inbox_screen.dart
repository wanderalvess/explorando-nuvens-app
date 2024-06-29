import 'package:explorando_clima_app/pages/component/screen_header_text.dart';
import 'package:explorando_clima_app/pages/component/simple_text_tabs.dart';
import 'package:explorando_clima_app/pages/new_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  late int activeTabIndex;

  @override
  void initState() {
    super.initState();
    activeTabIndex = 0;
  }

  setActiveTabIndex(int index) {
    setState(() {
      activeTabIndex = index;
    });
  }

  Widget _buildMessagesTab() {
    return Expanded(
      child: ListView(
        children: const [
          Text(
            'You have no unread messages',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "When you contact a host or send a reservation request, you'll see your messages here",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNotificationsTab() {
    return [
      const Expanded(
        child: Align(
          alignment: Alignment(0, -.15),
          child: Text(
            "You're all caught up",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenHeaderText(
                titleText: 'Inbox',
              ),
              const SizedBox(height: 32),
              SimpleTextTabs(
                labels: const ['Messages', 'Notifications'],
                onTabChange: setActiveTabIndex,
              ),
              const SizedBox(height: 32),
              [_buildMessagesTab(), ..._buildNotificationsTab()][activeTabIndex]
            ],
          ),
        ),
      ),
    );
  }
}