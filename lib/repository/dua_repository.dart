part of 'repository.dart';

/// Respository to fetch data from local json and convert
/// it to list of [Dua] models
class DuaRepository {
  Future<List<Dua>> get() async {
    // get json file as string
    // note "assets/" is added by default :|
    String duaJson = await rootBundle.loadString(jsonDataPath);
    // decode string to json list
    List<dynamic> duaJsonList = json.decode(duaJson) as List;
    // convert json list to list of Dua models
    List<Dua> duaList =
        duaJsonList.map((duaJson) => Dua.fromJson(duaJson)).toList();

    // return Dua
    return duaList;
  }
}
