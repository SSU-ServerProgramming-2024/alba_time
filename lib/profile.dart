import 'package:alba_time/provider/myProfileProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/apiService.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ApiService apiService;
  late MyProfileProvider _myProfileProvider;

  String typeString(int type) {
    String company_type = "-";
    switch (type) {
      case 0:
        company_type = "피트니스 센터";
        break;
      case 1:
        company_type = "카페";
        break;
      case 2:
        company_type = "편의점";
        break;
      case 3:
        company_type = "패스트푸드점";
        break;
      case 4:
        company_type = "슈퍼마켓";
        break;
      case 5:
        company_type = "소매점";
        break;
      case 6:
        company_type = "영화관";
        break;
      case 7:
        company_type = "의류 매장";
        break;
      case 8:
        company_type = "서점";
        break;
      case 9:
        company_type = "식당";
        break;
      default:
        company_type = "-";
    }
    return company_type;
  }

  @override
  void initState() {
    super.initState();
    apiService = ApiService();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _myProfileProvider = Provider.of<MyProfileProvider>(context, listen: false);

      final response = await apiService.getProfile(_myProfileProvider.getUserId());
      if (response?.statusCode == 200) {
        _myProfileProvider.setMetaData(response!.result.name, response.result.com_name, response.result.com_loc, response.result.compno, response.result.type, response.result.age);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    _myProfileProvider = Provider.of<MyProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0.0,
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
        //leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        //actions: <Widget>[
        //  IconButton(icon: Icon(Icons.search), onPressed: () {})
        //],
      ),
      body: Consumer<MyProfileProvider>(
        builder: (context, profileProvider, child) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  children: <Widget>[
                      SizedBox(height:32),
                      Text('이름 :', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text('나이 :', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  )
                ),
                SizedBox(
                  width: 30,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height:32),
                    Text(_myProfileProvider.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(_myProfileProvider.age.toString(), style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height:32),
                Text('점포 정보', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height:32),
                Container(
                    alignment: Alignment.center,
                    color: Colors.teal.shade200,
                    width: 300,
                    height: 50,
                    child: Text(_myProfileProvider.com_name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                ),
                Container(
                    alignment: Alignment.center,
                    color: Colors.teal.shade200,
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.all(50),
                    child: Text(_myProfileProvider.com_loc, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                ),
                Container(
                    alignment: Alignment.center,
                    color: Colors.teal.shade200,
                    width: 300,
                    height: 50,
                    child: Text(typeString(_myProfileProvider.type), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                ),
              ],
            ),
          ],
        );
        }),
    );
  }
}
