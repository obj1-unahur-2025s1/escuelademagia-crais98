class Hechizo {
  const dificultad
  method cumpleCondicion(unEstudiante) = unEstudiante.habilidad() > dificultad
  method daño() = dificultad + 10
  method curar() = 0
  method paraliza() = false
  method afectarA(individuo)
  method afectarAlLanzador(unLanzador)
}

class Imperdonable inherits Hechizo {
  const property dañoAlLanzador 
  override method daño() = super()*2
  override method afectarA(individuo){
    individuo.disminuirSalud(self.daño())

  }
  override method afectarAlLanzador(unLanzador){
    unLanzador.disminuirSalud(dañoAlLanzador)
  }
}

class Cruciatus inherits Imperdonable {}
class Imperius inherits Imperdonable {}
class Avadakedabra inherits Imperdonable {}

class SectumSempra inherits Hechizo {
  override method cumpleCondicion(unEstudiante) = !unEstudiante.esPeligroso()
  override method afectarA(individuo){
    individuo.disminuirSalud(self.daño())
  }
  override method afectarAlLanzador(unLanzador){
    unLanzador.disminuirHabilidad(1)
  }
}
