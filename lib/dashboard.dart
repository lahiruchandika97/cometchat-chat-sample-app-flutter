import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';
import 'package:cometchat_flutter_sample_app/call_logs/call_logs_dashboard.dart';
import 'package:cometchat_flutter_sample_app/calls/calls_dashboard.dart';
import 'package:cometchat_flutter_sample_app/conversations_dashboard.dart';
import 'package:cometchat_flutter_sample_app/conversations_with_messages/conversations_with_mesages_module.dart';
import 'package:cometchat_flutter_sample_app/groups_dashboard.dart';
import 'package:cometchat_flutter_sample_app/messages_dashboard.dart';
import 'package:cometchat_flutter_sample_app/shared/shared_dashboard.dart';
import 'package:cometchat_flutter_sample_app/users_dashboard.dart';
import 'package:cometchat_flutter_sample_app/utils/alert.dart';
import 'package:cometchat_flutter_sample_app/utils/module_card.dart';
import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const CometChatConversationsWithMessages(), // Messages
    CometChatCallLogsWithDetails(), // Call Logs
    CometChatDetails(
        user: User(
            name: 'Kevin',
            uid: 'UID233',
            avatar:
                "https://data-us.cometchat.io/assets/images/avatars/spiderman.png",
            role: "test",
            status: "online",
            statusMessage: "This is now status")), // Profile
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: _children[_currentIndex], // Display the selected widget
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // Update the state and change the widget
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.call),
            label: 'Call Logs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Future<void> logout() async {
    await CometChatUIKit.logout();
  }
}
