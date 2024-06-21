// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:tickety_admission/values/colors.dart';

class Avatar extends StatelessWidget {
  final String? imageUrl;
  final String? firstName;
  final String? lastName;

  const Avatar({
    super.key,
    this.imageUrl,
    this.firstName,
    this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    String initials = '';
    if (firstName != null && lastName != null) {
      initials = '${firstName![0]}${lastName![0]}'.toUpperCase();
    }

    return CircleAvatar(
      backgroundColor: kPrimaryColor,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(
              initials,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: neutralColor100,
              ),
            )
          : null,
      minRadius: 28,
      maxRadius: 28,
    );
  }
}
