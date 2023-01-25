import 'package:example_app/wallet/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletLayoutList extends StatelessWidget {
  const WalletLayoutList({super.key});

  @override
  Widget build(BuildContext context) {
    WalletService service = Provider.of<WalletService>(context, listen: true);
    List<String> wallets = service.model.wallets;
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Wallets", style: TextStyle(fontSize: 32)),
                    ),
                    Expanded(
                        child: ListView.separated(
                      itemCount: wallets.length,
                      itemBuilder: (context, index) {
                        String address = wallets[index];
                        return ListTile(
                          title: Text(wallets[index],
                              style: TextStyle(
                                  fontWeight:
                                      address == service.model.tikiSdk?.address
                                          ? FontWeight.bold
                                          : FontWeight.normal)),
                          leading: const Icon(Icons.keyboard_arrow_left,
                              color: Color(0xFFD2D5D7)),
                          onTap: () {
                            if (address != service.model.tikiSdk?.address) service.loadTikiSdk(address);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ))
                  ]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          service.loadTikiSdk();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
