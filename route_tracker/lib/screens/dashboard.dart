import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/activitiesBloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    final activitiesBloc = Provider.of<ActivitiesBloc>(context, listen: false);
    activitiesBloc.getVisits();
  }

  @override
  Widget build(BuildContext context) {
    final activitiesBloc = Provider.of<ActivitiesBloc>(context);
    final visits = activitiesBloc.visits;

    final int total = visits.length;
    final int completed =
        visits.where((v) => v['status'].toString().toLowerCase() == 'completed').length;
    final int scheduled =
        visits.where((v) => v['status'].toString().toLowerCase() == 'scheduled').length;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Text(
                "RTM Sales Tracker",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Track your customer visits and activities",
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 24),

              // Stats Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.8,
                children: [
                  _statCard("Total Visits", "$total", Colors.blue),
                  _statCard("Completed", "$completed", Colors.green),
                  _statCard("Scheduled", "$scheduled", Colors.purple),
                  _statCard("Activities", "2/6", Colors.orange),
                ],
              ),
              SizedBox(height: 24),

              Text("Quick Actions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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

              Text("Recent Visits", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 12),

              // Scrollable Recent Visits
              Expanded(
                child: visits.isEmpty
                    ? Center(child: Text("No visits available."))
                    : ListView.builder(
                  itemCount: visits.length > 5 ? 5 : visits.length,
                  itemBuilder: (context, index) {
                    final visit = visits[index];
                    final status = visit["status"].toString().toLowerCase();
                    final statusColors = _getStatusColors(status);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _visitCard(
                        title: "Customer ID: ${visit["customer_id"]}",
                        status: visit["status"],
                        dateTime: visit["visit_date"] ?? "",
                        location: visit["location"] ?? "Unknown Location",
                        statusColor: statusColors['bg'],
                        statusTextColor: statusColors['text'],
                      ),
                    );
                  },
                ),
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
              Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold))),
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
          Text(location, style: TextStyle(color: Colors.grey[700])),
          Text(dateTime, style: TextStyle(color: Colors.grey[700])),

        ],
      ),
    );
  }

  Map<String, Color?> _getStatusColors(String status) {
    switch (status) {
      case "completed":
        return {"bg": Colors.green[100], "text": Colors.green[800]};
      case "scheduled":
        return {"bg": Colors.blue[100], "text": Colors.blue[800]};
      default:
        return {"bg": Colors.grey[300], "text": Colors.grey[800]};
    }
  }
}
