import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps_bloc_rest_api/bloc/bloc.dart';

// ignore: must_be_immutable
class CategoryButton extends StatefulWidget {
  Function onClicked;
  String category = "";
  String country = "";
  int buttonID;
  bool isSelected;

  CategoryButton({
    required this.onClicked,
    required this.isSelected,
    required this.category,
    required this.buttonID,
    required this.country,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.007),
      child: BlocProvider(
        create: (context) => NewsBloc(),
        child: ElevatedButton(
          onPressed: () {
            GetArticlesEvent eventWithCategory = GetArticlesEvent(
                categoryName: widget.category, countryName: widget.country);

            if (BlocProvider.of<NewsBloc>(context).state is! NewsLoadingState) {
              BlocProvider.of<NewsBloc>(context).add(eventWithCategory);
            }

            widget.onClicked(widget.category, widget.buttonID);
          },
          style: ElevatedButton.styleFrom(
            primary: widget.isSelected
                ? Colors.green.shade700
                : Colors.green.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.1),
            ),
          ),
          child: Text(widget.category),
        ),
      ),
    );
  }
}
