class RecordModel {
  int id;
  int year;
  int month;
  int day;
  int kokoro;
  String comment;

  RecordModel({this.year, this.month, this.day, this.kokoro, this.comment});

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "year": this.year,
      "month": this.month,
      "day": this.day,
      "kokoro": this.kokoro,
      "comment": this.comment,
    };
  }
}
