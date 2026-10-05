class SpaceAge {

    double seconds;
    
    SpaceAge(double seconds) {
        this.seconds = seconds;
    }

    double getSeconds() {
        return this.seconds;
    }

    double onEarth() {
        return onPlanet(3);
    }

    double onMercury() {
        return onPlanet(1);
    }

    double onVenus() {
       return onPlanet(2);
    }

    double onMars() {
        return onPlanet(4);
    }

    double onJupiter() {
        return onPlanet(5);
    }

    double onSaturn() {
       return onPlanet(6);
    }

    double onUranus() {
       return onPlanet(7);
    }

    double onNeptune() {
        return onPlanet(8);
    }

    private double onPlanet(int no){
        double age=0;
        double earth = this.seconds/31557600;
        switch(no){
            case 1:  
                age = earth/0.2408467;
                break;
            case 2:  
                age = earth/0.61519726;
                break;
            case 3:  
                age = earth;
                break;
            case 4:  
                age = earth/1.8808158;
                break;
            case 5:  
                age = earth/11.862615;
                break;
            case 6:  
                age = earth/29.447498;
                break;
            case 7:  
                age = earth/84.016846;
                break;
            case 8:  
                age = earth/164.79132;
                break;
        }        
        return age;
    }

}
