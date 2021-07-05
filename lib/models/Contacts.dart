import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class Contacts {
  Contacts({
    this.id,
    this.name,
    this.contacts,
    this.url,
  });

  factory Contacts.fromJson(Map<String, dynamic> jsonRes) => Contacts(
    id: asT<String?>(jsonRes['id']),
    name: asT<String?>(jsonRes['name']),
    contacts: asT<String?>(jsonRes['Contacts']),
    url: asT<String?>(jsonRes['url']),
  );

  String? id;
  String? name;
  String? contacts;
  String? url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'Contacts': contacts,
    'url': url,
  };

  Contacts clone() => Contacts.fromJson(
      asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
