import 'package:bmi_tracker/model/result_model.dart';
import 'package:bmi_tracker/services/fire_store.dart';
import 'package:bmi_tracker/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ResultTab extends StatelessWidget {
  const ResultTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreFunctions.getResult(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
              child: Text('Something went wrong please try again later'));
        } else {
          List<ResultModel> result =
              snapshot.data!.docs.map((e) => e.data()).toList();
          return ListView.builder(
            itemCount: result.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {}, child: CustomCard(result: result[index]));
            },
          );
        }
      },
    );
  }
}
