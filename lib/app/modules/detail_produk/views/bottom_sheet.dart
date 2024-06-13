import 'package:flutter/material.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:input_quantity/input_quantity.dart';

class BottomViewDetailProduk extends StatelessWidget {
  const BottomViewDetailProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jumlah pesanan',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: InputQty(
                        decoration: QtyDecorationProps(
                            isBordered: false,
                            borderShape: BorderShapeBtn.circle,
                            btnColor: myColor().primaryColor,
                            width: 8),
                        steps: 1,
                        initVal: 5,
                        minVal: 1,
                        onQtyChanged: (value) {}),
                  ),
                  const Text(
                    'Minimal pembelian item 5',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Subtotal'),
                  Text('Rp. 50.000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: myColor().primaryColor)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: myColor().primaryColor, width: 2.5),
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {},
                  child: Text(
                    'Beli Sekarang',
                    style: TextStyle(color: myColor().primaryColor),
                  )),
              const Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: myColor().primaryColor),
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: const Text(
                  'Tambah Keranjang',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
