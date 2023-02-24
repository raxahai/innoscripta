class EpicListResponseModel {
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

  EpicListResponseModel(
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

  EpicListResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Epic>? rows;

  Result({this.cnt, this.rows});

  Result.fromJson(Map<String, dynamic> json) {
    cnt = json['cnt'];
    if (json['rows'] != null) {
      rows = <Epic>[];
      json['rows'].forEach((v) {
        rows!.add(Epic.fromJson(v));
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

class Epic {
  String? folderId;
  String? sort;
  String? title;
  String? color;
  String? description;
  String? totalStories;
  String? totalProgress;
  String? totalDone;
  String? overdue;
  String? start;
  String? end;
  dynamic progress;
  String? rangeShow;
  String? status;

  Epic(
      {this.folderId,
      this.sort,
      this.title,
      this.color,
      this.description,
      this.totalStories,
      this.totalProgress,
      this.totalDone,
      this.overdue,
      this.start,
      this.end,
      this.progress,
      this.rangeShow,
      this.status});

  Epic.fromJson(Map<String, dynamic> json) {
    folderId = json['folder_id'];
    sort = json['sort'];
    title = json['title'];
    color = json['color'];
    description = json['description'];
    totalStories = json['total_stories'];
    totalProgress = json['total_progress'];
    totalDone = json['total_done'];
    overdue = json['overdue'];
    start = json['start'];
    end = json['end'];
    progress = json['progress'].toString();
    rangeShow = json['range_show'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['folder_id'] = folderId;
    data['sort'] = sort;
    data['title'] = title;
    data['color'] = color;
    data['description'] = description;
    data['total_stories'] = totalStories;
    data['total_progress'] = totalProgress;
    data['total_done'] = totalDone;
    data['overdue'] = overdue;
    data['start'] = start;
    data['end'] = end;
    data['progress'] = progress;
    data['range_show'] = rangeShow;
    data['status'] = status;
    return data;
  }
}
