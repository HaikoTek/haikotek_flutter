
enum EnvType {
  dev,
  prod,
}

class Env {
  Env._({
    required this.envType,
    required this.apiBaseUrl,
    required this.apiSignIn,
  });

  factory Env.dev() {
    return Env._(
      envType: EnvType.dev,
      apiBaseUrl: 'https://api.htq287.com/v1',
      apiSignIn: 'signin',
    );
  }

  final EnvType envType;
  final String apiBaseUrl;
  final String apiSignIn;
}

class AppConfig {
  factory AppConfig({required Env env}) {
    I.env = env;
    return I;
  }

  AppConfig._private();

  static final AppConfig I = AppConfig._private();

  Env env = Env.dev();
}