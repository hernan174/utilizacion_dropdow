import 'package:utilizacion_dropdow/model/modelo_base.dart';

///Implementacion de la clase [ModeloBase].
class PaisModel extends ModeloBase {
  final String idPais;
  final String nombre;
  final String abreviatura;

  const PaisModel({
    this.idPais = '',
    this.nombre = '',
    this.abreviatura = '',
  }) :

        ///Se hace referencia a super para tener acceso al constructor de [ModeloBase] y
        ///pasarle los valores a sus propiedades
        super(idItem: idPais, descripcionItem: nombre);

  ///[props] Es el override de la clase [Equatable]. Es `Obligatorio` poner las propiedades de la
  ///clase para que dart sepa como hacer las comparaciones por objetos y determinar cuando son iguales
  @override
  List<Object?> get props => [idPais, nombre, abreviatura];
}
