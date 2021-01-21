import 'package:json_annotation/json_annotation.dart';

part 'chicken.g.dart';

abstract class MapConvertible {
  Map<dynamic, dynamic> toMap();

  MapConvertible fromMap(Map<dynamic, dynamic> map);
}

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Chicken extends MapConvertible {
  String name;
  int age;
  int id;

  /// Tell json_serializable that "registration_date_millis" should be
  /// mapped to this property.
//@JsonKey(name: 'registration_date_millis')
//final int registrationDateMillis;

  Chicken({this.name, this.age, this.id});

  factory Chicken.fromJson(Map<String, dynamic> json) =>
      _$ChickenFromJson(json);

  Map<String, dynamic> toJson() => _$ChickenToJson(this);

  @override
  MapConvertible fromMap(Map map) {
    return Chicken(name: map['name'], age: map['age']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age};
  }
}

// By running flutter pub run build_runner build in the project root, you generate JSON serialization code for your models whenever they are needed. This triggers a one-time build that goes through the source files, picks the relevant ones, and generates the necessary serialization code for them.

// While this is convenient, it would be nice if you did not have to run the build manually every time you make changes in your model classes.

// Generating code continuously
// A watcher makes our source code generation process more convenient. It watches changes in our project files and automatically builds the necessary files when needed. Start the watcher by running flutter pub run build_runner watch in the project root.

// It is safe to start the watcher once and leave it running in the background.

//------------------------------

// Map userMap = jsonDecode(jsonString);
// var user = User.fromJson(userMap);
// The same goes for encoding. The calling API is the same as before.

// content_copy
// String json = jsonEncode(user);
