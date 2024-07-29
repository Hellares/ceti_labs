class ApiConfig{
  static const String localApiCetiLabs = "192.168.18.5:3000";
  static const String productionApiCetiLabs = 'bdcetiv2-production.up.railway.app';
  
  static bool isProduction = true;

  static String get apiCetiLabs => isProduction ? productionApiCetiLabs : localApiCetiLabs;

  static Uri getUri(String path){
    return isProduction
      ? Uri.https(apiCetiLabs,path)
      : Uri.http(apiCetiLabs, path);
  }
}