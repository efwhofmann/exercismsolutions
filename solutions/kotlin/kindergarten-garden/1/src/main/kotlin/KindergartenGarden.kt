class KindergartenGarden(private val diagram: String) {

    private val plants = mapOf('C' to "clover", 'G' to "grass", 'R' to "radishes", 'V' to "violets")

    private fun getPlant(code: Char) : String {
        return plants.get(code) ?: ""        
    }

    fun getPlantsOfStudent(student: String): List<String> {  
        val idx = student[0] - 'A'
        val offset = diagram.length/2 + 1 + 2*idx
        return listOf(getPlant(diagram[2*idx]),
                      getPlant(diagram[2*idx+1]),
                      getPlant(diagram[offset]),
                      getPlant(diagram[offset+1]))
    }
}
