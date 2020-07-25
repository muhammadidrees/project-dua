import 'package:duas_pwa/bloc/ayah_bloc.dart';
import 'package:duas_pwa/screens/custom_widgets/custom_widgets.dart';
import 'package:duas_pwa/screens/home_screen/ayah_card/ayah_card.dart';
import 'package:duas_pwa/screens/home_screen/bottom_bar/bottom_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          ThemeSwitch(),
        ],
      ),
      body: Container(
        // to give column max width
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: _buildChildren(context),
        ),
      ),
    );
  }

  /// content of the screen to be placed inside [HomeScreen]
  /// column
  List<Widget> _buildChildren(BuildContext context) {
    return [
      Expanded(
        flex: 5,
        child: BlocBuilder<AyahBloc, AyahState>(
          builder: (context, state) {
            // if ayah is successfully fetched show ayah card with the
            // corresponding ayah
            if (state is AyahSuccess) {
              return AyahCard(ayah: state.ayah);
            }
            // if error occured show error text
            if (state is AyahFailure) {
              return Center(child: Text("A problem occured please try again!"));
            }
            // in loading state show a circular loader
            if (state is AyahLoading) {
              return Center(child: CircularProgressIndicator());
            }
            // default state should be loading state :)
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      Expanded(
        flex: 1,
        child: BottomActionBar(),
      ),
    ];
  }
}
