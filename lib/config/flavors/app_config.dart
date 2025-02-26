enum Flavor { prod, dev }

class AppConfig {
  String appName = "";
  String apiBaseURL = "";
  String apiImagesURL = "";
  Flavor flavor = Flavor.dev;

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    String appName = "",
    String apiBaseURL = "",
    String apiImagesURL = "",
    Flavor flavor = Flavor.dev,
  }) {
    return shared = AppConfig(appName, apiBaseURL, apiImagesURL, flavor);
  }

  AppConfig(this.appName, this.apiBaseURL, this.apiImagesURL, this.flavor);
}
