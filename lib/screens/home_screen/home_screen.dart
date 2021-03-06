import 'package:duas_pwa/bloc/dua_bloc.dart';
import 'package:duas_pwa/screens/custom_widgets/custom_widgets.dart';
import 'package:duas_pwa/screens/home_screen/bottom_bar/bottom_action_bar.dart';
import 'package:duas_pwa/screens/home_screen/dua_card/dua_card.dart';
import 'package:duas_pwa/screens/home_screen/flare_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({
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
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // flare background
          FlareThemeBackground(),
          Container(
            // to give column max width
            width: double.infinity,
            padding: EdgeInsets.only(top: 56.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: _buildChildren(context),
            ),
          ),
        ],
      ),
    );
  }

  /// content of the screen to be placed inside [HomeScreen]
  /// column
  List<Widget> _buildChildren(BuildContext context) {
    return [
      Expanded(
        flex: 5,
        child: BlocBuilder<DuaBloc, DuaState>(
          builder: (context, state) {
            // if dua is successfully fetched show dua card with the
            // corresponding Dua
            if (state is DuaSuccess) {
              return DuaCard(dua: state.dua);
            }
            // if error occured show error text
            if (state is DuaFailure) {
              return Center(child: Text("A problem occured please try again!"));
            }
            // in loading state show a circular loader
            if (state is DuaLoading) {
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
