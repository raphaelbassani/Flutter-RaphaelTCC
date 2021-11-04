class NameResultsName {
/*
{
  "title": "Mr",
  "first": "Enrique",
  "last": "Garcia"
}
*/

  String? title;
  String? first;
  String? last;

  NameResultsName({
    this.title,
    this.first,
    this.last,
  });
  NameResultsName.fromJson(Map<String, dynamic> json) {
    title = json["title"]?.toString();
    first = json["first"]?.toString();
    last = json["last"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["title"] = title;
    data["first"] = first;
    data["last"] = last;
    return data;
  }
}

class NameResults {
/*
{
  "name": {
    "title": "Mr",
    "first": "Enrique",
    "last": "Garcia"
  }
}
*/

  NameResultsName? name;

  NameResults({
    this.name,
  });
  NameResults.fromJson(Map<String, dynamic> json) {
    name = (json["name"] != null) ? NameResultsName.fromJson(json["name"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (name != null) {
      data["name"] = name!.toJson();
    }
    return data;
  }
}

class Name {
/*
{
  "results": [
    {
      "name": {
        "title": "Mr",
        "first": "Enrique",
        "last": "Garcia"
      }
    }
  ]
}
*/

  List<NameResults?>? results;

  Name({
    this.results,
  });
  Name.fromJson(Map<String, dynamic> json) {
    if (json["results"] != null) {
      final v = json["results"];
      final arr0 = <NameResults>[];
      v.forEach((v) {
        arr0.add(NameResults.fromJson(v));
      });
      results = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (results != null) {
      final v = results;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["results"] = arr0;
    }
    return data;
  }
}

