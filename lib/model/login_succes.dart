class DataLogin {
	bool status;
	String message;
	Data data;

	DataLogin({this.status, this.message, this.data});

	DataLogin.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		message = json['message'];
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = this.status;
		data['message'] = this.message;
		if (this.data != null) {
			data['data'] = this.data.toJson();
		}
		return data;
	}
}

class Data {
	String userId;
	String token;
	String page;

	Data({this.userId, this.token, this.page});

	Data.fromJson(Map<String, dynamic> json) {
		userId = json['userId'];
		token = json['token'];
		page = json['page'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['userId'] = this.userId;
		data['token'] = this.token;
		data['page'] = this.page;
		return data;
	}
}