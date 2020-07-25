part of 'repository.dart';

/// Respository to fetch data from local json and convert
/// it to list of [Ayah] models
class AyahRepository {
  Future<List<Ayah>> get() async {
    // get json file as string
    // note "assets/" is added by default :|
    String ayahJson = await rootBundle.loadString(jsonDataPath);
    // decode string to json list
    List<dynamic> ayahJsonList = json.decode(ayahJson) as List;
    // convert json list to list of ayah models
    List<Ayah> ayahList =
        ayahJsonList.map((ayahJson) => Ayah.fromJson(ayahJson)).toList();

    // return ayah
    return ayahList;
  }
}
