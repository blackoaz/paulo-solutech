import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_tracker/blocs/createVisitsBloc.dart';

class AddVisits extends StatefulWidget {
  const AddVisits({super.key});

  @override
  State<AddVisits> createState() => _AddVisitsState();
}

class _AddVisitsState extends State<AddVisits> {
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController activityNameController = TextEditingController();
  final TextEditingController activityNotesController = TextEditingController();
  final TextEditingController additionalNotesController = TextEditingController();

  String? customerType;
  String? purpose;
  String status = "Scheduled";

  @override
  Widget build(BuildContext context) {
    final createActivityBloc = Provider.of<CreateVisitsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/homepage', (route) => false);
          },
        ),
        title: Text("Add New Visit", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _sectionCard(
              title: "Customer Information",
              children: [
                _buildTextField(
                  label: "Customer Name *",
                  hint: "Enter customer name",
                  controller: customerNameController,
                ),
                _buildDropdown(
                  label: "Customer Type",
                  hint: "Select customer type",
                  value: customerType,
                  onChanged: (val) => setState(() => customerType = val),
                  items: ["Retail", "Wholesale", "Online"],
                ),
                _buildTextField(
                  label: "Location",
                  hint: "Enter customer location",
                  controller: locationController,
                ),
              ],
            ),
            SizedBox(height: 16),
            _sectionCard(
              title: "Visit Details",
              children: [
                Row(
                  children: [
                    Expanded(child: _buildTextField(label: "Date *", hint: "dd/mm/yyyy",controller: dateController)),
                    SizedBox(width: 16),
                    Expanded(child: _buildTextField(label: "Time *", hint: "--:--",controller: timeController)),
                  ],
                ),
                _buildDropdown(label: "Purpose",
                    value: purpose,
                    onChanged: (val) => setState(() => purpose = val),
                    hint: "Select visit purpose"),
                _buildDropdown(
                  label: "Status",
                  hint: "Select status",
                  value: status,
                  onChanged: (val) => setState(() => status = val!),
                  items: ["Scheduled", "Completed", "Cancelled"],
                )
              ],
            ),
            SizedBox(height: 16),
            _sectionCard(
              title: "Planned Activities",
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text("Add"),
                    ),
                  ],
                ),
                _buildTextField(label: "Activity name",
                    hint: "Enter activity name",
                controller: activityNameController),
                _buildTextField(
                  label: "Activity notes (optional)",
                  hint: "Enter notes",
                  controller: activityNotesController,
                  maxLines: 3,
                ),
              ],
            ),
            SizedBox(height: 16),
            _sectionCard(
              title: "Additional Notes",
              children: [
                _buildTextField(
                  label: "",
                  hint: "Enter any additional notes about this visit...",
                  controller: additionalNotesController,
                  maxLines: 4,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Cancel"),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      createActivityBloc.submitVisit(customerNameController.text, customerType!,locationController.text,
                        dateController.text, timeController.text,purpose!,status,activityNameController.text,
                        activityNotesController.text,additionalNotesController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("Save Visit"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),

    );
  }


  Widget _sectionCard({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
        required String hint,
        required TextEditingController controller,
        int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String hint,
    required String? value,
    required Function(String?) onChanged,
    List<String> items = const ["Option 1", "Option 2", "Option 3"],
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: value,
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            ),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            hint: Text(hint),
          ),
        ],
      ),
    );
  }
}
