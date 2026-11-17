import '../constants/lottie_assets.dart';

extension LottieIndexExtension on int {
  String get lottiePath => LottieAssets.animations[this];
}
