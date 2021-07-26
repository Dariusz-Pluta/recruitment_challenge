import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment_challenge/core/dependency_injection/di.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/app_text.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/error_snackbar.dart';
import 'package:recruitment_challenge/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:recruitment_challenge/features/favorites/presentation/widgets/delete_confirmation_dialog.dart';
import 'package:recruitment_challenge/features/other_locations/presentation/widgets/app_list_tile.dart';
import 'package:recruitment_challenge/generated/l10n.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = FavoritesCubit(sl());

    _cubit.listenToFavoritesChange();

    _cubit.stream.listen((state) {
      if (state.error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbar(context: context, text: state.errorMessage),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: 10.0),
          AppText(
            text: Strings.of(context).favorites,
            fontSize: 45.0,
            color: Colors.white,
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
                bloc: _cubit,
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.favoritesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (_) =>
                            _cubit.delete(state.favoritesList[index].city!),
                        confirmDismiss: (_) => showDialog(
                          context: context,
                          builder: (context) => DeleteConfirmationDialog(
                            text: Strings.of(context).delete,
                          ),
                        ),
                        background: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Container(
                              color: Colors.red.withOpacity(0.2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.delete, color: Colors.white),
                                  Icon(Icons.delete, color: Colors.white),
                                ],
                              ),
                            )),
                        child: AppListTile(
                          model: _cubit.state.favoritesList.elementAt(index),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
