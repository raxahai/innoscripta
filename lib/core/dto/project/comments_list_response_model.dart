class CommentsListResponseModel {
  String? version;
  String? ts;
  bool? cached;
  String? lang;
  bool? loggedin;
  String? mode;
  String? pro;
  Result? result;
  bool? error;
  String? message;

  CommentsListResponseModel(
      {this.version,
      this.ts,
      this.cached,
      this.lang,
      this.loggedin,
      this.mode,
      this.pro,
      this.result,
      this.error,
      this.message});

  CommentsListResponseModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    ts = json['ts'];
    cached = json['cached'];
    lang = json['lang'];
    loggedin = json['loggedin'];
    mode = json['mode'];
    pro = json['pro'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['ts'] = ts;
    data['cached'] = cached;
    data['lang'] = lang;
    data['loggedin'] = loggedin;
    data['mode'] = mode;
    data['pro'] = pro;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['error'] = error;
    data['message'] = message;
    return data;
  }
}

class Result {
  String? cnt;
  List<Comment>? rows;

  Result({this.cnt, this.rows});

  Result.fromJson(Map<String, dynamic> json) {
    cnt = json['cnt'];
    if (json['rows'] != null) {
      rows = <Comment>[];
      json['rows'].forEach((v) {
        rows!.add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cnt'] = cnt;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comment {
  String? commentId;
  String? userId;
  String? ts;
  String? userName;
  String? comment;
  String? mod;

  Comment(
      {this.commentId,
      this.userId,
      this.ts,
      this.userName,
      this.comment,
      this.mod});

  Comment.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    userId = json['user_id'];
    ts = json['ts'];
    userName = json['user_name'];
    comment = json['comment'];
    mod = json['mod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment_id'] = commentId;
    data['user_id'] = userId;
    data['ts'] = ts;
    data['user_name'] = userName;
    data['comment'] = comment;
    data['mod'] = mod;
    return data;
  }
}
