// To parse this JSON data, do
//
//     final newsLetter = newsLetterFromJson(jsonString);

import 'dart:convert';

List<NewsLetter> newsLetterFromJson(String str) =>
    List<NewsLetter>.from(json.decode(str).map((x) => NewsLetter.fromJson(x)));

String newsLetterToJson(List<NewsLetter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsLetter {
  NewsLetter({
    this.name,
    this.images,
    this.gender,
    this.species,
    this.homePlanet,
    this.occupation,
    this.sayings,
    this.id,
    this.age,
  });

  Name? name;
  Images? images;

  @override
  String toString() {
    return 'NewsLetter{name: $name, images: $images, gender: $gender, species: $species, homePlanet: $homePlanet, occupation: $occupation, sayings: $sayings, id: $id, age: $age}';
  }

  String? gender;
  String? species;
  String? homePlanet;
  String? occupation;
  List<String>? sayings;
  int? id;
  String? age;

  factory NewsLetter.fromJson(Map<String, dynamic> json) => NewsLetter(
        name: Name.fromJson(json["name"]),
        images: Images.fromJson(json["images"]),
        gender: json["gender"],
        species: json["species"],
        homePlanet: json["homePlanet"],
        occupation: json["occupation"],
        sayings: List<String>.from(json["sayings"].map((x) => x)),
        id: json["id"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "images": images?.toJson(),
        "gender": gender,
        "species": species,
        "homePlanet": homePlanet,
        "occupation": occupation,
        "sayings": List<dynamic>.from(sayings!.map((x) => x)),
        "id": id,
        "age": age,
      };
}

class Images {
  Images({
    this.headShot,
    this.main,
  });

  String? headShot;
  String? main;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        headShot: json["head-shot"],
        main: json["main"],
      );

  Map<String, dynamic> toJson() => {
        "head-shot": headShot,
        "main": main,
      };
}

class Name {
  Name({
    this.first,
    this.middle,
    this.last,
  });

  String? first;
  String? middle;
  String? last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        first: json["first"],
        middle: json["middle"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "middle": middle,
        "last": last,
      };
}
