class Materia {
  const property profesor
  const property estudiantes = #{}
  var hechizoActual = null
  const criatura

  method cambiarHechizo(otroHechizo) {
    hechizoActual = otroHechizo
  }
  method dictarMateria() {
    estudiantes.forEach({a=>a.aprenderHechizo(hechizoActual)})
  }
  method realizarPractica() {
    estudiantes.forEach({a=>a.lanzarHechizoA(criatura, hechizoActual)})
  }
  method inscribirEstudiante(unEstudiante){
    estudiantes.add(unEstudiante)
  }
  method darDeBaja(unEstudiante) {
    estudiantes.remove(unEstudiante)
  }
}