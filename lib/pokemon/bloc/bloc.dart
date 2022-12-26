import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pokemon/pokemon/utils/const.dart';
import 'package:pokemon/pokemon/modal_object/dart_object.dart';
import 'dart:convert';
import 'package:pokemon/pokemon/modal_object/response_ob.dart';

class Bloc {
  StreamController<ResponseOb> _controller = StreamController<ResponseOb>();
  Stream<ResponseOb> getStream() => _controller.stream;

  GetData() async {
    ResponseOb respOb = ResponseOb(msgState: MsgState.loading);
    _controller.sink.add(respOb);
    final http.Response response = await http.get(Uri.parse(BASE_URL));
    // print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      List<DartObjectPage> pkmList = [];
      list.forEach((element) {
        pkmList.add(DartObjectPage.fromJson(element));
      });
      respOb.msgState = MsgState.data;
      respOb.data = pkmList;
      _controller.sink.add(respOb);
    } else if (response.statusCode == 500) {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.servierErr;
      _controller.sink.add(respOb);
    } else if (response.statusCode == 404) {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.noFoundErr;
      _controller.sink.add(respOb);
    } else {
      respOb.msgState = MsgState.error;
      respOb.errState = ErrState.unknownErr;
      _controller.sink.add(respOb);
    }
  }

  dispose() {
    _controller.close();
  }
}
