import 'package:app_music_v3/models/music_v_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class ItemMusicView extends StatelessWidget {
  final void Function() setSource;
  final void Function() play;
  final MusicVModel model;
  final ValueChanged<MusicVModel> callBack;

  const ItemMusicView({
    required this.setSource,
    required this.play,
    required this.model,
    required this.callBack,

  });

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap:(){
          play();
          callBack.call(model);
        },

        child:
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shadowColor: Colors.grey,
                  child: CachedNetworkImage(
                    imageUrl: model.imageUrl!,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(model.description!),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(model.time!),
                const SizedBox(
                  width: 20,
                ),
                Assets.icons.group.svg(),
                const SizedBox(
                  width: 30,
                ),
                Assets.icons.vector4.svg(),
              ],
            ),
            // if (model.isLoadSound!)
            //   Slider(
            //     value: 0,
            //     max: 237,
            //     onChanged: (value) {},
            //   )
          ],
        ),
      );
  }
}