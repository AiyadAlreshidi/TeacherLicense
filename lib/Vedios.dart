class Vedios {
  String name;
  String id;

  Vedios(this.id, this.name);

  Vedios.fromJson(Map<String, dynamic> json) {
    id = json['link'];
    name = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.id;
    data['text'] = this.name;
    return data;
  }
}
