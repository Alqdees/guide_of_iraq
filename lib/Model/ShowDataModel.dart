// class ShowDataModel {
//   ShowDataModel({
//     required this.currentPage,
//     required this.data,
//     required this.firstPageUrl,
//     required this.from,
//     this.nextPageUrl,
//     required this.path,
//     required this.perPage,
//     this.prevPageUrl,
//     required this.to,
//   });
//   late final int currentPage;
//   late final List<Data> data;
//   late final String firstPageUrl;
//   late final String from;
//   late final Null nextPageUrl;
//   late final String path;
//   late final int perPage;
//   late final Null prevPageUrl;
//   late final int to;

//   ShowDataModel.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     nextPageUrl = null;
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = null;
//     to = json['to'];
//   }

// Map<String, dynamic> toJson() {
//   final data = <String, dynamic>{};
//   data['current_page'] = currentPage;
//   data['data'] = data.map((e) => e.toJson() as MapEntry Function(String key, dynamic value)).toList();
//   data['first_page_url'] = firstPageUrl;
//   data['from'] = from;
//   data['next_page_url'] = nextPageUrl;
//   data['path'] = path;
//   data['per_page'] = perPage;
//   data['prev_page_url'] = prevPageUrl;
//   data['to'] = to;
//   return data;
// }
// }

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.phone,
    required this.location,
    required this.section,
    required this.specialization,
    required this.specializationType,
    required this.governorate,
    required this.info,
    required this.createdAt,
    required this.updatedAt,
  });
  // Data(this.json);

 final String id;
 final String userId;
 final String phone;
 final String location;
 final String section;
 final String specialization;
 final String specializationType;
 final String governorate;
 final String info;
 final String createdAt;
 final String updatedAt;

 
  factory Data.fromMap(MapEntry<String, String> entry) {
    return Data(
      id: entry.value,
      userId: entry.value,
      phone: entry.value,
      location: entry.value,
      section: entry.value,
      specialization: entry.value,
      specializationType: entry.value,
      governorate: entry.value,
      info: entry.value,
      createdAt: entry.value,
      updatedAt: entry.value,
    );
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['phone'] = phone;
    data['location'] = location;
    data['section'] = section;
    data['specialization'] = specialization;
    data['specialization_type'] = specializationType;
    data['governorate'] = governorate;
    data['info'] = info;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
