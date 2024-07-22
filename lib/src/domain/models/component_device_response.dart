class ComponentDeviceResponse {
    int id;
    String name;
    String? image;
    List<Component>? components;

    ComponentDeviceResponse({
        required this.id,
        required this.name,
        this.image,
        this.components,
    });

    static List<ComponentDeviceResponse> fromJsonList(List<dynamic> jsonList){
      List<ComponentDeviceResponse> toList = [];
      for (var item in jsonList) { 
        ComponentDeviceResponse listComponentDeviceResponse = ComponentDeviceResponse.fromJson(item);
        toList.add(listComponentDeviceResponse);
      }
      return toList;
    }

    factory ComponentDeviceResponse.fromJson(Map<String, dynamic> json) {
    return ComponentDeviceResponse(
      id: json['id'],
      name: json['name'],
      components: (json['components'] as List)
          .map((component) => Component.fromJson(component))
          .toList(),
    );
  }
}

class Component {
    int id;
    String name;

    Component({
        required this.id,
        required this.name,
    });

    factory Component.fromJson(Map<String, dynamic> json) => Component(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
    
}