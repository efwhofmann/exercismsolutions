
class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public int[] getLastWeek() {
        int[] week={0,2,5,3,7,8,4};
        return week;
    }

    public int getToday() {
        return birdsPerDay[birdsPerDay.length - 1];
    }

    public void incrementTodaysCount() {
        birdsPerDay[birdsPerDay.length - 1]++;
    }

    public boolean hasDayWithoutBirds() {
        for( int day : birdsPerDay){
            if(day==0)
                return true;
        }
        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        int sum=0;
        for(int i=0; i<Math.min(numberOfDays, birdsPerDay.length); i++){
            sum += birdsPerDay[i];
        }
        return sum;
    }

    public int getBusyDays() {
        int count=0;
        for(int bird : birdsPerDay){
            count += bird>=5 ? 1 : 0;
        }
        return count;
    }
}
