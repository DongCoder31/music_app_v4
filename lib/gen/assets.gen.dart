/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/Infinity.mp3
  String get infinity => 'assets/audio/Infinity.mp3';

  /// File path: assets/audio/booktok.mp3
  String get booktok => 'assets/audio/booktok.mp3';

  /// File path: assets/audio/making_my_way.mp3
  String get makingMyWay => 'assets/audio/making_my_way.mp3';

  /// File path: assets/audio/waveform.mp3
  String get waveform => 'assets/audio/waveform.mp3';

  /// List of all assets
  List<String> get values => [infinity, booktok, makingMyWay, waveform];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back.svg
  SvgGenImage get back => const SvgGenImage('assets/icons/back.svg');

  /// File path: assets/icons/drawer.svg
  SvgGenImage get drawer => const SvgGenImage('assets/icons/drawer.svg');

  /// File path: assets/icons/group.svg
  SvgGenImage get group => const SvgGenImage('assets/icons/group.svg');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/list.png
  AssetGenImage get list => const AssetGenImage('assets/icons/list.png');

  /// File path: assets/icons/next.svg
  SvgGenImage get next => const SvgGenImage('assets/icons/next.svg');

  /// File path: assets/icons/options.svg
  SvgGenImage get options => const SvgGenImage('assets/icons/options.svg');

  /// File path: assets/icons/play.svg
  SvgGenImage get play => const SvgGenImage('assets/icons/play.svg');

  /// File path: assets/icons/podcast.png
  AssetGenImage get podcast => const AssetGenImage('assets/icons/podcast.png');

  /// File path: assets/icons/previous.svg
  SvgGenImage get previous => const SvgGenImage('assets/icons/previous.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/unsplash_2.svg
  SvgGenImage get unsplash2 => const SvgGenImage('assets/icons/unsplash_2.svg');

  /// File path: assets/icons/unsplash_3.svg
  SvgGenImage get unsplash3 => const SvgGenImage('assets/icons/unsplash_3.svg');

  /// File path: assets/icons/vector4.svg
  SvgGenImage get vector4 => const SvgGenImage('assets/icons/vector4.svg');

  /// File path: assets/icons/vt_lets.svg
  SvgGenImage get vtLets => const SvgGenImage('assets/icons/vt_lets.svg');

  /// File path: assets/icons/vt_play.svg
  SvgGenImage get vtPlay => const SvgGenImage('assets/icons/vt_play.svg');

  /// File path: assets/icons/vt_right.svg
  SvgGenImage get vtRight => const SvgGenImage('assets/icons/vt_right.svg');

  /// File path: assets/icons/wave.svg
  SvgGenImage get wave => const SvgGenImage('assets/icons/wave.svg');

  /// List of all assets
  List<dynamic> get values => [
        back,
        drawer,
        group,
        home,
        list,
        next,
        options,
        play,
        podcast,
        previous,
        search,
        unsplash2,
        unsplash3,
        vector4,
        vtLets,
        vtPlay,
        vtRight,
        wave
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/unsplash_1.png
  AssetGenImage get unsplash1 =>
      const AssetGenImage('assets/images/unsplash_1.png');

  /// File path: assets/images/unsplash_2.png
  AssetGenImage get unsplash2 =>
      const AssetGenImage('assets/images/unsplash_2.png');

  /// File path: assets/images/unsplash_3.png
  AssetGenImage get unsplash3 =>
      const AssetGenImage('assets/images/unsplash_3.png');

  /// File path: assets/images/unsplash_PDX_a_82obo.png
  AssetGenImage get unsplashPDXA82obo =>
      const AssetGenImage('assets/images/unsplash_PDX_a_82obo.png');

  /// File path: assets/images/unsplash_mbGxz7pt0jM.png
  AssetGenImage get unsplashMbGxz7pt0jM =>
      const AssetGenImage('assets/images/unsplash_mbGxz7pt0jM.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [unsplash1, unsplash2, unsplash3, unsplashPDXA82obo, unsplashMbGxz7pt0jM];
}

class Assets {
  Assets._();

  static const String ambientCMotion = 'assets/ambient_c_motion.mp3';
  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const String coins = 'assets/coins.wav';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String invalid = 'assets/invalid.txt';
  static const String laser = 'assets/laser.wav';
  static const String nasaOnAMission = 'assets/nasa_on_a_mission.mp3';

  /// List of all assets
  List<String> get values =>
      [ambientCMotion, coins, invalid, laser, nasaOnAMission];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
