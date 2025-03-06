import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthFieldSkeleton extends StatelessWidget {
  final double height;

  final double borderRadius;

  const AuthFieldSkeleton({
    Key? key,
    this.height = 56.0, // Default height matching TextFormField

    this.borderRadius = 15.0, // Matching your AuthField borderRadius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(

        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: AppPallete.darkGrey.withOpacity(0.5),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

// Usage example:
class AuthFieldsLoadingSkeleton extends StatelessWidget {
  const AuthFieldsLoadingSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Field labels (optional)
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 100,
            height: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),

        // Auth field skeleton
        const AuthFieldSkeleton(),

        const SizedBox(height: 16),

        // Second label
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 80,
            height: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),

        // Second auth field skeleton
        const AuthFieldSkeleton(),

        const SizedBox(height: 24),

        // Button skeleton
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ],
    );
  }
}