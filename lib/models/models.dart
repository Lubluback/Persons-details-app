class Models {
  int? id;
  final String name;
  final String phonenumber;
  final String email;


  final String image;

  Models({
    this.id,
    required this.image,
    required this.email,
 
    required this.name,
    required this.phonenumber,
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phonenumber,
      'imagePath': image,
    };
  }

  factory Models.fromMap(Map<String, dynamic> map) {
    return Models(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phonenumber: map['phone'],
      image: map['imagePath'],
    
    );
  }
}


