


class ShowDataModel {
  ShowDataModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
     this.nextPageUrl,
    required this.path,
    required this.perPage,
     this.prevPageUrl,
    required this.to,
  });
  late final int currentPage;
  late final List<Data> data;
  late final String firstPageUrl;
  late final int from;
  late final Null nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final int to;
  
  ShowDataModel.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    return _data;
  }
}

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
  late final int id;
  late final int userId;
  late final String phone;
  late final String location;
  late final String section;
  late final String specialization;
  late final String specializationType;
  late final String governorate;
  late final String info;
  late final String createdAt;
  late final String updatedAt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    phone = json['phone'];
    location = json['location'];
    section = json['section'];
    specialization = json['specialization'];
    specializationType = json['specialization_type'];
    governorate = json['governorate'];
    info = json['info'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['phone'] = phone;
    _data['location'] = location;
    _data['section'] = section;
    _data['specialization'] = specialization;
    _data['specialization_type'] = specializationType;
    _data['governorate'] = governorate;
    _data['info'] = info;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}