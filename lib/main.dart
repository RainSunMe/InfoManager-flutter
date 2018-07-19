import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter/rendering.dart";
import "package:redux/redux.dart";
import "package:flutter_redux/flutter_redux.dart";

import "package:info_manager/store/app_state.dart";
import "package:info_manager/store/app_reducer.dart";

import "package:info_manager/i18n/info_manager_localizations.dart" show InfoManagerLocalizationsDelegate;

import "package:info_manager/views/login.dart";
import "package:info_manager/views/info_list.dart";

void main() {
    runApp(new InfoManager());
}

class InfoManager extends StatelessWidget {
    final store = new Store<AppState>(
        appReducer,
        initialState: new AppState()
    );

    @override
    Widget build(BuildContext context) {
        return new StoreProvider(
            store: store,
            child: new MaterialApp(
                title: "InfoManager",
                theme: new ThemeData(
                    primaryColor: Colors.blue
                ),
                home: new LoginPage(),
                localizationsDelegates: [
                    const InfoManagerLocalizationsDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: [
                    const Locale("en", ""),
                    const Locale("zh", "")
                ],
                routes: {
                    "infoListView": (BuildContext context) => new InfoListPage()
                },
            )
        );
    }
}