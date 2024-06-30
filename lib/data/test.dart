class UserDataResponse {
    UserDataResponse({
        required this.diag,
    });

    final String diag;

    factory UserDataResponse.fromJson(Map<String, dynamic> json){ 
        return UserDataResponse(
            diag: json["diag"] ?? "",
        );
    }

    Map<String, dynamic> toJson() => {
        "diag": diag,
    };

}
