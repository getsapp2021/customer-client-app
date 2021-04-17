import 'dart:async';
import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/utils/enums/bottom_sheet_type.dart';
import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        _FloatingBoxBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.checkout: (context, sheetRequest, completer) =>
        _GCheckoutBottomBar(request: sheetRequest, completer: completer)
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

class _FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const _FloatingBoxBottomSheet({
    Key key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ThemeColors.grey,
            ),
          ),
          SizedBox(height: 10),
          Text(
            request.description,
            style: TextStyle(color: ThemeColors.grey),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () => completer(SheetResponse(confirmed: true)),
                child: Text(
                  request.secondaryButtonTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              FlatButton(
                onPressed: () => completer(SheetResponse(confirmed: true)),
                child: Text(
                  request.mainButtonTitle,
                  style: TextStyle(color: ThemeColors.white),
                ),
                color: Theme.of(context).primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _GCheckoutBottomBar extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const _GCheckoutBottomBar({Key key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GRoundedButton(
        onPressed: completer(SheetResponse(confirmed: true)),
        color: ThemeColors.primary,
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  request.title,
                  style: TextStyle(fontSize: 12, color: ThemeColors.white),
                ),
                Text(
                  request.description,
                  style: TextStyle(fontSize: 16, color: ThemeColors.white),
                ),
              ],
            ),
            Text(
              request.mainButtonTitle,
              style: TextStyle(fontSize: 16, color: ThemeColors.white),
            )
          ],
        ),
      ),
    );
  }
}
