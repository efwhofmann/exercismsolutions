class Triangle {
  bool valid(double a, double b, double c){
    return (a>0 && b>0 && c>0)
      && (a+b>=c && b+c>=a && a+c>=b);
  }

  bool equilateral(double a, double b, double c){
    return valid(a,b,c) && (a==b && b==c);
  }

  bool scalene(double a, double b, double c){
    return valid(a,b,c) && (a!=b && a!=c && b!=c);
  }

  bool isosceles(double a, double b, double c){
    return valid(a,b,c) && (a==b || a==c || b==c);
  }


}
