import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/lottie_assets.dart';

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
      width: double.infinity,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _choiceTile(
            context,
            title: 'Искра',
            index: 0,
            selected: selectedIndex == 0,
          ),
          _choiceTile(
            context,
            title: 'Пульс',
            index: 1,
            selected: selectedIndex == 1,
          ),
          _choiceTile(
            context,
            title: 'Книга',
            index: 2,
            selected: selectedIndex == 2,
          ),
          _choiceTile(
            context,
            title: 'Кадр',
            index: 3,
            selected: selectedIndex == 3,
          ),
          _choiceTile(
            context,
            title: 'Звезда',
            index: 4,
            selected: selectedIndex == 4,
          ),
        ],
      ),
    );
  }

  Widget _choiceTile(
    BuildContext context, {
    required String title,
    required int index,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () => onSelected(index),
      child: Container(
        width: 62,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFEFA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFF688269) : const Color(0xFFE8E8E0),
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected
              ? [const BoxShadow(color: Color(0x1A536B55), blurRadius: 12)]
              : null,
        ),
        child: Column(
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: Lottie.asset(
                LottieAssets.animations[index],
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: selected ? const Color(0xFF526C54) : const Color(0xFF81877D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
