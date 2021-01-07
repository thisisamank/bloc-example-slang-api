class SlangModel {
  String _number;
  String _insult;

  SlangModel({String number, String insult}) {
    this._number = number;
    this._insult = insult;
  }

  String get number => _number;
  set number(String number) => _number = number;
  String get insult => _insult;
  set insult(String insult) => _insult = insult;

  SlangModel.fromJson(Map<String, dynamic> json) {
    _number = json['number'];
    _insult = json['insult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this._number;
    data['insult'] = this._insult;
    return data;
  }
}
