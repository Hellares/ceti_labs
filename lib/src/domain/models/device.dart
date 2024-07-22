
class Device {
    int? id;
    String name;
    String? image;

    Device({
        this.id,
        required this.name,
        this.image,
    });

      static List<Device> fromJsonList(List<dynamic> jsonList){
      List<Device> toList = [];
      for (var item in jsonList) { 
        Device device = Device.fromJson(item);
        toList.add(device);
      }
      return toList;
    }

    factory Device.fromJson(Map<String, dynamic> json) => Device(
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
