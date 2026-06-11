class SpaceAge(val seconds : Long) {

   private val relativePeriods = mapOf(
                            "Mercury"   to 0.2408467,
                            "Venus"     to 0.61519726,
                            "Earth"     to	1.0,
                            "Mars"	    to 1.8808158,
                            "Jupiter"	to 11.862615,
                            "Saturn"	to 29.447498,
                            "Uranus"	to 84.016846,
                            "Neptune"	to 164.79132)
   
    private fun ageOn(planet : String) : Double {
        val earthSeconds =  31557600
        return seconds / (relativePeriods.getOrDefault(planet, 1.0) * earthSeconds)
    } 

    fun onEarth(): Double = ageOn("Earth")
    fun onMercury(): Double = ageOn("Mercury")
    fun onVenus(): Double = ageOn("Venus")
    fun onMars(): Double = ageOn("Mars")
    fun onJupiter(): Double = ageOn("Jupiter")
    fun onSaturn(): Double = ageOn("Saturn")
    fun onUranus(): Double = ageOn("Uranus")
    fun onNeptune(): Double = ageOn("Neptune")
}
