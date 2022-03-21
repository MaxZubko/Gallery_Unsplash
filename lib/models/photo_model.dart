class PhotoModel {
  final String description;
  PhotoUrls urls;
  User user;

  PhotoModel(
      {required this.description, required this.urls, required this.user});

  static PhotoModel fromJson(Map<String, dynamic> json) {
    return PhotoModel(
        description: json['description'] ?? 'No description',
        user: User.fromJson(json['user']),
        urls: PhotoUrls.fromJson(json['urls']));
  }
}

class User {
  final String userName;

  User({required this.userName});

  static User fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['username'],
    );
  }
}

class PhotoUrls {
  final String regular;
  final String small;

  PhotoUrls({
    required this.regular,
    required this.small,
  });

  static PhotoUrls fromJson(Map<String, dynamic> json) {
    return PhotoUrls(
      regular: json['regular'],
      small: json['small'],
    );
  }
}
