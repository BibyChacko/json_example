class Record {
  String name;
  String address;
  String contact;
  String photo;
  String url;

  Record(
      {required this.name,
      required this.address,
      required this.contact,
      required this.photo,
      required this.url});


  // From JSON factory constructor
  // We need to convert the Map(Key-Value) pair into an object of Record

  // Named constructor
  // This constructor will take the key-value as input
  // It will return an instance of Record
  // Factory named constructor
  // We can write a return statement

  factory Record.fromJSON(Map<String,dynamic> json){
    return Record(name: json["name"], address: json["address"],
        contact: json["contact"], photo: json["photo"], url: json["url"]
    );
  }


}
