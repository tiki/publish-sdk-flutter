import 'package:example_app/wallet/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'layout_list.dart';

class WalletLayoutBtn extends StatelessWidget {
  const WalletLayoutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    WalletService service = Provider.of<WalletService>(context, listen: true);
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: const Color(0xFFDDDDDD)),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(padding: EdgeInsets.all(8), child: Text(
                          service.model.tikiSdk?.address ?? "Create a Wallet"))),
                  const Icon(Icons.keyboard_arrow_right)
                ]),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider.value(
                    value: service, child: const WalletLayoutList())))));
  }
}
