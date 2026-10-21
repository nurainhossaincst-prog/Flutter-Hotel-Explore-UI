import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  int selectedIndex = 0;

  bool isFavorite = false;
  bool isiconbutton = false;
  bool islocation = false;

  final TextEditingController scarchcontroller = TextEditingController();
  String scarching = "";
  final List<Map<String, dynamic>> category = [
    {
      'name': 'Burj Al Arab Jumeirah',
      'image': 'https://media.cntravellerme.com/photos/64aeaef37e05fa81b21f30b6/1:1/w_1964,h_1964,c_limit/Burj-Al-Arab-Jumeirah__2018_Exterior-+-Terrace-3.jpg',
      'location': 'Dubai - United Arab Emirates',
      'pement': '1000',
    },
    {
      'name': 'Marina Bay Sands',
      'image': 'https://images.openai.com/static-rsc-4/FbTniBhlXhspw0Og0GSjlTyXQB1k_vVz3rfx7Fsw52-uyWD5vSKn0tws0x7jBtN_78EpMP8CqaM-SdVb487U5CtHsconf6NqwUe8_ocDWz5veXWab0Tj8TCA2GDp1PNpSjNDI0wQdhVv6Vm3nhpCWnkl9VCfuRqv6OUYBes4iuKC2_WZdDn0--RbA8bHymEu?purpose=fullsize',
      'location': 'Marina Bay Sands Singapore',
      'pement': '1525',
    },
    {
      'name': 'The Peninsula Bangkoks',
      'image': 'https://images.openai.com/static-rsc-4/T4QcEBiRXIxdAaKf7UgQZd1_lAJVsPBtn6jsxFAhECcEh8Am0hxPZ7_hPnE7IAUQxovyDxtqKSLSkHeUkBymedMSo850iDNcgvUbToC9aT-eWz8Xrhd6bkNgwLJMtTKWyjeBImhCUTAsIJyHhi0znzBTOHPeE-9vfVkdM5r2Lc2Vyjs5_RYqO4-snYNSaKqL?purpose=fullsize',
      'location': 'Bangkok, Thailand',
      'pement': '25200',
    },
    {
      'name': 'Raffles Singapore',
      'image': 'https://images.openai.com/static-rsc-4/OqF9dx3ZZsW4muhLCxXWHN63EZMAu7rd_5Oupb48aq6LamzpmDgvoBlMfQLrGbtdNau25HcaUA1Yru7i2NqdMnBrWEfLKPHBZVvjhkdg1uGNxrwSk5aa7qFRNtO2VG2mMo_ukUJSP69WfgLsKXbG-LZDeneIGCe4ugJmZWF-8YMaFoJLVVTu5nVHrF9hlyxc?purpose=fullsize',
      'location': 'Singapore',
      'pement': '5633220',
    },
    {
      'name': 'Le Royal Monceau – Raffles Paris',
      'image': 'https://images.openai.com/static-rsc-4/4N39DC8psYc1mfxQYaN873aQ5S5UCE6ozThbybejCHZ3E9rZ90cgrFxhJquEUMwUg1srcQTuQINHQUqoK4WpZykWvi3buxfK5JN_iLKN0FGJ-Kfs_R_onPuzU8p4lP_Y2sFuLtVFrc6xGDxvPzSFwnGQHPooJDKV1CQ06KhyKBY?purpose=inline',
      'location': 'Paris, France',
      'pement': '30000',
    },
    {
      'name': 'Shangri-La Hotels and Resorts',
      'image': 'https://images.openai.com/static-rsc-4/KEqQrXdpH2EWUYKjMBCF321aj2ZE4cl5BIiHP-lteYDEVxidW-x6zrlnx5qod4VgTckaWg0MhpAjHhsTtNQAuphO46sKqPjEmpsk86PtiMPsZuzvobLVYaqjyPx6ckLjY5RLBC77bKzzNYLBJmxFT6QQoqsCx5boDtMHS96zvyBEmAnp1Y59FyvryMlepowX?purpose=fullsize',
      'location': 'International luxury chain',
      'pement': '32255',
    },
  ];
  late List<int> ratings;

  late List<bool> favorites;

  @override
  void initState() {
    super.initState();
    favorites = List.filled(category.length, false);
    ratings = List.filled(category.length, 0);
  }

  @override
  void dispose() {
    scarchcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtercategory = category.where((item) {
      return item['name'].toString().toLowerCase().contains(
        scarching.toLowerCase(),
      );
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: Text('Explore'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(Icons.favorite),
            color: isFavorite
                ? const Color.fromARGB(255, 237, 13, 13)
                : const Color.fromARGB(255, 21, 19, 19),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                islocation = !islocation;
              });
            },
            icon: Icon(Icons.add_location),
            color: islocation ? Color.fromARGB(255, 17, 67, 2) : Colors.green,
            focusColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        ],
      ),

      backgroundColor: const Color.fromARGB(255, 236, 229, 215),
      drawer: Drawer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: scarchcontroller,
              onChanged: (value) {
                setState(() {
                  scarching = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search category...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {
                    scarchcontroller.clear();
                    setState(() {
                      scarching = '';
                    });
                  },
                  icon: Icon(Icons.clear),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filtercategory.length,

                itemBuilder: (context, index) {
                  final item = category[index];

                  final selected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.black26,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                item['image'],
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 180,
                                    color: Colors.grey.shade300,
                                    child: const Center(
                                      child: Icon(Icons.hotel, size: 50),
                                    ),
                                  );
                                },
                              ),

                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        favorites[index] = !favorites[index];
                                      });
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: favorites[index]
                                          ? const Color.fromARGB(255, 234, 7, 7)
                                          : const Color.fromARGB(
                                              255,
                                              233,
                                              220,
                                              220,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['name'],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                size: 15,
                                                color: Colors.teal,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  item['location'],
                                                  style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 8),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          item['pement'],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'per night',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10),

                                Row(
                                  children: List.generate(5, (starIndex) {
                                    return IconButton(
                                      onPressed: () {
                                        setState(() {
                                          ratings[index] = starIndex + 1;
                                        });
                                      },
                                      icon: Icon(
                                        starIndex < ratings[index]
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: starIndex < ratings[index]
                                            ? Colors.amber
                                            : Colors.grey,
                                      ),
                                    );
                                  }),
                                ),

                                Text(ratings[index].toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
