import 'package:ceti_labs/src/domain/models/role.dart';

class User {
    int id;
    String dni;
    String name;
    String lastname;
    String email;
    String phone;
    String? password;
    String? confirmarPassword;
    String? image;
    dynamic notificationToken;
    bool isActive;
    List<Role> roles;

    User({
        required this.id,
        required this.dni,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        this.password,
        this.confirmarPassword,
        this.image,
        required this.notificationToken,
        required this.isActive,
        required this.roles,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        dni: json["dni"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"] ?? '',
        confirmarPassword: json["confirmarPassword"] ?? '',
        image: json["image"] ?? '',
        notificationToken: json["notification_token"] ?? '',
        isActive: json["isActive"],
        roles: json["roles"] != null ? List<Role>.from(json["roles"].map((x) => Role.fromJson(x))) : [],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "confirmarPassword": confirmarPassword,
        "image": image,
        "notification_token": notificationToken,
        "isActive": isActive,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    };
}