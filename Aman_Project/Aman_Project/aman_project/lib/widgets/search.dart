import 'package:aman_project/widgets/property_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/data.dart';
import './property_description.dart';
import './filter.dart';
import 'AddForm.dart';
import 'navBar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // List<Property> properties = getPropertyList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 16),
            child: TextField(
              style: const TextStyle(
                fontSize: 28,
                height: 1,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 28,
                  color: Colors.grey[400],
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: (Colors.grey[400])!,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: (Colors.grey[400])!,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: (Colors.grey[400])!,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 32,
                    child: Stack(
                      children: [
                        ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            const SizedBox(
                              width: 24,
                            ),
                            buildFilter("House"),
                            buildFilter("Price"),
                            buildFilter("Security"),
                            buildFilter("Bedrooms"),
                            buildFilter("Garage"),
                            buildFilter("Swimming Pool"),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 28,
                            decoration: const BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showBottomSheet();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16, right: 24),
                    child: Text(
                      "Filters",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 12),
            child: Row(
              children: const [
                Text(
                  "53",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Results found",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                // children: buildProperties(),
                children: DUMMY_PROPERTIES
                    .map((propData) => PropertyItem(
                        id: propData.id,
                        label: propData.label,
                        name: propData.name,
                        price: propData.price,
                        location: propData.location,
                        sqm: propData.sqm,
                        review: propData.review,
                        description: propData.description,
                        frontImage: propData.frontImage,
                        ownerImage: propData.ownerImage,
                        ownerName: propData.ownerName,
                        floor: propData.floor,
                        bathroom: propData.bathroom,
                        bedroom: propData.bedroom,
                        kitchen: propData.kitchen,
                        images: propData.images))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/addForm');
          // context.push('/addFormUnits');
        },
      ),
    );
  }

  Widget buildFilter(String filterName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: Colors.grey.withOpacity(0.1),
            width: 1,
          )),
      child: Center(
        child: Text(
          filterName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        builder: (BuildContext context) {
          return Wrap(
            children: const [
              Filter(),
            ],
          );
        });
  }
}
