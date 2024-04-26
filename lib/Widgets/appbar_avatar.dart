import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff665bd9),
                Color(0xff7e94e5),
              ]
          )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 45
        ),
      ),
    );
  }
}