class DataDni {
    String numero;
    String nombres;
    String apellidoPaterno;
    String apellidoMaterno;
    String nombreCompleto;
    String departamento;
    String provincia;
    String distrito;
    String direccion;
    String direccionCompleta;
    String ubigeoReniec;
    String ubigeoSunat;
    List<String> ubigeo;
    String fechaNacimiento;
    String estadoCivil;
    String foto;
    String sexo;

    DataDni({
        required this.numero,
        required this.nombres,
        required this.apellidoPaterno,
        required this.apellidoMaterno,
        required this.nombreCompleto,
        required this.departamento,
        required this.provincia,
        required this.distrito,
        required this.direccion,
        required this.direccionCompleta,
        required this.ubigeoReniec,
        required this.ubigeoSunat,
        required this.ubigeo,
        required this.fechaNacimiento,
        required this.estadoCivil,
        required this.foto,
        required this.sexo,
    });

    factory DataDni.fromJson(Map<String, dynamic> json) => DataDni(
        numero: json["numero"],
        nombres: json["nombres"],
        apellidoPaterno: json["apellido_paterno"],
        apellidoMaterno: json["apellido_materno"],
        nombreCompleto: json["nombre_completo"],
        departamento: json["departamento"],
        provincia: json["provincia"],
        distrito: json["distrito"],
        direccion: json["direccion"],
        direccionCompleta: json["direccion_completa"],
        ubigeoReniec: json["ubigeo_reniec"],
        ubigeoSunat: json["ubigeo_sunat"],
        ubigeo: List<String>.from(json["ubigeo"].map((x) => x)),
        fechaNacimiento: json["fecha_nacimiento"],
        estadoCivil: json["estado_civil"],
        foto: json["foto"],
        sexo: json["sexo"],
    );

    Map<String, dynamic> toJson() => {
        "numero": numero,
        "nombres": nombres,
        "apellido_paterno": apellidoPaterno,
        "apellido_materno": apellidoMaterno,
        "nombre_completo": nombreCompleto,
        "departamento": departamento,
        "provincia": provincia,
        "distrito": distrito,
        "direccion": direccion,
        "direccion_completa": direccionCompleta,
        "ubigeo_reniec": ubigeoReniec,
        "ubigeo_sunat": ubigeoSunat,
        "ubigeo": List<dynamic>.from(ubigeo.map((x) => x)),
        "fecha_nacimiento": fechaNacimiento,
        "estado_civil": estadoCivil,
        "foto": foto,
        "sexo": sexo,
    };
}