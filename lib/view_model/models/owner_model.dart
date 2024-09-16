class OwnerModel {
  String name;
  String phone;
  String cnic;
  String image;
  String createdAt;
  String uid;

  OwnerModel({
    required this.name,
    required this.phone,
    required this.cnic,

    required this.image,
    required this.createdAt,
    required this.uid,

  });
  //from map

  factory OwnerModel.fromMap(Map<String,dynamic>map){
    return OwnerModel(
      name: map['name']??'',
      phone: map['phone']??'',
      cnic: map['cnic']??'',


      image: map['image']??'',
      createdAt: map['createdAt']??'',
      uid: map['uid']??'',

    );
  }

  //to map
  Map<String,dynamic>toMap(){
    return{
      "name":name,
      "phone":phone,
      "cnic":cnic,

      "image":image,
      "createdAt":createdAt,
      "uid":uid,

    };
  }

}