enum Endpoints {
  character;

  String get path {
    switch (this) {
      case Endpoints.character:
        return "/character/";
    }
  }
}
