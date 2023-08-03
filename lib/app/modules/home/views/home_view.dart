import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: controller.obx(
        onLoading: ListView.builder(
          itemCount: 20,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(
                'Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                'Age : 00',
              ),
            ),
          ),
        ),
        (data) => ListView.builder(
          prototypeItem: Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
              ),
              title: Text(
                'Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                'Age : 0',
              ),
            ),
          ),
          itemCount: data!.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CachedNetworkImage(
                  width: 50,
                  imageUrl: data[index]['picture']['large'],
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
                title: Text(
                  data[index]['name']['first'] + ' ' + data[index]['name']['last'],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  data[index]['email'],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Text(
                  'Age : ${data[index]['dob']['age'].toString()}',
                ),
              ),
            );
          },
        ),
        onError: (err) => Center(
          child: Text("Internet connection error..."),
        ),
        onEmpty: const Center(
          child: Text('No data'),
        ),
      ),
    );
  }
}
