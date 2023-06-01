class ChildModel {
  String? uid;
  String? email;
  String? username;

  ChildModel({
    this.uid,
    this.email,
    this.username,
  });

  factory ChildModel.fromJson(map) {
    return ChildModel(
      uid: map['uid'],
      email: map['email'],
      username: map['username'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
    };
  }
}
