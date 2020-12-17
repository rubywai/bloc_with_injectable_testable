import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

@Entity(tableName: 'contact')
class Contact{
  @primaryKey
  String id;
  String name;
  String job;
  String age;
  Contact(this.name,this.job,this.age,{this.id});

  factory Contact.fromJson(Map<String,dynamic> json) => Contact(
    json['name'] as String,
    json['job'] as String,
    json['age'] as String,
    id: json['id'] as String,
  );

  Map<String,dynamic> toJson() => <String, dynamic>{
    'id': this.id,
    'name': this.name,
    'job': this.job,
    'age': this.age,
  };

}