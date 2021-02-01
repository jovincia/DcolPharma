
class Pharma{
  String name;
  String location;
  String numero ;
  String departement;
  String arrondissement;

  Pharma(this.name,this.location,this.numero,this.departement,this.arrondissement);

  Pharma.fromJson(Map<dynamic,dynamic> json){
    
    name=json['name'];
    location=json['location'];
    numero=json['numero'];
    departement=json['departement'];
    arrondissement=json['arrondissement'];
  }
             
}