class Job {
  int id;
  String name;
  String description;
  String company;
  String image;
  String location;
  String coordinate;

  Job({
    required this.id,
    required this.name,
    required this.description,
    required this.company,
    required this.image,
    required this.location,
    required this.coordinate,
  });

  factory Job.fromMap(Map<String, dynamic> map) => Job(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        company: map['company'],
        image: map['image'],
        location: map['location'],
        coordinate: map['coordinate'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "company": company,
        "image": image,
        "location": location,
        "coordinate": coordinate
      };
}
