import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
      debugShowCheckedModeBanner: false,
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
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: member.firstName,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(member.imagePath),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                member.firstName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                member.role,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(),
              ),
              _buildInfoRow(Icons.public, "Home", member.homeCountry),
              const SizedBox(height: 8),
              _buildInfoRow(
                Icons.theater_comedy,
                "Hobbies",
                member.hobbies.join(", "),
              ),
              const SizedBox(height: 24),
              _buildQuoteBox(context, member.quote),
              const SizedBox(height: 24),
              _PlatformButton(
                onPressed: () {},
                child: const Text("Get in touch"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blueGrey),
        const SizedBox(width: 12),
        Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(value, style: const TextStyle(color: Colors.black87)),
        ),
      ],
    );
  }

  Widget _buildQuoteBox(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "\"$text\"",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _PlatformButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _PlatformButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && Platform.isIOS) {
      return CupertinoButton.filled(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        onPressed: onPressed,
        child: child,
      );
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<TeamMember> members = [
    TeamMember(
      firstName: "Noah",
      imagePath: "assets/images/avatar1.png",
      quote: "Development is a continuous learning process.",
      homeCountry: "Finland",
      role: "Project Manger",
      hobbies: ["Coding", "Hiking", "Gaming"],
    ),
    TeamMember(
      firstName: "Florian",
      imagePath: "assets/images/avatar2.png",
      quote: "The best way to predict the future is to create it.",
      homeCountry: "Germany",
      role: "Developer",
      hobbies: ["Photography", "Design", "Skiing"],
    ),
    TeamMember(
      firstName: "Waruna",
      imagePath: "assets/images/avatar3.png",
      quote: "Quality is my top priority.",
      homeCountry: "Finland",
      role: "UI/UX Designer",
      hobbies: ["Cooking", "Travel", "Chess"],
    ),
    TeamMember(
      firstName: "San San",
      imagePath: "assets/images/avatar4.png",
      quote: "Creativity is intelligence having fun.",
      homeCountry: "Finland",
      role: "Developer",
      hobbies: ["Painting", "Music", "Reading"],
    ),
    TeamMember(
      firstName: "Nimeshika",
      imagePath: "assets/images/avatar5.png",
      quote: "Success is no accident, it's hard work.",
      homeCountry: "Finland",
      role: "Developer",
      hobbies: ["Gardening", "Baking", "Yoga"],
    ),
    TeamMember(
      firstName: "Marcus",
      imagePath: "assets/images/avatar6.png",
      quote: "Simplicity is the ultimate sophistication.",
      homeCountry: "Finland",
      role: "UI/UX Designe",
      hobbies: ["Sailing", "History", "Coffee"],
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TEAM 9",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showTeamInfo(context),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(
              "Meet the experts behind Team 9. Swipe to see our members.",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.black54),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: members.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return MemberCard(member: members[index]);
              },
            ),
          ),
          const SizedBox(height: 20),
          _buildDots(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _showTeamInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              "About Team 9",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "We are a diverse group of developers and designers working together to create amazing mobile experiences. Our mission is to combine creativity with technical excellence.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(members.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(4),
          width: _currentIndex == index ? 24 : 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: _currentIndex == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          ),
        );
      }),
    );
  }
}
