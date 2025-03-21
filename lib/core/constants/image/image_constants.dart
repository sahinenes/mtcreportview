class ImageConstants {
  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  // String get logo => toPng('veli');

  // String get hotDog => toPng('hotdogs');
  // String get projeIcon => toPng('cirlce_hwa');

  String get notFound => toSVG('not_found');
  //String get user => toPng('user');
  String get men => toPng('men');
  String get woman => toPng('woman');
  String get face => toPng('face');
  String get empty => toPng('empty');
  String get files => toPng('files');
  String get icon => toPng('icon');
  String toPng(String name) => 'assets/images/$name.png';
  String toSVG(String name) => 'assets/images/$name.svg';
}
