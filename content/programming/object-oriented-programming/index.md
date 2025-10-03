---
title: "Object-Oriented Programming: Core Concepts"
date: 2025-10-03
draft: false
description: "Understanding OOP principles, classes, objects, and design patterns"
lessons: ["Programming"]
topics: ["oop", "classes", "inheritance", "polymorphism", "encapsulation"]
---

## Introduction to Object-Oriented Programming

Object-Oriented Programming (OOP) is a programming paradigm that organizes code around objects and data rather than actions and logic. It provides a clear modular structure for programs and makes code more reusable and maintainable.

## The Four Pillars of OOP

### 1. Encapsulation

Encapsulation is the bundling of data and methods that operate on that data within a single unit (class), and restricting direct access to some components.

```python
class BankAccount:
    def __init__(self, account_number, balance):
        self.account_number = account_number
        self.__balance = balance  # Private attribute
    
    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            return True
        return False
    
    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            return True
        return False
    
    def get_balance(self):
        return self.__balance

# Usage
account = BankAccount("12345", 1000)
account.deposit(500)
print(account.get_balance())  # 1500
# print(account.__balance)  # AttributeError - private
```

**Benefits**:
- Data hiding and protection
- Controlled access through methods
- Easier to change implementation without affecting users

### 2. Inheritance

Inheritance allows a class to inherit properties and methods from another class, promoting code reuse.

```python
class Animal:
    def __init__(self, name, species):
        self.name = name
        self.species = species
    
    def make_sound(self):
        pass
    
    def info(self):
        return f"{self.name} is a {self.species}"

class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name, "Dog")
        self.breed = breed
    
    def make_sound(self):
        return "Woof!"
    
    def fetch(self):
        return f"{self.name} is fetching the ball"

class Cat(Animal):
    def __init__(self, name, color):
        super().__init__(name, "Cat")
        self.color = color
    
    def make_sound(self):
        return "Meow!"

# Usage
dog = Dog("Buddy", "Golden Retriever")
cat = Cat("Whiskers", "Orange")

print(dog.info())          # Buddy is a Dog
print(dog.make_sound())    # Woof!
print(dog.fetch())         # Buddy is fetching the ball

print(cat.info())          # Whiskers is a Cat
print(cat.make_sound())    # Meow!
```

**Types of Inheritance**:
- **Single Inheritance**: One parent class
- **Multiple Inheritance**: Multiple parent classes
- **Multilevel Inheritance**: Chain of inheritance
- **Hierarchical Inheritance**: Multiple children from one parent

### 3. Polymorphism

Polymorphism allows objects of different classes to be treated as objects of a common parent class, with methods that behave differently.

```python
class Shape:
    def area(self):
        pass
    
    def perimeter(self):
        pass

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height
    
    def area(self):
        return self.width * self.height
    
    def perimeter(self):
        return 2 * (self.width + self.height)

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius
    
    def area(self):
        return 3.14159 * self.radius ** 2
    
    def perimeter(self):
        return 2 * 3.14159 * self.radius

class Triangle(Shape):
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c
    
    def area(self):
        s = (self.a + self.b + self.c) / 2
        return (s * (s - self.a) * (s - self.b) * (s - self.c)) ** 0.5
    
    def perimeter(self):
        return self.a + self.b + self.c

# Polymorphism in action
shapes = [
    Rectangle(5, 3),
    Circle(4),
    Triangle(3, 4, 5)
]

for shape in shapes:
    print(f"Area: {shape.area():.2f}, Perimeter: {shape.perimeter():.2f}")
```

**Output**:
```
Area: 15.00, Perimeter: 16.00
Area: 50.27, Perimeter: 25.13
Area: 6.00, Perimeter: 12.00
```

### 4. Abstraction

Abstraction hides complex implementation details and shows only the essential features of an object.

```python
from abc import ABC, abstractmethod

class PaymentProcessor(ABC):
    @abstractmethod
    def process_payment(self, amount):
        pass
    
    @abstractmethod
    def refund(self, transaction_id):
        pass

class CreditCardProcessor(PaymentProcessor):
    def process_payment(self, amount):
        print(f"Processing ${amount} via Credit Card")
        # Implementation details hidden
        return f"CC-TRANS-{amount}"
    
    def refund(self, transaction_id):
        print(f"Refunding transaction {transaction_id}")
        return True

class PayPalProcessor(PaymentProcessor):
    def process_payment(self, amount):
        print(f"Processing ${amount} via PayPal")
        return f"PP-TRANS-{amount}"
    
    def refund(self, transaction_id):
        print(f"Refunding PayPal transaction {transaction_id}")
        return True

# Usage
def checkout(processor: PaymentProcessor, amount: float):
    transaction_id = processor.process_payment(amount)
    return transaction_id

# Client code doesn't need to know implementation details
cc_processor = CreditCardProcessor()
pp_processor = PayPalProcessor()

checkout(cc_processor, 99.99)
checkout(pp_processor, 149.50)
```

## Classes and Objects

### Class Definition
```python
class Person:
    # Class variable (shared by all instances)
    species = "Homo sapiens"
    
    def __init__(self, name, age):
        # Instance variables (unique to each instance)
        self.name = name
        self.age = age
    
    # Instance method
    def introduce(self):
        return f"Hi, I'm {self.name} and I'm {self.age} years old"
    
    # Class method
    @classmethod
    def from_birth_year(cls, name, birth_year):
        age = 2024 - birth_year
        return cls(name, age)
    
    # Static method
    @staticmethod
    def is_adult(age):
        return age >= 18

# Creating objects
person1 = Person("Alice", 30)
person2 = Person.from_birth_year("Bob", 1995)

print(person1.introduce())          # Hi, I'm Alice and I'm 30 years old
print(person2.introduce())          # Hi, I'm Bob and I'm 29 years old
print(Person.is_adult(person1.age)) # True
print(Person.species)               # Homo sapiens
```

## Method Types

### 1. Instance Methods
- Operate on instance data
- Have access to `self`
- Most common type

### 2. Class Methods
- Operate on class data
- Use `@classmethod` decorator
- First parameter is `cls`
- Can create alternative constructors

### 3. Static Methods
- Don't access instance or class data
- Use `@staticmethod` decorator
- Like regular functions but belong to class namespace

## Special Methods (Magic Methods)

```python
class Vector:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    
    def __str__(self):
        return f"Vector({self.x}, {self.y})"
    
    def __repr__(self):
        return f"Vector(x={self.x}, y={self.y})"
    
    def __add__(self, other):
        return Vector(self.x + other.x, self.y + other.y)
    
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y
    
    def __len__(self):
        return int((self.x**2 + self.y**2)**0.5)

# Usage
v1 = Vector(3, 4)
v2 = Vector(1, 2)

print(v1)           # Vector(3, 4)
print(v1 + v2)      # Vector(4, 6)
print(v1 == v2)     # False
print(len(v1))      # 5
```

## Design Patterns

### 1. Singleton Pattern
Ensures only one instance of a class exists.

```python
class Database:
    _instance = None
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance.connection = "Connected to database"
        return cls._instance

# Both variables reference the same instance
db1 = Database()
db2 = Database()
print(db1 is db2)  # True
```

### 2. Factory Pattern
Creates objects without specifying the exact class.

```python
class ShapeFactory:
    @staticmethod
    def create_shape(shape_type, *args):
        if shape_type == "circle":
            return Circle(*args)
        elif shape_type == "rectangle":
            return Rectangle(*args)
        elif shape_type == "triangle":
            return Triangle(*args)
        else:
            raise ValueError(f"Unknown shape: {shape_type}")

# Usage
shape = ShapeFactory.create_shape("circle", 5)
```

### 3. Observer Pattern
Objects are notified of changes to other objects.

```python
class Subject:
    def __init__(self):
        self._observers = []
    
    def attach(self, observer):
        self._observers.append(observer)
    
    def notify(self, message):
        for observer in self._observers:
            observer.update(message)

class Observer:
    def __init__(self, name):
        self.name = name
    
    def update(self, message):
        print(f"{self.name} received: {message}")

# Usage
subject = Subject()
observer1 = Observer("Observer 1")
observer2 = Observer("Observer 2")

subject.attach(observer1)
subject.attach(observer2)
subject.notify("Hello observers!")
```

## SOLID Principles

### S - Single Responsibility Principle
A class should have only one reason to change.

### O - Open/Closed Principle
Open for extension, closed for modification.

### L - Liskov Substitution Principle
Derived classes must be substitutable for their base classes.

### I - Interface Segregation Principle
Many specific interfaces are better than one general interface.

### D - Dependency Inversion Principle
Depend on abstractions, not concretions.

## Advantages of OOP

✅ **Modularity**: Code is organized in discrete objects  
✅ **Reusability**: Inheritance and composition promote code reuse  
✅ **Maintainability**: Changes are localized and easier to manage  
✅ **Flexibility**: Polymorphism allows flexible, extensible code  
✅ **Security**: Encapsulation protects data  

## When to Use OOP

- Large, complex applications
- When modeling real-world entities
- When code reuse is important
- Team-based development
- Long-term projects requiring maintenance

## Conclusion

Object-Oriented Programming provides a powerful paradigm for organizing and structuring code. By mastering the four pillars—encapsulation, inheritance, polymorphism, and abstraction—along with design patterns and SOLID principles, you can write cleaner, more maintainable, and scalable software.

## Further Reading
- Design patterns (Gang of Four)
- SOLID principles in depth
- OOP in different languages (Java, C++, JavaScript)
- Composition vs Inheritance
