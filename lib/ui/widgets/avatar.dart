// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:tickety_admission/values/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    this.firstName,
    this.lastName,
    this.backgroundColor,
    this.onTap,
  });

  final String? imageUrl;
  final String? firstName;
  final String? lastName;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String initials = '';
    if (firstName != null && lastName != null) {
      initials = '${firstName![0]}${lastName![0]}'.toUpperCase();
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: neutralColor100.withOpacity(0.25)),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(48),
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap ?? () => {},
            splashColor: neutralColor300.withOpacity(0.25),
            child: CircleAvatar(
              backgroundColor:
                  backgroundColor ?? neutralColor900.withOpacity(0.1),
              backgroundImage:
                  imageUrl != null ? NetworkImage(imageUrl!) : null,
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
            ),
          ),
        ),
      ),
    );
  }
}
