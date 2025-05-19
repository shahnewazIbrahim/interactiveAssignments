
void main() {
  List<int> numbers = [16,3,1,17,30,6];
  int maximum_number = numbers[0];
  for (var element in numbers) {
    if(element > maximum_number) maximum_number = element;
  }
  print("Maximum Number: $maximum_number");
}
