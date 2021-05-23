import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();
bool ram = false;
String token = "";
// ignore: non_constant_identifier_names
String expiration_date = "";
String timestamp = "";
String id = "";

Future<bool> isLogged() async {
  if (ram) {
    return true;
  }

  if (!await storage.containsKey(key: "token")) return false;

  String token = await storage.read(key: "token");

  if (token == null) return false;

  var expirationDate =
      DateTime.parse(await storage.read(key: "expiration_date"));

  if (DateTime.now().isAfter(expirationDate)) {
    logout();
    return false;
  }

  return true;
}

Future<bool> saveToken(var json, bool remember) async {
  bool valueFunction = await isLogged();

  if (valueFunction) {
    print("Sovrascrivo autenticazione");
  }

  if (remember == false) {
    ram = true;
    token = json['token'];
    expiration_date = json['expiration_date'];
    id = json['_id'];
    timestamp = json['timestamp'];
    return true;
  }

  storage.write(key: "token", value: json['token']);
  storage.write(key: "expiration_date", value: json['expiration_date']);
  storage.write(key: "timestamp", value: json['timestamp']);
  storage.write(key: "id", value: json['_id']);
  return true;
}

void logout() {
  print("I'm going to log out");
  storage.deleteAll();
  ram = false;
}

Future<String> getToken() async {
  if (ram) return token;

  if (await isLogged()) return storage.read(key: "token");

  return null;
}

Future<String> getId() async {
  if (ram) return id;

  if (await isLogged()) return storage.read(key: "id");
  return null;
}
