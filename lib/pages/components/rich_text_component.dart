import 'package:flutter/material.dart';

class RichTectComponent extends StatelessWidget {
  const RichTectComponent({
    required this.highlightedLabel,
    required this.label,
    super.key,
  });

  final String highlightedLabel;
  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall,
        children: <TextSpan>[
          TextSpan(
            text: highlightedLabel,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextSpan(text: label),
        ],
      ),
    );
  }
}
