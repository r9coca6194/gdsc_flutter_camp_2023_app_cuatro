import 'package:gdsc_flutter_camp_2023_app_cuatro/data/models/news_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Result arguments =
        ModalRoute.of(context)!.settings.arguments as Result;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  arguments.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: arguments.title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      width: double.infinity,
                      height: 300,
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(
                        arguments.imageUrl ??
                            'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Description:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(arguments.description),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "More Information:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  children: [
                    Text(
                      "Country: ${arguments.country[0]}",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Creator: ${arguments.creator[0]}",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Text(
                      "Link new: ${arguments.link}",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('ALERTA'),
                    content: const Text('Mira esto es cine'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  );
                });

            // showModalBottomSheet(
            //   context: context,
            //   builder: (context) {
            //     return Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const Text(
            //             "Comentarios",
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           TextFormField(
            //             decoration: InputDecoration(
            //               hintText: 'Ingresa tu comentario',
            //               filled: true,
            //               fillColor: Colors.black38,
            //               enabledBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(
            //                   20,
            //                 ),
            //                 borderSide: BorderSide.none,
            //               ),
            //               focusedBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(
            //                   20,
            //                 ),
            //                 borderSide: BorderSide.none,
            //               ),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(
            //                   20,
            //                 ),
            //                 borderSide: BorderSide.none,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // );
          },
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }
}
