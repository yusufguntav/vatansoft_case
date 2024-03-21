import 'package:flutter/material.dart';

enum Images {
  portalRNM,
  characters,
  episodes,
  settingIcon,
  ufoIcon,
  locations,
  portal;

  String get path {
    switch (this) {
      case Images.ufoIcon:
        return 'assets/svg/ufo.svg';
      case Images.settingIcon:
        return 'assets/svg/settings.svg';
      case Images.locations:
        return 'assets/png/locations.jpg';
      case Images.episodes:
        return 'assets/png/episodes.jpeg';
      case Images.characters:
        return 'assets/png/characters.jpg';
      case Images.portalRNM:
        return 'assets/png/portal_rm.png';
      case Images.portal:
        return 'assets/png/portal.png';
    }
  }
}

enum PageStates { initial, busy, loaded, error }

enum SelectedPage { character, episodes, locations }

enum CustomFonts {
  rickAndMorty;

  String get font {
    switch (this) {
      case CustomFonts.rickAndMorty:
        return 'RickNMorty';
    }
  }
}

enum ThemeType { light, dark }

enum LanguageType { english, turkish }
