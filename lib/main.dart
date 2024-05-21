import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footgo/pages/navigationbar_screen.dart';
import 'HomeScreenBloc/home_screen_bloc.dart';
import 'ProductBloc/product_bloc.dart';
Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeScreenBloc()),
        BlocProvider(create: (context) => ProductBloc()),

    ],
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  const BottomNavigationBarScreen(),
        ),
      ),
    );
  }
}
