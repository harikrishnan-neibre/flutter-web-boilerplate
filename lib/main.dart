import './home.dart' deferred as home;

void main() async {
  final Future<void> loadedLibrary = home.loadLibrary();

  await loadedLibrary;
  home.main();
}
