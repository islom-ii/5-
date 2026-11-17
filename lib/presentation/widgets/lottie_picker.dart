import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/lottie_assets.dart';
import '../../core/extensions/lottie_extension.dart';

class LottiePicker extends StatelessWidget {
  final int? selectedIndex;
  final ValueChanged<int?> onSelected;

  const LottiePicker({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () => onSelected(null),
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedIndex == null ? Colors.blue : Colors.grey,
                  width: selectedIndex == null ? 3 : 1,
                ),
              ),
              child: const Icon(Icons.block, color: Colors.grey),
            ),
          ),
          for (int i = 0; i < LottieAssets.animations.length; i++)
            GestureDetector(
              onTap: () => onSelected(i),
              child: Container(
                width: 70,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selectedIndex == i ? Colors.blue : Colors.grey,
                    width: selectedIndex == i ? 3 : 1,
                  ),
                ),
                child: Lottie.asset(i.lottiePath),
              ),
            ),
        ],
      ),
    );
  }
}
