import 'package:app_music_v3/models/music_v_model.dart';
import 'package:flutter/cupertino.dart';
import '../../base/base_viewmodel.dart';

class DetailMusicViewModel extends BaseViewModel {
  List<MusicVModel> listDataMusicV = [];

  @override
  void onInit() {
    fetchMusicAllV();
  }

  Future<void> fetchMusicAllV() async {
    listDataMusicV.clear();
    listDataMusicV.add(MusicVModel(
        id: 1,
        type: 0,
        title: 'The last best1',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'assets/audio/making_my_way.mp3',
        isLoadSound: true,
        setSourceKey: const Key('setSource-url-making_my_way')));
    listDataMusicV.add(MusicVModel(
        id: 2,
        type: 0,
        title: 'The last best2',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_1.png',
        pathMusic: 'assets/audio/Infinity.mp3',
        isLoadSound: true,
        setSourceKey: const Key('setSource-url-Infinity')));

    notifyListeners();
  }

}
