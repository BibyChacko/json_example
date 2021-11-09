

class ContactModel{
  String? contact;
  String? name;
  String? address;
  String? photo;
  String? url;

  String _data;

  ContactModel(this.contact, this.name, this.address, this.photo, this.url,this._data);

  factory ContactModel.fromJSON(Map json){
    return ContactModel(json['contact'], json['name'], json['address'], json['photo'], json['url'],"");
  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }
}