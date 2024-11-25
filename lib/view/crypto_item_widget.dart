import 'package:crypto_future_builder/controller/crypto_controller.dart';
import 'package:flutter/material.dart';


class CryptoItemWidget extends StatefulWidget {
  const CryptoItemWidget({super.key});

  @override
  State<CryptoItemWidget> createState() => _CryptoItemWidgetState();
}

class _CryptoItemWidgetState extends State<CryptoItemWidget> {
  //A future that will hold list of banners once loaded from API
  //late Future<Map<String,dynamic>> futureCategory;
  late Future<Map<String,dynamic>> futureCategory;

  @override
  void initState() {
    super.initState();
    futureCategory = CryptoController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureCategory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Categories'),
            );
          } else {
            final categories = snapshot.data!;
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2
                        ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      
                    },
                    // child: Column(
                    //   children: [
                    //     Image.network(
                    //       category.data.coinInfo.ImageUrl,
                    //       width: 50,
                    //       height: 50,
                    //     ),
                    //     Text(category.data.display.usd.MARKET,
                    //     style: const TextStyle(
                    //                   color: AppTheme.whiteColor,
                    //                   fontSize: 14,
                    //                   fontWeight: FontWeight.w600),)
                    //   ],
                    // ),
                  );
                });
          }
        });
  }
}
