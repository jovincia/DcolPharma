import 'package:dcolpharma/entities/pharmas.dart';
import 'package:http/http.dart'as http;

class Liaisons{
  static const String url= 'https://jsonplaceholder.typicode.com/users';

  static Future <List<Pharmas>> getPharmas()async{
    try{
      final response = await http.get(url);
      if(response.statusCode ==200){
        final List<Pharmas> pharmas= pharmasFromJson(response.body);
        return pharmas;
      }
      else{
        return List<Pharmas>();
      }
  } catch(e){
      return List<Pharmas>();
    }

    }
}
final List<Map> pharmaLists = [
{
"name" : "name",
"numero" : "11111111",
"location" : "location 1",
"logoText" : "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"

}];