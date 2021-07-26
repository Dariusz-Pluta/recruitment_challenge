import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment_challenge/core/dependency_injection/di.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/app_text.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/error_snackbar.dart';
import 'package:recruitment_challenge/features/other_locations/presentation/cubit/other_localizations_cubit.dart';
import 'package:recruitment_challenge/features/other_locations/presentation/widgets/app_list_tile.dart';
import 'package:recruitment_challenge/features/other_locations/presentation/widgets/search_TF.dart';
import 'package:recruitment_challenge/generated/l10n.dart';

class OtherLocationsPage extends StatefulWidget {
  const OtherLocationsPage({Key? key}) : super(key: key);

  @override
  _OtherLocationsPageState createState() => _OtherLocationsPageState();
}

class _OtherLocationsPageState extends State<OtherLocationsPage> {
  late OtherLocalizationsCubit _cubit;

  late Widget _content;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _cubit = OtherLocalizationsCubit(sl());
    _content = Center(child: CircularProgressIndicator(color: Colors.amber));
    _controller = TextEditingController();

    _cubit.getLocalizationsList();

    _cubit.stream.listen((state) {
      if (state.listReady) {
        _content = ListView.builder(
          itemCount: state.list.length,
          itemBuilder: (BuildContext context, int index) {
            return AppListTile(model: state.list.elementAt(index));
          },
        );
      } else if (state.searchResultReady) {
        _content = ListView.builder(
          itemCount: state.searchResult.length,
          itemBuilder: (BuildContext context, int index) {
            return AppListTile(model: state.searchResult.elementAt(index));
          },
        );
      } else if (state.error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbar(context: context, text: state.errorMessage),
        );
      }
    });

    _controller.addListener(() => _cubit.search(_controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          AppText(
            text: Strings.of(context).cities,
            fontSize: 45.0,
            color: Colors.white,
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              height: 50.0,
              child: SearchTF(controller: _controller),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child:
                BlocBuilder<OtherLocalizationsCubit, OtherLocalizationsState>(
                    bloc: _cubit,
                    builder: (context, state) {
                      return _content;
                    }),
          ),
        ],
      ),
    );
  }
}
