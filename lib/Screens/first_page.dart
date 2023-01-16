import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider_State/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ItemProvider>(context, listen: false).getItems,
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? const Center(child: CircularProgressIndicator())
          : Consumer<ItemProvider>(
              child: Center(
                heightFactor: MediaQuery.of(context).size.height * 0.03,
                child: const Text(
                  'You have no data.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              builder: (ctx, itemProvider, child) => itemProvider.items.isEmpty
                  ? child as Widget
                  : Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        itemCount: itemProvider.items.length,
                        itemBuilder: (ctx, i) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: Colors.white70,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 250,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          itemProvider.items[i].photo,
                                        ),
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text.rich(TextSpan(
                                          text:
                                              '• ${itemProvider.items[i].name}',
                                        )),
                                        Text.rich(TextSpan(
                                          text:
                                              '• ${itemProvider.items[i].address}',
                                        )),
                                        Text.rich(TextSpan(
                                          text:
                                              '• ${itemProvider.items[i].booking}',
                                        )),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
    );
  }
}
