function plants(diagram, student)
    plant_dict = Dict('R'=>"radishes", 'C'=>"clover", 'G'=>"grass", 'V'=>"violets")
    student_no = Int(student[1]) - Int('A')
    offset = div(length(diagram),2) + 1 + 2*student_no;
    [get(plant_dict, diagram[2*student_no+1], "none"),
    get(plant_dict, diagram[2*student_no+2], "none"),
    get(plant_dict, diagram[offset+1], "none"),
    get(plant_dict, diagram[offset+2], "none")]
end
