import 'package:flutter/material.dart';

import '../../models/albumb_model.dart';

class ItemAlbumb extends StatelessWidget {
  const ItemAlbumb({super.key, required this.model});

  final AlbumModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 240.0,
          height: 320.0,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(255, 165, 0, 0.5).withOpacity(0.4),
                offset: const Offset(0, 20),
                // Đặt offset y là 10 để tạo hiệu ứng shadow ở phía dưới
                blurRadius: 20, 
              ),
            ],
            color: Theme.of(context).bottomAppBarColor,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(model.imageUrl!),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.only(right: 30),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(114, 237, 241, 241),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            height: 60.0,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    model.title!,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    model.description!,
                    style: const TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
