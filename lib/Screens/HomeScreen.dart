import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    List<String> catergories = [
      "Smart Phone",
      "Laptops",
      "Watches",
      "Headphones"
    ];
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 80,
            title: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 10),
                  child: IconButton(
                    onPressed: () {},
                    iconSize: 12,
                    icon: SvgPicture.asset("assets/icons/MenuIcon.svg"),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(maxHeight: 30),
                        prefixIcon: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: SvgPicture.asset("assets/icons/Search.svg")),
                        contentPadding: const EdgeInsets.all(18),
                        label: Container(
                          margin: const EdgeInsets.only(left: 8.0, top: 1),
                          child: const Text(
                            "Search",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.black))),
                  ),
                ),
              ],
            ),
            // leading:
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: const Text(
                "CheckOut Our Latest Products",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catergories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        selectedIndex = index;
                      },
                      child: Text(
                        catergories[index],
                        style: TextStyle(
                            fontWeight: index == selectedIndex
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: index == selectedIndex
                                ? Colors.purple
                                : Colors.grey),
                      ),
                    ),
                  );
                }),
          )),
          SliverToBoxAdapter(
              child: Container(
            height: 350,
            margin: const EdgeInsets.only(left: 40, top: 20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        selectedIndex = index;
                      },
                      child: Container(
                        height: 300,
                        width: 200,
                        color: Colors.amber,
                      ),
                    ),
                  );
                }),
          )),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Show More -",
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBar(fixedColor: Color(0xffF2F2F2), items: [
        BottomNavigationBarItem(
            icon: IconButton(
              icon: SvgPicture.asset("assets/icons/House.svg"),
              onPressed: () {},
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: SvgPicture.asset("assets/icons/Heart.svg"),
              onPressed: () {},
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: SvgPicture.asset("assets/icons/Profile.svg"),
              onPressed: () {},
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: IconButton(
              icon: SvgPicture.asset("assets/icons/Buy.svg"),
              onPressed: () {},
            ),
            label: "")
      ]),
    );
  }
}
