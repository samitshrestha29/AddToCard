import 'package:card_pratice/cart_controller.dart';
import 'package:card_pratice/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowProduct extends ConsumerWidget {
  const ShowProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: ListView(
        children: [
          ...products.map(
            (e) => ListTile(
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () =>
                    ref.read(cartControllerProvider.notifier).addProduct(e),
              ),
              title: Text(e.name),
              subtitle: Text("Rs${e.price}"),
            ),
          ),
          Text(
              "This is Cart : ${ref.watch(cartControllerProvider.notifier).getTotalPrice()}"),
          ...ref.watch(cartControllerProvider).map(
                (e) => ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => ref
                        .read(cartControllerProvider.notifier)
                        .removeProduct(e),
                  ),
                  title: Text(e.name),
                  subtitle: Column(
                    children: [
                      Text(
                          "Rs${e.price} Quantity : ${e.quantity} Total : ${e.getTotalPrice()}"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(cartControllerProvider.notifier)
                                    .quanity(e, "increament");
                              },
                              icon: const Icon(
                                Icons.add,
                              )),
                          Text("${e.quantity}"),
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(cartControllerProvider.notifier)
                                    .quanity(e, "sub");
                              },
                              icon: const Icon(
                                Icons.remove,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              )
        ],
      ),
    );
  }
}
