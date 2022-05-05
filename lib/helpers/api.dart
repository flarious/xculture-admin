import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:xculture_admin/helpers/auth.dart';

class API {
  static Future<List<Forum>> getForums() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/forums'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/forums'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    final List<Forum> forumList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => forumList.add(Forum.fromJson(obj)));
    } 

    return forumList;
  }

  static Future<StatData> getForumStat() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/forums/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/forums/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if (response.statusCode == 200) {
      return StatData.fromDateJson(jsonDecode(response.body));
    }
    else {
      return StatData(firstData: 0, secondData: 0, thirdData: 0, fourthData: 0);
    }
  } 

  static Future<List<GraphData>> getForumGraph() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/forums/graph'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/forums/graph'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<GraphData> forumGraphList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => forumGraphList.add(GraphData.fromJson(obj)));
    } 

    return forumGraphList;
  }

  static Future<ReportedForum> getReportedForum(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/forums/:$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/forums/:$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if (response.statusCode == 200) {
      return ReportedForum.fromJson(jsonDecode(response.body));
    }
    else {
      return ReportedForum(id: "", title: "", subtitle: "", content: "", author: User(id: "", name: "", email: "", type: "", banned: 0), createDate: "", updateDate: "");
    }
  }

  static Future<List<Community>> getCommus() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/communities'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/communities'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<Community> commuList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => commuList.add(Community.fromJson(obj)));
    } 

    return commuList;
  }

  static Future<StatData> getCommuStat() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/communities/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/communities/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if (response.statusCode == 200) {
      return StatData.fromDateJson(jsonDecode(response.body));
    }
    else {
      return StatData(firstData: 0, secondData: 0, thirdData: 0, fourthData: 0);
    }
  } 

  static Future<List<GraphData>> getCommuGraph() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/communities/graph'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/communities/graph'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<GraphData> commuGraphList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => commuGraphList.add(GraphData.fromJson(obj)));
    } 

    return commuGraphList;
  }

  static Future<ReportedCommu> getReportedCommu(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/communities/:$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/communities/:$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if (response.statusCode == 200) {
      return ReportedCommu.fromJson(jsonDecode(response.body));
    }
    else {
      return ReportedCommu(id: "", name: "", shortDesc: "", fullDesc: "", type: "", owner: User(id: "", name: "", email: "", type: "", banned: 0), createDate: "", updateDate: "");
    }
  }

  static Future<List<Event>> getEvents() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/events'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/events'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<Event> eventList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => eventList.add(Event.fromJson(obj)));
    } 

    return eventList;
  }

  static Future<StatData> getEventStat() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/events/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/events/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if (response.statusCode == 200) {
      return StatData.fromDateJson(jsonDecode(response.body));
    }
    else {
      return StatData(firstData: 0, secondData: 0, thirdData: 0, fourthData: 0);
    }
  } 

  static Future<List<GraphData>> getEventGraph() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/events/graph'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/events/graph'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<GraphData> eventGraphList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => eventGraphList.add(GraphData.fromJson(obj)));
    } 

    return eventGraphList;
  }

  static Future<ReportedEvent> getReportedEvent(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/events/:$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/events/:$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if (response.statusCode == 200) {
      return ReportedEvent.fromJson(jsonDecode(response.body));
    }
    else {
      return ReportedEvent(id: "", name: "", location: "", body: "", host: User(id: "", name: "", email: "", type: "", banned: 0), createDate: "", updateDate: "", eventDate: "");
    }
  }

  static Future<List<User>> getUsers() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/users'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/users'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<User> userList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => userList.add(User.fromJson(obj)));
    } 

    return userList;
  }

  static Future<StatData> getOverviewStat() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if (response.statusCode == 200) {
      return StatData.fromOverviewJson(jsonDecode(response.body));
    }
    else {
      return StatData(firstData: 0, secondData: 0, thirdData: 0, fourthData: 0);
    }
  }

  static Future<List<Reported>> getReported() async {
    final userToken = await Auth.getToken();

    http.Response response;
    if(kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/reported'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/reported'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<Reported> reportedList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => reportedList.add(Reported.fromJson(obj)));
    }

    return reportedList;
  }

  static Future<StatData> getReportedStat() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/reported/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/reported/stat'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if (response.statusCode == 200) {
      return StatData.fromReportedJson(jsonDecode(response.body));
    }
    else {
      return StatData(firstData: 0, secondData: 0, thirdData: 0, fourthData: 0);
    }
  }

  static Future<List<GraphData>> getReportedGraph() async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/reported/graph'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/reported/graph'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<GraphData> reportedGraphList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => reportedGraphList.add(GraphData.fromJson(obj)));
    } 

    return reportedGraphList;
  }

  static Future<List<ReportDetail>> getReportDetail(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.get(
        Uri.parse('http://localhost:3000/admins/reported/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.get(
        Uri.parse('http://10.0.2.2:3000/admins/reported/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    final List<ReportDetail> reportDetailList = [];

    if(response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      decoded.forEach((obj) => reportDetailList.add(ReportDetail.fromJson(obj)));
    } 

    return reportDetailList;
  } 

  static Future<bool> deleteForumAndBan(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.delete(
        Uri.parse('http://localhost:3000/admins/forums/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.delete(
        Uri.parse('http://10.0.2.2:3000/admins/forums/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if(response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }

  static Future<bool> deleteEventAndBan(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.delete(
        Uri.parse('http://localhost:3000/admins/events/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.delete(
        Uri.parse('http://10.0.2.2:3000/admins/events/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if(response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }

  static Future<bool> deleteCommuAndBan(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.delete(
        Uri.parse('http://localhost:3000/admins/communities/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.delete(
        Uri.parse('http://10.0.2.2:3000/admins/communities/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if(response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }

  static Future<bool> deleteRejectedReports(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.delete(
        Uri.parse('http://localhost:3000/admins/reported/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.delete(
        Uri.parse('http://10.0.2.2:3000/admins/reported/$id'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if(response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }

  static Future<bool> unbanUser(id) async {
    final userToken = await Auth.getToken();
    http.Response response;
    if (kIsWeb) {
      response = await http.put(
        Uri.parse('http://localhost:3000/admins/users/$id/unban'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }
    else {
      response = await http.put(
        Uri.parse('http://10.0.2.2:3000/admins/users/$id/unban'),
        headers: <String, String> {
          'Authorization': 'bearer $userToken'
        }
      );
    }

    if(response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Forum {
  String id;
  String title;
  User owner;
  String lastUpdated;
  int viewed;
  int liked;

  Forum({required this.id, required this.title, required this.owner, required this.lastUpdated, required this.viewed, required this.liked});

  factory Forum.fromJson(Map<String, dynamic> json) {
    return Forum(
      id: json['id'], 
      title: json['title'], 
      owner: User.fromJson(json['author']), 
      lastUpdated: json['update_date'], 
      viewed: json['viewed'], 
      liked: json['favorite_amount']
    );
  }
}

class Event {
  String id;
  String name;
  User owner;
  String lastUpdated;
  int interested;
  String eventDate;
  String location;

  Event({required this.id, required this.name, required this.owner, required this.lastUpdated, required this.interested, required this.eventDate, required this.location});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'], 
      name: json['name'], 
      owner: User.fromJson(json['host']), 
      lastUpdated: json['update_date'], 
      interested: json['interested_amount'], 
      eventDate: json['event_date'], 
      location: json['location']
    );
  }
}

class Community {
  String id;
  String name;
  User owner;
  String lastUpdated;
  String type;
  int members;

  Community({required this.id, required this.name, required this.owner, required this.lastUpdated, required this.type, required this.members});

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['id'], 
      name: json['name'], 
      owner: User.fromJson(json['owner']), 
      lastUpdated: json['update_date'], 
      type: json['type'], 
      members: json['member_amount']
    );
  }
}

class User {
  String id;
  String name;
  String email;
  String type;
  int banned;

  User({required this.id, required this.name, required this.email, required this.type, required this.banned});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'], 
      name: json['name'], 
      email: json['email'], 
      type: json['userType'],
      banned: json['banned_amount']
    );
  }
}

class Reported {
  String id;
  String name;
  String type;
  User owner;
  int reports;

  Reported({required this.id, required this.name, required this.type, required this.owner, required this.reports});

  factory Reported.fromJson(Map<String, dynamic> json) {
    return Reported(
      id: json['id'], 
      name: json['name'], 
      type: json['type'], 
      owner: User.fromJson(json['owner']), 
      reports: json['report_amount']
    );
  }
}

class ReportedForum {
  String id;
  String title;
  String subtitle;
  String content;
  User author;
  String createDate;
  String updateDate;

  ReportedForum({required this.id, required this.title, required this.subtitle, required this.content, required this.author, required this.createDate, required this.updateDate});

  factory ReportedForum.fromJson(Map<String, dynamic> json){
    return ReportedForum(
      id: json['id'], 
      title: json['title'],
      subtitle: json['subtitle'], 
      content: json['content'], 
      author: User.fromJson(json['author']), 
      createDate: json['create_date'], 
      updateDate: json['update_date']
    );
  }
}

class ReportedEvent {
  String id;
  String name;
  String location;
  String body;
  User host;
  String createDate;
  String updateDate;
  String eventDate;

  ReportedEvent({required this.id, required this.name, required this.location, required this.body, required this.host, required this.createDate, required this.updateDate, required this.eventDate});

  factory ReportedEvent.fromJson(Map<String, dynamic> json){
    return ReportedEvent(
      id: json['id'], 
      name: json['name'],
      location: json['location'], 
      body: json['body'], 
      host: User.fromJson(json['host']), 
      createDate: json['create_date'], 
      updateDate: json['update_date'],
      eventDate: json['event_date']
    );
  }
}

class ReportedCommu {
  String id;
  String name;
  String shortDesc;
  String fullDesc;
  String type;
  User owner;
  String createDate;
  String updateDate;

  ReportedCommu({required this.id, required this.name, required this.shortDesc, required this.fullDesc, required this.type, required this.owner, required this.createDate, required this.updateDate});

  factory ReportedCommu.fromJson(Map<String, dynamic> json){
    return ReportedCommu(
      id: json['id'], 
      name: json['name'],
      shortDesc: json['shortdesc'], 
      fullDesc: json['desc'], 
      type: json['type'],
      owner: User.fromJson(json['owner']), 
      createDate: json['create_date'], 
      updateDate: json['update_date']
    );
  }
}

class ReportDetail {
  String id;
  String topics;
  String detail;
  User reporter;
  String reportDate;

  ReportDetail({required this.id, required this.topics, required this.detail, required this.reporter, required this.reportDate});

  factory ReportDetail.fromJson(Map<String, dynamic> json){
    String reportTopics = ""; 
    for (var topic in json['topics']) {
      if (reportTopics == "") {
        reportTopics = topic["topic"]["category"];
      }
      else {
        reportTopics += ", " + topic["topic"]["category"];
      }
    }

    return ReportDetail(
      id: json['id'], 
      topics: reportTopics,
      detail: json['detail'], 
      reporter: User.fromJson(json['reporter']), 
      reportDate: json['reportDate'], 
    );
  }
}

class StatData {
  int firstData;
  int secondData;
  int thirdData;
  int fourthData;

  StatData({required this.firstData, required this.secondData, required this.thirdData, required this.fourthData});

  factory StatData.fromDateJson(Map<String, dynamic> json) {
    return StatData(firstData: json['this_month'], secondData: json['last_month'], thirdData: json['last_3_months'], fourthData: json['total']);
  }

  factory StatData.fromOverviewJson(Map<String, dynamic> json) {
    return StatData(firstData: json['user'], secondData: json['forum'], thirdData: json['event'], fourthData: json['community']);
  }

  factory StatData.fromReportedJson(Map<String, dynamic> json) {
    return StatData(firstData: json['forum'], secondData: json['event'], thirdData: json['community'], fourthData: json['total']);
  }
}

class GraphData {
  String name;
  int amount;

  GraphData({required this.name, required this.amount});

  factory GraphData.fromJson(Map<String, dynamic> json) {
    return GraphData(name: json['name'], amount: json['amount']);
  }
}