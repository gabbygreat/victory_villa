import 'package:flutter/material.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';

class TenancyStatus extends StatelessWidget {
  const TenancyStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Tenancy Status'),
    );
  }
}
