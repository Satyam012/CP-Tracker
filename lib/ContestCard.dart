class Tag {
  String Name,Duration,StartTime,EndTime,Platform;

  Tag(this.Name, this.Duration,this.StartTime,this.EndTime,this.Platform);

  factory Tag.fromJson(dynamic json) {
    return Tag(json['Name'] as String, json['Duration'] as String,json['StartTime'] as String,json['EndTime'] as String,json['Platform'] as String);
  }

  @override
  String toString() {
    return '{ ${this.Name}, ${this.Duration}, ${this.StartTime}, ${this.EndTime}}';
  }
}
