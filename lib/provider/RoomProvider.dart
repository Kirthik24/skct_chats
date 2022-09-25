import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class RoomProvider{

      Stream<List<types.User>> li = FirebaseChatCore.instance.users();

      Future<List<types.User>> give_user_list() async  {
        return  li.first;
      }
      //
      // types.Room getroom(){
      //   return types.Room(id: "1", type: types.RoomType.group, users: give_user_list());
      // }


}