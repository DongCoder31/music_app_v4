import 'dart:math';

import 'package:audio_progress_bars/audio_progress_bars.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:app_music_v3/models/albumb_model.dart';
import 'package:app_music_v3/models/music_v_model.dart';
import 'package:app_music_v3/pages/detail/detail_viewmodel.dart';
import 'package:app_music_v3/pages/detail/widget/item_music_widget.dart';
import 'package:app_music_v3/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../gen/assets.gen.dart';
import '../../base/base_page.dart';
import '../../components/playing_widget.dart';
import '../../generated/l10n.dart';
import '../home/home_viewmodel.dart';

class DetailAlbumbScreen extends StatefulWidget {
  const DetailAlbumbScreen({super.key, required this.model, required this.player});

  final AlbumModel model;
  final AudioPlayer player;

  @override
  State<DetailAlbumbScreen> createState() => _DetailAlbumbScreenState();
}

class _DetailAlbumbScreenState extends State<DetailAlbumbScreen>
    with MixinBasePage<HomeVM> {

  AudioPlayer get player => widget.player;


  bool selected = true;
  Future<void> _setSource(Source source) async {
    await player.setSource(source);
    toasts(
      'Completed setting source.',
      textKey: const Key('toast-set-source'),
    );
  }

  Future<void> _play(Source source, ) async {
    await player.stop();
    await player.play(source);
    toasts(
      'Set and playing source.',
      textKey: const Key('toast-set-play'),
    );
  }
 
  final List<double> values = [];

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var rng = Random();
    for (var i = 0; i < 100; i++) {
      values.add(rng.nextInt(70) * 1.0);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 30),
          child: Assets.icons.drawer.svg(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 29),
            child: Assets.icons.search.svg(),
          )
        ],
        title:  Text(
          S.of(context).txt_music_play,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
      body: Stack(children: [
        Container(
          width: width,
          height: height / 2.4,
          decoration: const BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(1000),
                  bottomLeft: Radius.circular(1000))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
                height: 280,
                child: Container(
                  width: 240.0,
                  height: 285.0,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(255, 165, 0, 0.5)
                            .withOpacity(0.4),
                        offset: const Offset(0, 20),
                        // Đặt offset y là 10 để tạo hiệu ứng shadow ở phía dưới
                        blurRadius: 20, 
                      ),
                    ],
                    color: Theme.of(context).bottomAppBarColor,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(widget.model.imageUrl.toString()),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              widget.model.title.toString(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.model.description.toString(),
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              ),
            ),
              const SizedBox(
              height: 10.0,
            ),
            // PlayerWidget(player: player),
             AudioProgressBars(
                progressPercentage: 20,
                listOfHeights: values,
                width: queryData.size.width -60.0,
                initalColor: Colors.grey,
                progressColor: Colors.yellow,
                backgroundColor: Colors.white,
                timeInMilliSeconds: 2000,
                isHorizontallyAnimated: true,
                isVerticallyAnimated: true,

              ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 30, bottom: 8.0),
              child:  Text(
                S.of(context).txt_recommended,
                style: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 10),
                child: Selector<DetailMusicViewModel, List<MusicVModel>>(
                  selector: (_, vm) => vm.listDataMusicV,
                  shouldRebuild: (data1, data2) => true,
                  builder: (_, data, __) {
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder:  (BuildContext context, int index) {
                          return   ItemMusicView(
                            setSource: () => _setSource(UrlSource(data[index].pathMusic!)),
                            play: () => _play(UrlSource(data[index].pathMusic!)),
                            model: data[index],
                            callBack: (MusicVModel value) {
                              setState(() {
                                selected = !selected;
                              });
                            },
                          );
                        });
                  },
                ),
              ),
            ),

          ],
        ),
        AnimatedPositioned(
          width: MediaQuery.of(context).size.width,
          height: selected ? 0.0 : 60.0,
          bottom: selected ? 0.0 : 0.0,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Container(
            height: 60.0,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(205, 197, 197, 0.51),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child:
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Image.asset(
                            widget.model.imageUrl!,
                            fit: BoxFit.cover,
                          )),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 14.0, top: 8.0, bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The last best3',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Text('jack'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PlayingWidget(player: player,)
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  create() {
    return HomeVM();
  }

  @override
  void initialise(BuildContext context) {}
}
