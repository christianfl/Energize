import 'package:flutter/material.dart';

class CategoryListTileHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const CategoryListTileHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
