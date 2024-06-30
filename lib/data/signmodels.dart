class Signmodels {
    Signmodels({
        required this.email,
        required this.accessToken,
        required this.refreshToken,
    });

    final String? email;
    final String? accessToken;
    final String? refreshToken;

    factory Signmodels.fromJson(Map<String, dynamic> json){ 
        return Signmodels(
            email: json["email"],
            accessToken: json["accessToken"],
            refreshToken: json["refreshToken"],
        );
    }

    Map<String, dynamic> toJson() => {
        "email": email,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };

}
