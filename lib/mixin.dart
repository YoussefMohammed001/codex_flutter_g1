
class Animal{}
mixin Swimmer{
  void swim(){
    print('swimming');
  }
}

mixin Flyer{
  void fly(){
    print('flying');
  }
}

class Duck  with Swimmer, Flyer {
  @override
  void swim() {
    // TODO: implement swim
  }
}


void main(){
  Duck duck = Duck();
  duck.fly();
  duck.swim();
}



