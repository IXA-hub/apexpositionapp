class ApexData {
  ApexData(
      {this.id,
      this.title,
      this.field,
      this.gif,
      this.gifDirectory1,
      this.gifDirectory2,
      this.LobaLimited,
      this.pathfinderLimited,
      this.sortState});
  String id;
  String title;
  String gif;
  String gifDirectory1;
  String gifDirectory2;
  // ignore: non_constant_identifier_names
  int field;
  int LobaLimited;
  int pathfinderLimited;
  bool sortState;
  // ignore: non_constant_identifier_names
  dynamic toJson() => {
        'id': id,
        'title': title,
        'field': field,
        'gif': gif,
        'gifDirectory1': gifDirectory1,
        'gifDirectory2': gifDirectory2,
        'LobaLimited': LobaLimited,
        'pathfinderLimited': pathfinderLimited,
        'sortState': sortState
      };
}
