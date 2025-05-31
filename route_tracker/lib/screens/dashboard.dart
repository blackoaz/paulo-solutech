import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "RTM Sales Tracker",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Track your customer visits and activities",
                style: TextStyle(color: Colors.grey[600]),
              ),

              SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.8,
                children: [
                  _statCard("Total Visits", "2", Colors.blue),
                  _statCard("Completed", "1", Colors.green),
                  _statCard("Scheduled", "1", Colors.purple),
                  _statCard("Activities", "2/6", Colors.orange),
                ],
              ),

              SizedBox(height: 24),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Quick Actions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              SizedBox(height: 12),

              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text("Add New Visit"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),

              SizedBox(height: 8),

              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye_outlined),
                label: Text("View All Visits"),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),

              SizedBox(height: 24),

              // Recent Visits
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Recent Visits", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              SizedBox(height: 12),

              _visitCard(
                title: "ABC Electronics Store",
                status: "completed",
                dateTime: "2024-05-29 at 10:00",
                location: "Downtown Mall, Store #12",
                statusColor: Colors.green[100],
                statusTextColor: Colors.green[800],
              ),

              SizedBox(height: 12),

              _visitCard(
                title: "TechWorld Superstore",
                status: "scheduled",
                dateTime: "2024-05-30 at 14:00",
                location: "Business District, Main Branch",
                statusColor: Colors.blue[100],
                statusTextColor: Colors.blue[800],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _visitCard({
    required String title,
    required String status,
    required String dateTime,
    required String location,
    Color? statusColor,
    Color? statusTextColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(dateTime, style: TextStyle(color: Colors.grey[700])),
          Text(location, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }

}
