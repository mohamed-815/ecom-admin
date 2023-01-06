class LocationDetail {
  String place;
  String pincode;
  String city;
  String district;
  String mobileno;

  LocationDetail({
    required this.city,
    required this.district,
    required this.mobileno,
    required this.pincode,
    required this.place,
  });

  Map<String, dynamic> toJson() {
    return {
      'place': place,
      'pincode': pincode,
      'city': city,
      'district': district,
      'mobileno': mobileno,
    };
  }

  static LocationDetail fromJson(Map<String, dynamic> json) {
    return LocationDetail(
      place: json['place'],
      pincode: json['pincode'],
      city: json['city'],
      district: json['district'],
      mobileno: json['mobileno'],
    );
  }
}
