

class UserRegister {
    String? dni;
    String name;
    String lastname;
    String? email;
    String? phone;
    String? password;

    UserRegister({
        this.dni,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        this.password,
    });


    factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
        dni: json["dni"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "dni": dni,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
    };
}