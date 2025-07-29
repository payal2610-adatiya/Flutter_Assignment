//Task 19:
//Create a class hierarchy with a Vehicle superclass and Car and Bike subclasses. Implement
//methods in each subclass that print specific details, like the type of vehicle, fuel type, and
//max speed
class Vehicle{
   String fuel_type;
   int max_speed;
   Vehicle(this.fuel_type,this.max_speed);
   display()
   {
     print("Fuel type: $fuel_type and Maximum speed: $max_speed");
   }
}
class Car extends Vehicle
{
   String type;
  Car(this.type,super.fuel_type, super.max_speed);
  car_details()
  {
    display();
    print("vehicle type:$type");
  }
}
class Bike extends Vehicle
{
   String type;

  Bike(this.type,super.fuel_type, super.max_speed);
  bike_details()
  {
     display();
     print("vehicle type:$type");
  }
}
void main()
{
   var c=Car("Car", "CNG", 200);
   c.car_details();
   var b=Bike("Bike", "Petrol", 130);
   b.bike_details();
}
