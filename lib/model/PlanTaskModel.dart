class PlanTaskModel {
  String title;
  String date;
  List<PlanTaskModel> child;
  bool isUnfold=false;

  PlanTaskModel({this.title, this.date, this.child});

  PlanTaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    date = json['date']?.toString();

    if (json['child'] != null) {
      child = new List<PlanTaskModel>();
      child.addAll((json['child'] as List)
          .map((m) => PlanTaskModel.fromJson(m))
          .toList());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    if (this.child != null) {
      data['child'] = this.child.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

