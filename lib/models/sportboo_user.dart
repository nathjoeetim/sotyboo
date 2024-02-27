class SportbooUser {

  final String firstName;
  final String lastName;
  final String email;
  final String userName;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final int? wallet;
  final int? excrowed;
  final int sportbooToken;
  final bool? aboveEighteen;
  final ResidentialAddress? residentialAddress;
  final String id;
  final String token;
  final String refreshToken;

  SportbooUser({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.wallet,
    required this.excrowed,
    required this.sportbooToken,
    required this.aboveEighteen,
    this.residentialAddress,
    required this.id,
    required this.token,
    required this.refreshToken,
  });

  SportbooUser.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        userName = json['userName'],
        isEmailVerified = json['isEmailVerified'],
        isPhoneVerified = json['isPhoneVerified'],
        wallet = json['wallet'].toDouble(),
        excrowed = json['excrowed'].toDouble(),
        sportbooToken = json['sportbooToken'],
        aboveEighteen = json['aboveEighteen'],
        residentialAddress = ResidentialAddress.fromJson(json['residentialAddress']),
        id = json['_id'],
        token = json['token'],
        refreshToken = json['refresh_token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['email'] = email;
    data['isEmailVerified'] = isEmailVerified;
    data['isPhoneVerified'] = isPhoneVerified;
    data['wallet'] = wallet;
    data['excrowed'] = excrowed;
    data['sportbooToken'] = sportbooToken;
    data['aboveEighteen'] = aboveEighteen;
    data['residentialAddress'] = residentialAddress?.toJson() ?? null;
    data['_id'] = id;
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    return data;
  }


}

class ResidentialAddress {
  final String country;
  final String city;
  final String state;
  final String region;
  final String postcode;

  ResidentialAddress({
    required this.country,
    required this.city,
    required this.state,
    required this.region,
    required this.postcode,
  });

  ResidentialAddress.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        city = json['city'],
        state = json['state'],
        region = json['region'],
        postcode = json['postcode'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country'] = country;
    data['city'] = city;
    data['state'] = state;
    data['region'] = region;
    data['postcode'] = postcode;
    return data;
  }
}
