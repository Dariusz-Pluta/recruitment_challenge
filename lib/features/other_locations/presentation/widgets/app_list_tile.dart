import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment_challenge/core/models/localization_model.dart';
import 'package:recruitment_challenge/features/current_weather/presentation/widgets/app_text.dart';
import 'package:recruitment_challenge/features/selected_location/presentation/pages/selected_location_page.dart';
import 'package:recruitment_challenge/features/unit/presentation/cubit/unit_cubit.dart';

class AppListTile extends StatelessWidget {
  final LocalizationModel model;

  const AppListTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider<UnitCubit>(
            create: (context) => UnitCubit(),
            child: SelectedLocationPage(model: model),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            border: Border.symmetric(
                horizontal: BorderSide(
              color: Colors.black,
              width: 1.0,
            )),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20.0),
              Expanded(
                  child: AppText(
                text: model.city!,
                fontSize: 25.0,
                alignment: TextAlign.start,
              )),
              Container(
                width: 40.0,
                child: AppText(
                  text: model.country!,
                  fontSize: 25.0,
                  alignment: TextAlign.start,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
