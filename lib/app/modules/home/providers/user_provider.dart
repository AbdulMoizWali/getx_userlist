import 'package:get/get.dart';

class UserProvider extends GetConnect {
  /*@override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }*/

  Future<List<dynamic>> getUser() async {
    final response = await get('https://randomuser.me/api/?results=50');
    if(response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['results'];
    }
  }
}
