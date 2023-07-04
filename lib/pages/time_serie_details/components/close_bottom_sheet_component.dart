import 'package:flutter/material.dart';

class CloseBottomSheetComponent extends StatelessWidget {
  const CloseBottomSheetComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Theme.of(context).colorScheme.shadow,
        child: Icon(
          Icons.clear,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
