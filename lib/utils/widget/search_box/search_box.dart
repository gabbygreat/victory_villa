import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/widget/horizontal_line.dart';
import 'package:victory_villa/utils/widget/search_box/search_box_controller.dart';
import 'package:victory_villa/utils/widget/text_field.dart';

class SearchBox extends ConsumerWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchbox = ref.watch(searchBoxProvider);
    // print(searchbox);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: VictoryConstants.kPadding,
            top: VictoryConstants.kPadding * 0.5,
          ),
          child: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.75,
            child: PopupMenuButton<String>(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onSelected: (item) {
                ref.watch(searchBoxProvider.notifier).changeBox(item);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'suite',
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Room suite',
                    style: TextStyle(color: VictoryColor.primaryColor),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'name',
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Occupant / Guarantor name',
                    style: TextStyle(color: VictoryColor.primaryColor),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'number',
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Room number',
                    style: TextStyle(color: VictoryColor.primaryColor),
                  ),
                ),
              ],
              child: TextField(
                enabled: false,
                decoration: customInputDecoration(
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  prefixIcon: const Icon(Icons.search),
                  hint: 'Search by',
                ),
              ),
            ),
          ),
        ),
        horizontalLine(showText: false),
        Padding(
          padding: EdgeInsets.all(VictoryConstants.kPadding),
          child: SizedBox(
            child: searchbox,
          ),
        )
      ],
    );
  }
}
