class performanceModel {
  String? symbol, pltarget, plreached, comment;
  performanceModel({this.symbol, this.pltarget, this.plreached, this.comment});
  performanceModel.fromjson(Map<dynamic, dynamic> map) {
    symbol = map['symbol'];
    pltarget = map['pltarget'];
    plreached = map['plreached'];
    comment = map['comment'];
  }
  tojson() {
    return {
      'symbol': symbol,
      'pltarget': pltarget,
      'plreached': plreached,
      'comment': comment
    };
  }
}
