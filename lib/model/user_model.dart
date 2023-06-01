class UserModel {
  String? uid;
  String? email;
  String? username;
  String? phonenumber;
  String? image;
  String? dad;
  String? age;
  String? gender;
  String? area;
  String? education;
  String? job;
  String? vocation;

  UserModel(
      {
        this.uid,
        this.email,
        this.username,
        this.phonenumber,
        this.image,
        this.dad,
        this.age,
        this.gender,
        this.area,
        this.education,
        this.job,
        this.vocation,
      });

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        username: map['username'],
        phonenumber: map['phonenumber'],
        image: map['image']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'phonenumber': phonenumber,
      'image': image,
    };
  }
}
