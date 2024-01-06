import 'package:augmented_reality/items.dart';
import 'package:augmented_reality/virtual_ar_view_screen.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatefulWidget {
  Items? clickedItemInfo;
  ItemDetailsScreen({
    this.clickedItemInfo,
  });
  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          widget.clickedItemInfo!.itemName.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          //try item virtually (Ar view)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => VirtualARViewScreen(
                clickedItemImageLink:
                    widget.clickedItemInfo!.itemImage.toString(),
              ),
            ),
          );
        },
        label: const Text(
          "Try Virtually (AR view)",
        ),
        icon: const Icon(
          Icons.mobile_screen_share_rounded,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.clickedItemInfo!.itemImage.toString(),
              ),
              const Divider(
                color: Colors.black26,
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  widget.clickedItemInfo!.itemName.toString(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  widget.clickedItemInfo!.itemDescription.toString(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "₹" + widget.clickedItemInfo!.itemPrice.toString(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 310.0),
                  child: Divider(
                    height: 1,
                    thickness: 2,
                    color: Colors.white70,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
