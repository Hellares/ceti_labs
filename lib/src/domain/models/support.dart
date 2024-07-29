
class Support {
    int? id;
    String device;
    String brand;
    String? serial;
    String componentA;
    String? componentB;
    String? componentC;
    String? accessories;
    String? image1;
    String? image2;
    String? image3;
    String? descriptionFail;
    String? solution;
    String? technical;
    String? price;
    DateTime? createdAt;
    DateTime? updatedAt;
    int userId;

    Support({
        this.id,
        required this.device,
        required this.brand,
        this.serial,
        required this.componentA,
        this.componentB,
        this.componentC,
        this.accessories,
        this.image1,
        this.image2,
        this.image3,
        this.descriptionFail,
        this.solution,
        this.technical,
        this.price,
        required this.userId,

    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        id: json["id"] ?? 0,
        device: json["device"],
        brand: json["brand"],
        serial: json["serial"],
        componentA: json["componentA"],
        componentB: json["componentB"],
        componentC: json["componentC"],
        accessories: json["accessories"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        descriptionFail: json["descriptionFail"],
        solution: json["solution"],
        technical: json["technical"],
        price: json["price"],
        userId: json["user_id"],

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "device": device,
        "brand": brand,
        "serial": serial,
        "componentA": componentA,
        "componentB": componentB,
        "componentC": componentC,
        "accessories": accessories,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "descriptionFail": descriptionFail,
        "solution": solution,
        "technical": technical,
        "price": price,        
        "user_id": userId,

    };
}



class User {
    int id;
    String name;
    String lastname;
    String phone;

    User({
        required this.id,
        required this.name,
        required this.lastname,
        required this.phone,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "phone": phone,
    };
}