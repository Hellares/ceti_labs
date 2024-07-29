class Status {
    int id;
    String name;
    String image;

    Status({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}