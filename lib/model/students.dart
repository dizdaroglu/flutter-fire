class Students {
  String key;
  String name;
  String surname;

  Students({this.key, this.name, this.surname});

  Students.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    data['surname'] = this.surname;
    return data;
  }
}
