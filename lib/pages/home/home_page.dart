import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:app_music_v3/components/item/item_albumb.dart';
import 'package:app_music_v3/components/item/item_music.dart';
import 'package:app_music_v3/utils.dart';
import 'package:flutter/material.dart';

import '../../base/base_page.dart';
import '../../gen/assets.gen.dart';
import '../../generated/l10n.dart';
import 'home_viewmodel.dart';
const defaultPlayerCount = 4;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with MixinBasePage<HomeVM> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  List<AudioPlayer> audioPlayers = List.generate(
    defaultPlayerCount,
        (_) => AudioPlayer()..setReleaseMode(ReleaseMode.stop),
  );
  int selectedPlayerIdx = 0;
  List<StreamSubscription> streams = [];

  @override
  void initState() {
    super.initState();
    audioPlayers.asMap().forEach((index, player) {
      streams.add(
        player.onPlayerStateChanged.listen(
              (it) {
            switch (it) {
              case PlayerState.stopped:
                toasts(
                  'Player stopped!',
                  textKey: Key('toast-player-stopped-$index'),
                );
                break;
              case PlayerState.completed:
                toasts(
                  'Player complete!',
                  textKey: Key('toast-player-complete-$index'),
                );
                break;
              default:
                break;
            }
          },
        ),
      );
      streams.add(
        player.onSeekComplete.listen(
              (it) => toasts(
            'Seek complete!',
            textKey: Key('toast-seek-complete-$index'),
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          appBar: AppBar(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
              onTap: (){
                if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
                  _scaffoldKey.currentState?.openEndDrawer();
                } else {
                  _scaffoldKey.currentState?.openDrawer();
                }},
                child: Assets.icons.drawer.svg()

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
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
               Padding(
                padding: EdgeInsets.only(left: 30.0, top: 8.0),
                child: Text(
                  S.of(context).txt_top_album,
                  style: const TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: SizedBox(
                        height: 340,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(8),
                            itemCount: provider.listDataAlbum.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ItemAlbumb(
                                  model: provider.listDataAlbum[index]);
                            }))),
              ),
                  const SizedBox(
                    height: 20.0,
                  ),
               Padding(
                padding: EdgeInsets.only(left: 30.0, top: 8.0),
                child: Text(
                  S.of(context).txt_recommended,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: audioPlayers.isEmpty
                    ? const Text('No AudioPlayer available!')
                    : IndexedStack(
                  index: selectedPlayerIdx,
                  children: audioPlayers
                      .map(
                        (player) =>
                            Padding(
                                padding: EdgeInsets.only(left: 30.0),
                                child: SizedBox(
                                    height: 238,
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        padding: const EdgeInsets.all(8),
                                        itemCount: provider.listDataMusic.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return ItemMusic(
                                              model: provider.listDataMusic[index],
                                          player: player,);

                                        })))
                  )
                      .toList(),
                ),
              ),
            ]),
          ),
        ));
  }

  @override
  HomeVM create() {
    return HomeVM();
  }

  @override
  void initialise(BuildContext context) {}
}
