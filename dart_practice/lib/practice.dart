class Practice {
  // We have not defined a constructor. Dart will provide a default constructor called Practice()

  String getLast(String str) {
    /// This method should return the last character of the 'str' parameter.
    return str.substring(str.length - 1, str.length);
  }

  String getNth(List<String> names, int index) {
    /// This method should return the element at "index" of the list "names"
    return names[index];
  }
}

class Person {
  String first;
  String last;
  int age;

  Person(this.first, this.last, this.age);

  String getWelcome() {
    return 'My name is $first $last and I am $age years old.';
  }
}

class OptionalPerson {
  String first;
  String last;
  int? age;

  OptionalPerson(this.first, this.last, [this.age]);

  String getWelcome() {
    if (age != null) {
      return 'My name is $first $last and I am $age years old.';
    } else {
      return 'My name is $first $last.';
    }
  }
}
