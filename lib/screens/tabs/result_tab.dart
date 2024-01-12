import 'package:bmi_tracker/screens/update_result_screen.dart';
import 'package:bmi_tracker/services/fire_store.dart';
import 'package:bmi_tracker/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ResultTab extends StatefulWidget {
  const ResultTab({super.key});

  @override
  State<ResultTab> createState() => _ResultTabState();
}

class _ResultTabState extends State<ResultTab> {
  static const pageSize = 10;
  int page = 0;

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
          final result = snapshot.data!.docs.map((e) => e.data()).toList();
          final currentPageResults =
              result.skip(page * pageSize).take(pageSize).toList();
          return ListView.builder(
            itemCount: currentPageResults.length + 1,
            // Add one for the "Load More" button
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            itemBuilder: (context, index) {
              if (index < currentPageResults.length) {
                final result = currentPageResults[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, UpdateResult.routeName,
                        arguments: result);
                  },
                  child: CustomCard(result: result),
                );
              } else {
                return currentPageResults.length == 10
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            page++;
                          });
                        },
                        child: const Text('Load More'),
                      )
                    : page <= 10 && page > 0
                        ? ElevatedButton(
                            onPressed: () {
                              setState(() {
                                page--;
                              });
                            },
                            child: const Text('Back'))
                        : const SizedBox.shrink();
              }
            },
          );
        }
      },
    );
  }
}