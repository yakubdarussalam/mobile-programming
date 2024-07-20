class User {
  int id;
  String name;
  String email;
  String image;
  int connection;
  int experience;
  String status;
  String phone;
  String address;
  int age;
  String position;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.connection,
    required this.experience,
    required this.status,
    required this.phone,
    required this.address,
    required this.age,
    required this.position,
  });

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        image: map['image'],
        connection: map['connection'],
        experience: map['experience'],
        status: map['status'],
        phone: map['phone'],
        address: map['address'],
        age: map['age'],
        position: map['position'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        // "image": image,
        // "connection": connection,
        // "experience": experience,
        // "status": status,
        "phone": phone,
        "address": address,
        "age": age,
        // "position": position,
      };
}
