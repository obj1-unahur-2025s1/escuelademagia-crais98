import hechizos.*
class Casa {
  method esPeligroso(unEstudiante) = unEstudiante.salud()>0
}

class Criatura {
  var property salud
  method aumentarSalud(cantidad) {
    salud = (salud + cantidad).min(100)
  }
  method disminuirSalud(cantidad) {
    salud = (salud - cantidad).max(0)
  }
}

class Grifindor inherits Casa {
  override method esPeligroso(unEstudiante) = false
}
class Sliterin inherits Casa {}
class Ravenclaw inherits Casa {
  override method esPeligroso(unEstudiante) = super(unEstudiante) and unEstudiante.habilidad() > 10
}
class Huplehuf inherits Casa {
  override method esPeligroso(unEstudiante) = super(unEstudiante) and unEstudiante.esSangrePura()
}

class Mago{
  const property esSangrePura
  var property salud
  var property casa
  const property hechizos = []
  var property habilidad = 0
  var paralizado = false


  method aumentarSalud(cantidad) {
    salud = (salud + cantidad).min(100)
  }
  method disminuirSalud(cantidad) {
    salud = (salud - cantidad).max(0)
  }
  method aumentarHabilidad(cantidad) {
    habilidad = (habilidad + cantidad).min(100)
  }
  method disminuirHabilidad(cantidad) {
    habilidad = (habilidad - cantidad).max(0)
  }
  method lanzarHechizoA(individuo, unHechizo) {
    if(!self.puedeRealizarHechizo(unHechizo))
      self.error("El estudiante no cumple los requisitos para este hechizo")

    unHechizo.afectarA(individuo)
    unHechizo.afectarAlLanzador(self)

  }
  method puedeRealizarHechizo(unHechizo) = hechizos.contains(unHechizo) and unHechizo.cumpleCondicion(self) 
  method esPeligroso() = casa.esPeligroso(self)
  method aprenderHechizo(unHechizo) {
    hechizos.add(unHechizo)
    self.aumentarHabilidad(1)
  }

}