import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState{
  Future <InitializationStatus> initialization;

  AdState(this.initialization);

  String get bannerAdUnitID  => "ca-app-pub-2884536422660900/1878472502";
  String get interstitialAdUnitID  => "ca-app-pub-2884536422660900/6503650203";

//  For Test Only
  // String get bannerAdUnitID  => "ca-app-pub-3940256099942544/6300978111";
  // String get interstitialAdUnitID  => "ca-app-pub-3940256099942544/1033173712";

  

}