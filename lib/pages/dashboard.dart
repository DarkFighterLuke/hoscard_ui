import 'package:flutter/material.dart';
import 'package:hoscard_ui/dto/serviceDto.dart';
import 'package:hoscard_ui/dto/userDto.dart';
import 'package:hoscard_ui/services/service.dart';

import '../services/user.dart';

class Dashboard extends StatelessWidget {
  final String _jwtToken;
  final serviceHandler = ServiceHandler();
  final userHandler = UserHandler();

  Dashboard(this._jwtToken, {super.key});

  @override
  Widget build(BuildContext context) {
    var userFuture = userHandler.fetchUserDetails(_jwtToken);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: FutureBuilder<UserDto>(
            future: userFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Text('No data available');
              } else {
                return Text("${snapshot.data!.username}'s Dashboard");
              }
            },
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover)),
        child: ServiceCardsList(
            dataFuture: serviceHandler.fetchUserServices(_jwtToken)),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final ServiceDto serviceDto;

  const CardWidget({super.key, required this.serviceDto});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${serviceDto.name}'),
            const SizedBox(height: 8),
            Text('Link: ${serviceDto.link}'),
          ],
        ),
      ),
    );
  }
}

class ServiceCardsList extends StatelessWidget {
  final Future<List<ServiceDto>> dataFuture;

  const ServiceCardsList({super.key, required this.dataFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceDto>>(
      future: dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available');
        } else {
          return SingleChildScrollView(
            child: Column(
              children: snapshot.data!
                  .map((serviceDto) => CardWidget(serviceDto: serviceDto))
                  .toList(),
            ),
          );
        }
      },
    );
  }
}
