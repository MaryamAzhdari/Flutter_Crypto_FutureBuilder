import 'package:crypto_future_builder/controller/crypto_controller.dart';
import 'package:crypto_future_builder/model/crypto_entity.dart';
import 'package:crypto_future_builder/theme.dart';
import 'package:crypto_future_builder/view/crypto_row_widget.dart';
import 'package:flutter/material.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({super.key});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  late Future<Map<String, dynamic>> futureCategory;

  @override
  void initState() {
    super.initState();
    futureCategory = CryptoController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
        backgroundColor: AppTheme.backColorDark,
        appBar: AppBar(
          backgroundColor: AppTheme.backColorDark,
          title: Text(
            'Top Cryptos',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Add width condition of Web
            if (constraints.maxWidth > 600) {
              return _buildWeb(context, themeData);
            } else {
              return _buildMobile(context, themeData);
            }
          },
        ));
  }

  Container _buildWeb(BuildContext context, ThemeData themeData) {
    return Container(
      color: AppTheme.backColorDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const Divider(
                height: 2,
                color: AppTheme.whiteColor,
              ),
              banner(100),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              resultServer(context, themeData),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildMobile(BuildContext context, ThemeData themeData) {
    return Container(
      color: AppTheme.backColorDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(
                height: 2,
                color: AppTheme.whiteColor,
              ),
              banner(200),
              const SizedBox(
                height: 20,
              ),
              resultServer(context, themeData),
            ],
          ),
        ),
      ),
    );
  }

  Image banner(double picSize) {
    return Image.asset(
      'assets/images/safety.png',
      width: picSize,
      height: picSize,
      color: AppTheme.whiteColor,
      fit: BoxFit.cover,
    );
  }

  FutureBuilder resultServer(BuildContext context, ThemeData themeData) {
    return FutureBuilder(
        future: futureCategory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
            // } else if (!snapshot.hasData ||
            //     snapshot.data!.isNotEmpty) {
            //   return const Center(
            //     child: Text('No Categories'),
            //   );
          } else {
            final cryptos = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
                itemCount: cryptos.length,
                itemBuilder: (context, index) {
                  CoinInfoHttp coinInfo =
                      CoinInfoHttp.fromJson(cryptos["Data"][index]["CoinInfo"]);
                  USD_DISPLAYHttp display = USD_DISPLAYHttp.fromJson(
                      cryptos["Data"][index]["DISPLAY"]["USD"]);
                  //List<dynamic> data = cryptos['Data'];
                  return CryptoRowWidget(
                    coinTitle: coinInfo.FullName,
                    coinSign: coinInfo.Name,
                    price: display.PRICE,
                    percentage: display.CHANGEPCT24HOUR,
                    image: coinInfo.imageUrl,
                  );
                });
          }
        });
  }
}
