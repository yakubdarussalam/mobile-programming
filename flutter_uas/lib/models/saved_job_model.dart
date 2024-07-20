class SavedJob {
  int id;
  String name;
  String description;
  String company;
  String image;
  String location;
  String date;

  SavedJob({
    required this.id,
    required this.name,
    required this.description,
    required this.company,
    required this.image,
    required this.location,
    required this.date,
  });

  factory SavedJob.fromMap(Map<String, dynamic> map) => SavedJob(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      company: map['company'],
      image: map['image'],
      location: map['location'],
      date: map['date']);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "company": company,
        "image": image,
        "location": location,
        "date": date
      };
}
