class Meetup {

static Map<String, int> weekdays = {
  "Monday" : DateTime.monday,
  "Tuesday" : DateTime.tuesday,
  "Wednesday" : DateTime.wednesday,
  "Thursday" : DateTime.thursday,
  "Friday" : DateTime.friday,
  "Saturday" : DateTime.saturday,
  "Sunday" : DateTime.sunday
};
  
 String meetup({required int year, required int month, required String week, required String dayofweek}){
    var candidate = DateTime(year, month, 1);
    final oneDay = Duration(days: 1);
    final oneWeek = Duration(days: 7);
    while (candidate.weekday != weekdays[dayofweek]!){
      candidate = candidate.add(oneDay);
    }
    switch(week) {
      case 'first':
        break;
      case 'second':
        candidate = candidate.add(oneWeek);
      case 'third':
        candidate = candidate.add(oneWeek*2); 
      case 'fourth':
        candidate = candidate.add(oneWeek*3); 
      case 'teenth':
        candidate = candidate.add(oneWeek);
        if(candidate.day<13)
          candidate = candidate.add(oneWeek);
      case 'last':
        while(candidate.add(oneWeek).month == month){
          candidate = candidate.add(oneWeek);}
    } 
    return "$candidate".substring(0,10);
 }
}
