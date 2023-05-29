import 'package:flutter/material.dart';
import 'package:hukibu/model/firestore_mothods.dart';
import 'package:velocity_x/velocity_x.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  bool isLoading = false;
  final title = TextEditingController();
  final description = TextEditingController();
  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Add Note".text.make(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Title...",
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            20.heightBox,
            TextFormField(
              controller: description,
              maxLines: 20,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Description...",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              ),
            ),
            20.heightBox,
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(context.screenWidth * 0.4, 50),
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.white),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (title.text.isEmpty) {
                    VxToast.show(context, msg: "Title cant be empty");
                    setState(() {
                      isLoading = false;
                    });
                  } else if (description.text.isEmpty) {
                    VxToast.show(context, msg: 'Description cant be empty');
                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    await FireStoreServices.addNotes(
                            title: title.text, description: description.text)
                        .then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                      VxToast.show(context, msg: "Note Added");
                    });
                  }
                },
                child: isLoading
                    ? const CircularProgressIndicator().centered()
                    : "Save".text.makeCentered())
          ],
        ).p12(),
      ),
    );
  }
}
