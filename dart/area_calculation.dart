abstract class Shape {
  void area();
  
  void display() {
    print("Calculating area of the shape");
  }
}

class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  void area() {
    double area = length * width;
    print("Area of Rectangle: $area");
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  void area() {
    double area = 3.14 * radius * radius;
    print("Area of Circle: $area");
  }
}

void main() {
  Shape rectangle = Rectangle(5.0, 3.0);
  rectangle.display();
  rectangle.area();

  Shape circle = Circle(4.0);
  circle.display();
  circle.area();
}