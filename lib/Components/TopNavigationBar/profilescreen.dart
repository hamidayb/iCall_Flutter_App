import 'package:flutter/material.dart';
import 'package:icall/Model/login_user_response_model.dart';
import 'package:icall/services/shared_service.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late var size, width, height;
  late LoginUserResponseModel loginDetails;

  Future<void> readLoginDetails() async {
    var Details = await SharedService.loginDetails();

    setState(() {
      loginDetails = Details!;
    });
  }

  @override
  void initState() {
    readLoginDetails();
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              width: width,
              height: height / 10,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Text(
                    "Profile Page ",
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              ),
            ),
            Container(
              //color: Colors.white,
              width: width,
              margin: EdgeInsets.only(top: 15),
              height: height,
              child: Column(
                children: [
                  ListTile(
                    title: Text(loginDetails.name!.toString()),
                    subtitle: Text("Created At: " +
                        loginDetails.createdAt!.toString().substring(0, 10)),
                    leading: Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,

                        // image: DecorationImage(
                        //     image: AssetImage("assets/umer.jpeg"),
                        //     fit: BoxFit.cover)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, left: 18),
                        child: Text(
                          loginDetails.name!.toString()[0],
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ListTile(
                      title: Text(loginDetails.cnic!.toString()),
                      leading: Icon(Icons.account_balance_wallet_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ListTile(
                      title: Text(loginDetails.phone!.toString()),
                      leading: Icon(Icons.phone_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ListTile(
                      title: Text(loginDetails.email!.toString()),
                      leading: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: EdgeInsets.all(12),
                      child: MaterialButton(
                        color: Colors.grey[400],
                        onPressed: () {
                          SharedService.logout(context);
                        },
                        child: Text("Log Out"),
                        minWidth: double.infinity,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
