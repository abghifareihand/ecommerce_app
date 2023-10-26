class GalleryResponseModel {
  final int id;
  final String url;

  GalleryResponseModel({
    required this.id,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'url': url,
    };
  }

  factory GalleryResponseModel.fromJson(Map<String, dynamic> json) {
    return GalleryResponseModel(
      id: json['id'],
      url: json['url'],
    );
  }

}
