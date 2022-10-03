import 'package:flutter/material.dart';
import 'package:get_dio/models/provider_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataResponse = Provider.of<ProviderServices>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio with Provider'),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Consumer<ProviderServices>(
              builder: (context, dataResponse, child) =>
                  (dataResponse.data["id"] == null)
                      ? const Text('Id tidak dapat ditemukan')
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (dataResponse.data["id"] == null)
                                  ? 'ID: Belum ada Data'
                                  : "ID: ${dataResponse.data["id"]}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Name: ',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              (dataResponse.data["first_name"] == null)
                                  ? 'Belum ada Data'
                                  : "${dataResponse.data["first_name"]}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Email: ',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              (dataResponse.data["email"] == null)
                                  ? 'Belum ada Data'
                                  : "${dataResponse.data["email"]}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
            ),
            OutlinedButton(
                onPressed: () {
                  dataResponse.getById(3);
                },
                child: const Text('GET DATA'))
          ],
        ),
      ),
    );
  }
}
