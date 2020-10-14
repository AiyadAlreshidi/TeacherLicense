class Tests {
  String s0;
  String s1;
  String s2;
  String s3;
  String s4;
  String explain;
  String image;
  Tests(
      {this.s0, this.s1, this.s2, this.s3, this.s4, this.explain, this.image});
  Tests.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    explain = json['explain'];
    image = json['image'];
  }
  List<String> SuffleIt(Tests a) {
    List<String> willResturn = [
      ...[a.s1, a.s2, a.s3, a.s4]
    ];

    willResturn.shuffle();

    print(willResturn);

    return willResturn;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['explain'] = this.explain;
    data['image'] = this.image;
    return data;
  }
}
