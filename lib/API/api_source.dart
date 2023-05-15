import 'base_network.dart';

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String,dynamic>> loadAnime(){ //ini tipe data array assosiatof kalo tipe data array = Future<List<dynamic>>
    return BaseNetwork.get("anime"); //menambahkan keterangan link di base url untuk mengambil data, jadi untuk command ini mengambil data dari link https://reqres.in/api/users
  }
  

  // Future<Map<String,dynamic>> loadDetileUser(int idDiterima){
  //   String id = idDiterima.toString();
  //   return BaseNetwork.get("users/$id");//https://reqres.in/api/users/idDiterima
  // }

}