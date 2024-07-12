import 'dart:convert';

import 'package:propertio_getx/app/data/model/responses/detail_project_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/detail_unit_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/homepage_response_Model.dart';
import 'package:propertio_getx/app/data/model/responses/list_project_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/login_response_model.dart';
import 'package:propertio_getx/app/data/model/responses/project_favorite_response_model.dart';

import '../json_reader.dart';

final tDataHomePage =
    HomePageModel.fromJson(jsonDecode(readJson('homepage.json')));

final tListDataProject =
    ListProjectModel.fromJson(jsonDecode(readJson('list_project.json')));

final tDetailProject = DetailProjectResponseModel.fromJson(
    jsonDecode(readJson('detail_project.json')));

final tDetailUnit =
    DetailunitResponseModel.fromJson(jsonDecode(readJson('detail_unit.json')));

final tLoginData =
    LoginResponseModel.fromJson(jsonDecode(readJson('login_response.json')));
final tListFavoriteProject = ProjectFavoriteResponseModel.fromJson(
    jsonDecode(readJson('list_favorite_project.json')));
