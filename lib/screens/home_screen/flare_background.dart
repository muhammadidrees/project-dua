import 'package:duas_pwa/cubit/theme_cubit.dart';
import 'package:duas_pwa/utils/utils.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// animated flare background
class FlareThemeBackground extends StatefulWidget {
  const FlareThemeBackground({
    Key key,
  }) : super(key: key);

  @override
  _FlareThemeBackgroundState createState() => _FlareThemeBackgroundState();
}

class _FlareThemeBackgroundState extends State<FlareThemeBackground> {
  String _flareAnimation = "";

  @override
  void initState() {
    // to start off the initial animaiton based on state
    _flareAnimationChange(context.bloc<ThemeCubit>().state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, bool>(
      listener: (context, state) {
        _flareAnimationChange(state);
      },
      child: FlareActor(
        flareSwitchPath + "theme_change.flr",
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: _flareAnimation,
        // when the transition animation is done
        // show idle animation
        callback: (name) {
          if (name == "day_to_night") {
            setState(() {
              _flareAnimation = "night_idle";
            });
          }
          if (name == "night_to_day") {
            setState(() {
              _flareAnimation = "day_idle";
            });
          }
        },
      ),
    );
  }

  /// A funtion that sets the name of Flare animation to
  /// be played based on the [ThemeState] of cubit
  void _flareAnimationChange(bool state) {
    // get theme
    bool _isDark = state;

    // if state is initial show idle animation else
    // show transition animations
    if (context.bloc<ThemeCubit>().isInitial) {
      setState(() {
        _flareAnimation = (_isDark) ? "night_idle" : "day_idle";
      });
    } else {
      setState(() {
        _flareAnimation = (_isDark) ? "day_to_night" : "night_to_day";
      });
    }
  }
}
