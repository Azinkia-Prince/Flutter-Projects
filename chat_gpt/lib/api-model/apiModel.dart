class modelTypesModel {
  String? id;
  String? object;
  int? created;
  String? ownedBy;
  List<Permission>? permission;
  String? root;
  String? parent;

  modelTypesModel(
      {this.id,
      this.object,
      this.created,
      this.ownedBy,
      this.permission,
      this.root,
      this.parent});

  modelTypesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    ownedBy = json['owned_by'];
    if (json['permission'] != null) {
      permission = <Permission>[];
      json['permission'].forEach((v) {
        permission!.add(new Permission.fromJson(v));
      });
    }
    root = json['root'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['owned_by'] = this.ownedBy;
    if (this.permission != null) {
      data['permission'] = this.permission!.map((v) => v.toJson()).toList();
    }
    data['root'] = this.root;
    data['parent'] = this.parent;
    return data;
  }
}

class Permission {
  String? id;
  String? object;
  int? created;
  bool? allowCreateEngine;
  bool? allowSampling;
  bool? allowLogprobs;
  bool? allowSearchIndices;
  bool? allowView;
  bool? allowFineTuning;
  String? organization;
  String? group;
  bool? isBlocking;

  Permission(
      {this.id,
      this.object,
      this.created,
      this.allowCreateEngine,
      this.allowSampling,
      this.allowLogprobs,
      this.allowSearchIndices,
      this.allowView,
      this.allowFineTuning,
      this.organization,
      this.group,
      this.isBlocking});

  Permission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    allowCreateEngine = json['allow_create_engine'];
    allowSampling = json['allow_sampling'];
    allowLogprobs = json['allow_logprobs'];
    allowSearchIndices = json['allow_search_indices'];
    allowView = json['allow_view'];
    allowFineTuning = json['allow_fine_tuning'];
    organization = json['organization'];
    group = json['group'];
    isBlocking = json['is_blocking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['allow_create_engine'] = this.allowCreateEngine;
    data['allow_sampling'] = this.allowSampling;
    data['allow_logprobs'] = this.allowLogprobs;
    data['allow_search_indices'] = this.allowSearchIndices;
    data['allow_view'] = this.allowView;
    data['allow_fine_tuning'] = this.allowFineTuning;
    data['organization'] = this.organization;
    data['group'] = this.group;
    data['is_blocking'] = this.isBlocking;
    return data;
  }
}
