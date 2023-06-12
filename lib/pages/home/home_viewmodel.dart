import 'package:dio/dio.dart';
import '../../base/base_viewmodel.dart';
import '../../models/albumb_model.dart';
import '../../models/food_model.dart';
import '../../models/music_model.dart';
import '../../remote/service/response/news_response.dart';

class HomeVM extends BaseViewModel {
  NewAllResponse? data;
  List<FoodModel> listData = [];
  List<AlbumModel> listDataAlbum = [];
  List<MusicModel> listDataMusic = [];

  @override
  void onInit() {
    print("HomeVM");
    fetchNewsAll();
    fetchDataAlbumAll();
    fetchMusicAll();
  }

  Future fetchNewsAll() async {
    showLoading();
    try {
      final response = await api.newServices.getNewAll();
      data = response;
      listData.addAll(data?.dataList ?? []);
      notifyListeners();
      hideLoading();
    } on DioError catch (e) {
      print(e);
      hideLoading();
    }
  }

  Future fetchDataAlbumAll() async {
    listDataAlbum.add(AlbumModel(
        id: 0,
        title: 'HIP HOP',
        description: 'MUSIC',
        imageUrl: 'assets/images/unsplash_PDX_a_82obo.png',
       ));
    listDataAlbum.add(AlbumModel(
        id: 1,
        title: 'BOLERO',
        description: 'MUSIC',
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png',
       ));
    listDataAlbum.add(AlbumModel(
        id: 3,
        title: 'BOLERO',
        description: 'MUSIC',
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png'));
    notifyListeners();
  }

  Future fetchMusicAll() async {
    listDataMusic.add(MusicModel(
        id: 1,
        type: 0,
        title: 'The last best1',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'making_my_way.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 2,
        type: 1,
        title: 'The last best2',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'Infinity.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 3,
        type: 1,
        title: 'The last best3',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 4,
        type: 1,
        title: 'The last best4',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 5,
        type: 0,
        title: 'The last best5',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    notifyListeners();
  }
}
