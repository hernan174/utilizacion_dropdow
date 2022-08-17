import 'package:flutter/material.dart';
import 'package:utilizacion_dropdow/model/pais_model.dart';
import 'package:utilizacion_dropdow/model/persona_model.dart';
import 'package:utilizacion_dropdow/widget/dropdow_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo utilizacion Dropdow',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo Dropdow'),
        ),
        body: const _Contenido(),
      ),
    );
  }
}

class _Contenido extends StatefulWidget {
  const _Contenido({
    Key? key,
  }) : super(key: key);

  @override
  State<_Contenido> createState() => _ContenidoState();
}

class _ContenidoState extends State<_Contenido> {
  ///Estas Listas son elementos que estarian en el [State] del bloc de donde se sacaria el listado de elemento
  final List<PersonaModel> lstPersona = const [
    PersonaModel(idPersona: '1', nombre: 'Hernan', edad: '28'),
    PersonaModel(idPersona: '2', nombre: 'Pepe', edad: '21'),
    PersonaModel(idPersona: '3', nombre: 'Juan', edad: '45'),
  ];
  final List<PaisModel> lstPais = const [
    PaisModel(idPais: '1', nombre: 'Argentina', abreviatura: 'ARG'),
    PaisModel(idPais: '2', nombre: 'Brasil', abreviatura: 'BR'),
  ];
  PersonaModel? personaSeleccionada;
  PaisModel? paisSeleccionado;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              DropdowWidget(
                valorDefecto: personaSeleccionada,
                valores: lstPersona,
                maxWidth: 500,
                titulo: 'Personas',
                onChanged: (value) {
                  personaSeleccionada = value as PersonaModel;
                },
              ),
              Expanded(
                  child: ListView(
                children: lstPersona
                    .map((e) => InkWell(
                        onTap: () => setState(() {
                              personaSeleccionada = e;
                            }),
                        child: Text(e.nombre)))
                    .toList(),
              ))
            ],
          )),
          const SizedBox(width: 15),
          Expanded(
              child: Column(
            children: [
              DropdowWidget(
                valorDefecto: paisSeleccionado,
                valores: lstPais,
                maxWidth: 500,
                titulo: 'Personas',
                onChanged: (value) {
                  paisSeleccionado = value as PaisModel;
                },
              ),
              Expanded(
                  child: ListView(
                children: lstPais
                    .map((e) => InkWell(
                        onTap: () => setState(() {
                              paisSeleccionado = e;
                            }),
                        child: Text(e.nombre)))
                    .toList(),
              ))
            ],
          ))
        ],
      ),
    );
  }
}
