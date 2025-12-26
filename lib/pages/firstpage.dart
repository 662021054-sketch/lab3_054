import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form-99"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// ชื่อ
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "กรุณากรอกชื่อ";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "ชื่อ",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 16),

              /// นามสกุล
              TextFormField(
                controller: _lastnameController,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "กรุณากรอกนามสกุล";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "นามสกุล",
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 16),

              /// เบอร์โทรศัพท์
              TextFormField(
                controller: _phoneController,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "กรุณากรอกเบอร์โทรศัพท์";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "เบอร์โทรศัพท์",
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 24),

              /// ปุ่ม Submit
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("ชื่อ : ${_nameController.text}");
                      print("นามสกุล : ${_lastnameController.text}");
                      print("เบอร์โทรศัพท์ : ${_phoneController.text}");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
