class form3Fields {
  static String fecha = 'fecha';
  static String horaInicio = 'hora inicio';
  static String horaFin = 'hora fin';
  static String lugarTrabajo = 'lugar trabajo';
  static String ubicacion = 'ubicación';
  static String altura = 'altura';
  static String tipoTrabajoAltura = 'tipo trabajo altura';
  //Las segundas variables son los vectores de los sw
  //Parte 4 form 4
  static String nombreapellidos = 'nombre y apellidos';
  static String cedula = 'cedula';
  static String arl = 'arl';
  static String eps = 'eps';
  static String cargo = 'cargo';

  //Parte 3
    static String vect3_1 = "Se dispone de los elementos necesarios para trabajar en alturas";
    static String vect3_2 = "Trabajadores autorizados y capacitados para el trabajo en alturas";
    static String vect3_3 = "Guantes de poliuretano y/o carnaza";
    static String vect3_4 = "Botas de seguridad dieléctricas";
    static String vect3_5 = "Gafas de seguridad";
    static String vect3_6 = "Casco con barbuquejo";
    static String vect3_7 = "Están todos los elementos de protección contra caídas";
    static String vect3_8 = "Eslinga con retenedor de caída dieléctricos";
    static String vect3_9 = "Gancho de la eslinga en buen estado";
    static String vect3_10 = "Retenedor de caída en buen estado";
    static String vect3_11 = "Arnes de seguridad dieléctrico";
    static String vect3_12 = "Argollas del arnes en buen estado";

  //Parte 4
    static String vect4_1 = "Los equipos utilizados se encuentran certificados y vigentes";
    static String vect4_2 = "Existen equipos contra incendios, en buen estado y próximos";
    static String vect4_3 = "Las condiciones físicas y psicológicas del personal son óptimas";
    static String vect4_4 = "Se señalizó y delimitó el área de trabajo";
    static String vect4_5 = "Se cuenta con todos los documentos del personal";
    static String vect4_6 = "Se cuenta con el AST/ correctamente diligenciado";
    static String vect4_7 = "El área de ejecución de la labor se encuentra limpia";

    static List<String> getFields() => [
          fecha,
          horaInicio, 
          horaFin,
          lugarTrabajo,
          ubicacion, 
          altura, 
          tipoTrabajoAltura,
          nombreapellidos,
          cedula, 
          arl,
          eps,
          cargo,
          vect3_1,
          vect3_2,
          vect3_3,
          vect3_4,
          vect3_5,
          vect3_6,
          vect3_7,
          vect3_8,
          vect3_9,
          vect3_10,
          vect3_11,
          vect3_12, 
          vect4_1, 
          vect4_2,
          vect4_3,
          vect4_4,
          vect4_5,
          vect4_6,
          vect4_7,
    ];

}