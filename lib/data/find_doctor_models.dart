class FindalldoctorModels {
  FindalldoctorModels({
    required this.id,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.name,
    required this.image,
    required this.location,
    required this.fees,
    required this.links,
    required this.createBy,
    required this.createdDate,
  });

  final int? id;
  final dynamic modifiedBy;
  final DateTime? modifiedDate;
  final String? name;
  final String? image;
  final String? location;
  final String? fees;
  final String? links;
  final dynamic createBy;
  final DateTime? createdDate;

  factory FindalldoctorModels.fromJson(Map<String, dynamic> json) {
    return FindalldoctorModels(
      id: json["id"],
      modifiedBy: json["modifiedBy"],
      modifiedDate: DateTime.tryParse(json["modifiedDate"] ?? ""),
      name: json["name"],
      image: json["image"],
      location: json["location"],
      fees: json["fees"],
      links: json["links"],
      createBy: json["createBy"],
      createdDate: DateTime.tryParse(json["createdDate"] ?? ""),
    );
  }
}

List<FindalldoctorModels> parseDoctorsList(List<dynamic> jsonList) {
  return jsonList.map((json) => FindalldoctorModels.fromJson(json)).toList();
}
