import 'package:herodex/utilities/app_images.dart';

enum HeroUniverse {
  all('All', ''),
  dc('Dc', AppImages.dclogo),
  marvel('Marvel', AppImages.marvelLogo),
  darkHorse('Dark Horse', AppImages.darkHorseLogo);

  final String label;
  final String logo;

  const HeroUniverse(this.label, this.logo);
}
