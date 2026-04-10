import 'package:flutter/material.dart';

import 'member_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamProfileApp',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
      home: const TeamScreen(),
    );
  }
}

class MemberCard extends StatelessWidget {
  final TeamMember member;

  const MemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(member.imagePath),
          ),

          const SizedBox(height: 30),

          _buildTextBox(member.firstName),
          const SizedBox(height: 10),
          _buildTextBox(member.quote, isRed: true),
        ],
      ),
    );
  }

  Widget _buildTextBox(String text, {bool isRed = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: isRed ? Colors.red : Colors.black26),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: isRed ? Colors.red : Colors.black87,
          fontWeight: isRed ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

// 1. The Blueprint (The Widget)
class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

// 2. The Brain (The State)
class _TeamScreenState extends State<TeamScreen> {
  // This is where we define variables that will CHANGE
  final PageController _pageController = PageController();
  int _currentIndex = 0; // Remembers which member we are looking at

  // This is our data list (using your TeamMember model)
  final List<TeamMember> members = [
    TeamMember(
      firstName: "Noah",
      imagePath: "assets/images/avatar1.png",
      quote: 'I like apples!',
    ),
    TeamMember(
      firstName: "Florian",
      imagePath: "assets/images/avatar2.png",
      quote: 'I like coconuts!',
    ),
    TeamMember(
      firstName: "Waruna",
      imagePath: "assets/images/avatar3.png",
      quote: 'I like blueberries!',
    ),
    TeamMember(
      firstName: "San San",
      imagePath: "assets/images/avatar4.png",
      quote: 'I like strawberries!',
    ),
    TeamMember(
      firstName: "Nimeshika",
      imagePath: "assets/images/avatar5.png",
      quote: 'I like pineapples!',
    ),
    TeamMember(
      firstName: "Marcus",
      imagePath: "assets/images/avatar6.png",
      quote: 'I like oranges!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TEAM 8",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // The PageView.builder acts as our slider
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: members.length,
              onPageChanged: (index) {
                // This updates the dots when you swipe
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return MemberCard(member: members[index]);
              },
            ),
          ),

          // Dots Indicator
          _buildDots(),
          const SizedBox(height: 40), // Space at the bottom
        ],
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(members.length, (index) {
        return Container(
          margin: const EdgeInsets.all(4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // If the dot index matches current page, make it dark
            color: _currentIndex == index ? Colors.black87 : Colors.white,
            border: Border.all(color: Colors.black26),
          ),
        );
      }),
    );
  }
}
