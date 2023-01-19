import 'package:aman_project/data/form_management.dart';
import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/models/rent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/property_managemnt.dart';
import '../models/property.dart';
import '../presentation/shared_features/custom_message.dart';
import '../../constants/globals.dart' as val;

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class ExtractedWidgets {
  Column propertyDetailsDescriptionAndAddress(
      Property routeArgs, bool isVisible) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            "Description For User".tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.descriptionUser,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
            child: Text(
              "Description For Admin".tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: Text(
              routeArgs.descriptionAdmin,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
            child: Text(
              "Address For Admin".tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: Text(
              routeArgs.addressAdmin,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            "Address For User".tr,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.addressUser,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }

  Stack strokeWidget(String text, double size, [Color? color]) {
    return Stack(
      children: [
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            // color: Colors.white,
            fontSize: size,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = const Color.fromARGB(255, 41, 39, 39),
          ),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          text,
          style: TextStyle(
            color: color ?? const Color.fromARGB(255, 255, 255, 255),
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildFeature(
      IconData iconData, String? text, String aboveText, BuildContext context) {
    if (text != null) {
      if (text.isNotEmpty) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  aboveText,
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  iconData,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }

  Widget buildPhoto(String url) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: CachedNetworkImageProvider(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Visibility deleteButton(
      {required bool isVisible,
      required BuildContext context,
      Property? routeArgsProperty,
      Rents? routeArgsRents,
      required String type}) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Delete".tr),
                content: Text(
                    "Are you sure you would like to delete this property?".tr),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).focusColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      'Cancel'.tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (type == 'property') {
                        PropertyManagement.deleteProduct(
                            routeArgsProperty!.docId!,
                            routeArgsProperty.singleImage,
                            routeArgsProperty.multiImages);
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else if (type == 'rent') {
                        RentsManagement.deleteRent(routeArgsRents!.docId!);

                        Navigator.pop(context);
                        Navigator.of(context).pushReplacementNamed(
                            '/MainPageRent',
                            arguments: routeArgsRents.rentType);
                      }
                      goodMessageSnackBar(
                          "Success".tr, "Successfully deleted property".tr);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(val.snackBar);
                    },
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      'Yes'.tr,
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Theme.of(context).errorColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          child: Text(
            "Delete".tr,
          ),
        ),
      ),
    );
  }
}

class PaidButtonWidget extends StatefulWidget {
  const PaidButtonWidget({
    Key? key,
    required this.isVisible,
    required this.context,
    required this.routeArgsRents,
  }) : super(key: key);

  final bool isVisible;
  final BuildContext context;
  final Rents routeArgsRents;

  @override
  State<PaidButtonWidget> createState() => _PaidButtonWidgetState();
}

class _PaidButtonWidgetState extends State<PaidButtonWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _customController = TextEditingController();
    return Visibility(
      visible: widget.isVisible,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("How Many Days?"),
                content: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Card(
                          elevation: 15,
                          child: ListTile(
                            title:
                                const Text("Start and End of Rent Differing"),
                            onTap: () {
                              RentsManagement.updateRentDaysDifference(
                                  widget.routeArgsRents.tor =
                                      widget.routeArgsRents.tor,
                                  widget.routeArgsRents.torEnd =
                                      widget.routeArgsRents.torEnd,
                                  widget.routeArgsRents.docId!);
                              Navigator.pop(context, widget.routeArgsRents);
                              setState(() {});
                            },
                          ),
                        ),
                        Card(
                          elevation: 15,
                          child: ListTile(
                            title: const Text("Add 30 Days"),
                            onTap: () {
                              RentsManagement.updateRents30Days(
                                  widget.routeArgsRents.tor =
                                      widget.routeArgsRents.tor,
                                  widget.routeArgsRents.torEnd =
                                      widget.routeArgsRents.torEnd,
                                  widget.routeArgsRents.docId!);
                              Navigator.pop(context, widget.routeArgsRents);
                              setState(() {});
                            },
                          ),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Card(
                                elevation: 15,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FormManagement.buildTextField(
                                      labelText: "Add Custom Days",
                                      hintText: "Add Custom Days",
                                      controller: _customController,
                                      type: "number",
                                      show: true,
                                      context: context),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      RentsManagement.updateRentsCustomDays(
                                          widget.routeArgsRents.tor =
                                              widget.routeArgsRents.tor,
                                          widget.routeArgsRents.torEnd =
                                              widget.routeArgsRents.torEnd,
                                          widget.routeArgsRents.docId!,
                                          int.parse(_customController.text));
                                      Navigator.pop(
                                          context, widget.routeArgsRents);
                                      setState(() {});
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 10,
                                    backgroundColor:
                                        Theme.of(context).primaryColorDark,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Theme.of(context).splashColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          child: const Text(
            "Paid",
          ),
        ),
      ),
    );
  }
}
