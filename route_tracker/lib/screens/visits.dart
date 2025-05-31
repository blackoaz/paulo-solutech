import 'package:flutter/material.dart';


class Visits extends StatefulWidget {
  const Visits({super.key});

  @override
  State<Visits> createState() => _VisitsState();
}

class _VisitsState extends State<Visits> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black,width: 1.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10,
                children: [
                  Icon(Icons.search, size: 30),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search customers or locations",
                      ),
                      ),
                  ),
                ]
            
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: (){}, child: Text("All"),),
              ElevatedButton(onPressed: (){}, child: Text("Scheduled"),),
              ElevatedButton(onPressed: (){}, child: Text("Completed"),),
              // ElevatedButton(onPressed: (){}, child: Text("Cancelled"),),
            ],

          ),
          SizedBox(height: 20),
          Text("All Visits(143)",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
              textAlign: TextAlign.left),
          SizedBox(height: 20,),
          _card(customerName: "ABC Electronic Stores", category: "Retail", date: "2025-05-31",
          time: "19:31", location: "Down Town mall shop #12",purpose: "Product Demo"),
          _card(customerName: "ABC Electronic Stores", category: "Retail", date: "2025-05-31",
              time: "19:31", location: "Down Town mall shop #12",purpose: "Product Demo")
        ],

      ),
    );
  }

  Widget _card({required String customerName, required category, required date,
    required time, required location, required purpose}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(customerName, style: TextStyle(fontWeight: FontWeight.bold))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "completed",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12),
          Text(category,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 5,
            children: [
              Icon(Icons.date_range_outlined),
              Text(date, style: TextStyle(fontSize: 12)),
              Icon(Icons.access_time_outlined),
              Text(time, style: TextStyle(fontSize: 12)),
            ],

          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 5,
            children: [
              Icon(Icons.location_on_outlined),
              Text(location, style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 5,
            children: [
              Text("Purpose: ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
              Text(purpose, style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
