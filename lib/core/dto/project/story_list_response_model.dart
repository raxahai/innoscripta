class StoryListResponseModel {
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

  StoryListResponseModel(
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

  StoryListResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Story>? rows;

  Result({this.cnt, this.rows});

  Result.fromJson(Map<String, dynamic> json) {
    cnt = json['cnt'];
    if (json['rows'] != null) {
      rows = <Story>[];
      json['rows'].forEach((v) {
        rows!.add(Story.fromJson(v));
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

class Story {
  String? objectiveId;
  String? title;
  String? projectId;
  String? sprintId;
  String? sort;
  String? sortGroup;
  String? sortEpic;
  String? start;
  String? end;
  String? storypoints;
  String? duration;
  String? durationHour;
  String? durationMinute;
  String? isMilestone;
  String? milestone;
  String? color;
  String? colorBar;
  String? colorBar2;
  String? userCreate;
  String? createdAt;
  String? updatedAt;
  String? completedAt;
  String? description;
  String? acceptanceCriteria;
  String? workflowStatus;
  String? prio;
  String? columnId;
  String? backlogColumnId;
  String? folderId;
  String? tasksTotal;
  String? tasksDone;
  String? tasksProgress;
  String? timeTotal;
  String? timeDone;
  String? members;
  String? estimate;
  String? estimateMin;
  String? completed;
  String? customField1;
  String? customField2;
  String? customField3;
  String? customField4;
  String? customField5;
  String? assignedTo;
  String? assignee;
  String? directKey;
  String? directTtl;

  Story(
      {this.objectiveId,
      this.title,
      this.projectId,
      this.sprintId,
      this.sort,
      this.sortGroup,
      this.sortEpic,
      this.start,
      this.end,
      this.storypoints,
      this.duration,
      this.durationHour,
      this.durationMinute,
      this.isMilestone,
      this.milestone,
      this.color,
      this.colorBar,
      this.colorBar2,
      this.userCreate,
      this.createdAt,
      this.updatedAt,
      this.completedAt,
      this.description,
      this.acceptanceCriteria,
      this.workflowStatus,
      this.prio,
      this.columnId,
      this.backlogColumnId,
      this.folderId,
      this.tasksTotal,
      this.tasksDone,
      this.tasksProgress,
      this.timeTotal,
      this.timeDone,
      this.members,
      this.estimate,
      this.estimateMin,
      this.completed,
      this.customField1,
      this.customField2,
      this.customField3,
      this.customField4,
      this.customField5,
      this.assignedTo,
      this.assignee,
      this.directKey,
      this.directTtl});

  Story.fromJson(Map<String, dynamic> json) {
    objectiveId = json['objective_id'];
    title = json['title'];
    projectId = json['project_id'];
    sprintId = json['sprint_id'];
    sort = json['sort'];
    sortGroup = json['sort_group'];
    sortEpic = json['sort_epic'];
    start = json['start'];
    end = json['end'];
    storypoints = json['storypoints'];
    duration = json['duration'];
    durationHour = json['duration_hour'];
    durationMinute = json['duration_minute'];
    isMilestone = json['is_milestone'];
    milestone = json['milestone'];
    color = json['color'];
    colorBar = json['color_bar'];
    colorBar2 = json['color_bar2'];
    userCreate = json['user_create'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    completedAt = json['completed_at'];
    description = json['description'];
    acceptanceCriteria = json['acceptance_criteria'];
    workflowStatus = json['workflow_status'];
    prio = json['prio'];
    columnId = json['column_id'];
    backlogColumnId = json['backlog_column_id'];
    folderId = json['folder_id'];
    tasksTotal = json['tasks_total'];
    tasksDone = json['tasks_done'];
    tasksProgress = json['tasks_progress'];
    timeTotal = json['time_total'];
    timeDone = json['time_done'];
    members = json['members'];
    estimate = json['estimate'];
    estimateMin = json['estimate_min'];
    completed = json['completed'];
    customField1 = json['custom_field_1'];
    customField2 = json['custom_field_2'];
    customField3 = json['custom_field_3'];
    customField4 = json['custom_field_4'];
    customField5 = json['custom_field_5'];
    assignedTo = json['assigned_to'];
    assignee = json['assignee'];
    directKey = json['direct_key'];
    directTtl = json['direct_ttl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objective_id'] = objectiveId;
    data['title'] = title;
    data['project_id'] = projectId;
    data['sprint_id'] = sprintId;
    data['sort'] = sort;
    data['sort_group'] = sortGroup;
    data['sort_epic'] = sortEpic;
    data['start'] = start;
    data['end'] = end;
    data['storypoints'] = storypoints;
    data['duration'] = duration;
    data['duration_hour'] = durationHour;
    data['duration_minute'] = durationMinute;
    data['is_milestone'] = isMilestone;
    data['milestone'] = milestone;
    data['color'] = color;
    data['color_bar'] = colorBar;
    data['color_bar2'] = colorBar2;
    data['user_create'] = userCreate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['completed_at'] = completedAt;
    data['description'] = description;
    data['acceptance_criteria'] = acceptanceCriteria;
    data['workflow_status'] = workflowStatus;
    data['prio'] = prio;
    data['column_id'] = columnId;
    data['backlog_column_id'] = backlogColumnId;
    data['folder_id'] = folderId;
    data['tasks_total'] = tasksTotal;
    data['tasks_done'] = tasksDone;
    data['tasks_progress'] = tasksProgress;
    data['time_total'] = timeTotal;
    data['time_done'] = timeDone;
    data['members'] = members;
    data['estimate'] = estimate;
    data['estimate_min'] = estimateMin;
    data['completed'] = completed;
    data['custom_field_1'] = customField1;
    data['custom_field_2'] = customField2;
    data['custom_field_3'] = customField3;
    data['custom_field_4'] = customField4;
    data['custom_field_5'] = customField5;
    data['assigned_to'] = assignedTo;
    data['assignee'] = assignee;
    data['direct_key'] = directKey;
    data['direct_ttl'] = directTtl;
    return data;
  }
}
