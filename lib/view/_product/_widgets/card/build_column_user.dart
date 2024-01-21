import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../home/build/feed/model/house_model.dart';

class BuildUserCard extends StatelessWidget {
  final HouseModel model;
  final isLiked;
  final Function(String id) onPressedLikedId;
  const BuildUserCard({super.key, required this.model, required this.onPressedLikedId, this.isLiked = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            child: Image.network("${model.user!.image}"),
          ),
          title: Text("${model.user!.name}"),
          subtitle: Text("${model.user?.date}"),
          trailing: IconButton(
              icon: Icon(Icons.favorite, color: isLiked ? Colors.green : Colors.blue),
              onPressed: () {
                onPressedLikedId(model.id!);
              }),
        ),
        Text(
          "${model.title}",
          style: context.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
        ),
        Text("${model.description}")
      ],
    );
  }
}
