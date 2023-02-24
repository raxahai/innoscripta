class ProjectListResponseModel {
  String? version;
  String? ts;
  bool? cached;
  String? lang;
  bool? loggedin;
  String? mode;
  String? pro;
  ProjectListResult? result;
  bool? error;
  String? message;

  ProjectListResponseModel(
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

  ProjectListResponseModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    ts = json['ts'];
    cached = json['cached'];
    lang = json['lang'];
    loggedin = json['loggedin'];
    mode = json['mode'];
    pro = json['pro'];
    result = json['result'] != null
        ? ProjectListResult.fromJson(json['result'])
        : null;
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

class ProjectListResult {
  int? cnt;
  List<Project>? rows;

  ProjectListResult({this.cnt, this.rows});

  ProjectListResult.fromJson(Map<String, dynamic> json) {
    cnt = json['cnt'];
    if (json['rows'] != null) {
      rows = <Project>[];
      json['rows'].forEach((v) {
        rows!.add(Project.fromJson(v));
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

class Project {
  String? projectId;
  String? version;
  String? status;
  String? demo;
  String? title;
  String? teamId;
  String? projectType;
  String? board;
  String? next;
  String? updated;
  String? lastUpdated;
  String? total;
  String? done;
  String? scope;
  String? uspace;
  int? readonly;
  String? owns;
  String? role;
  String? isNew;
  String? userStatus;
  String? short;
  String? type;
  String? members;

  Project(
      {this.projectId,
      this.version,
      this.status,
      this.demo,
      this.title,
      this.teamId,
      this.projectType,
      this.board,
      this.next,
      this.updated,
      this.lastUpdated,
      this.total,
      this.done,
      this.scope,
      this.uspace,
      this.readonly,
      this.owns,
      this.role,
      this.isNew,
      this.userStatus,
      this.short,
      this.type,
      this.members});

  Project.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    version = json['version'];
    status = json['status'];
    demo = json['demo'];
    title = json['title'];
    teamId = json['team_id'];
    projectType = json['project_type'];
    board = json['board'];
    next = json['next'];
    updated = json['updated'];
    lastUpdated = json['last_updated'];
    total = json['total'];
    done = json['done'];
    scope = json['scope'];
    uspace = json['uspace'];
    readonly = json['readonly'];
    owns = json['owns'];
    role = json['role'];
    isNew = json['is_new'].toString();
    userStatus = json['user_status'];
    short = json['short'];
    type = json['type'];
    members = json['members'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['version'] = version;
    data['status'] = status;
    data['demo'] = demo;
    data['title'] = title;
    data['team_id'] = teamId;
    data['project_type'] = projectType;
    data['board'] = board;
    data['next'] = next;
    data['updated'] = updated;
    data['last_updated'] = lastUpdated;
    data['total'] = total;
    data['done'] = done;
    data['scope'] = scope;
    data['uspace'] = uspace;
    data['readonly'] = readonly;
    data['owns'] = owns;
    data['role'] = role;
    data['is_new'] = isNew;
    data['user_status'] = userStatus;
    data['short'] = short;
    data['type'] = type;
    data['members'] = members;
    return data;
  }
}
