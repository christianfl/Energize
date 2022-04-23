import 'package:flutter/material.dart';

class CategoryListTileHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const CategoryListTileHeader({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

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
