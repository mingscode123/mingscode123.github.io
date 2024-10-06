---
layout: single
title: "자바 개념 정리 (요약) "
categories: concept_summary
tag: [java, 개념 정리]
toc: true
sidebar:
  nav: "counts"
---

# [자바 개념 정리] 요약

## 1. 객체 지향 프로그래밍 (OOP)

추상화(Abstraction)
추상화는 불필요한 세부 사항을 숨기고 중요한 기능만을 외부에 노출시키는 개념입니다. 예를 들어, 자동차의 운전자는 엔진의 작동 원리를 몰라도 운전할 수 있듯이, 클래스의 사용자도 내부 구현을 몰라도 메서드나 속성을 사용할 수 있습니다.
자바에서는 abstract 키워드를 사용하여 추상 클래스와 추상 메서드를 선언할 수 있습니다.

```java
abstract class Animal {
    abstract void sound();
}

class Dog extends Animal {
    void sound() {
        System.out.println("Bark");
    }
}
```

캡슐화(Encapsulation)
캡슐화는 객체의 데이터(속성)와 그 데이터를 처리하는 메서드를 하나의 단위로 묶고, 외부에서 직접 접근하지 못하도록 제한하는 원칙입니다. 이를 통해 외부에서 잘못된 접근을 방지하고, 객체의 무결성을 유지할 수 있습니다.
자바에서 private, protected, public 접근 제어자를 사용하여 데이터의 접근을 제한합니다.

```java
class Person {
    private String name;
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
```

상속(Inheritance)
상속은 기존 클래스를 기반으로 새로운 클래스를 만들 수 있게 하며, 이를 통해 코드의 재사용성을 높일 수 있습니다. 상위 클래스(부모 클래스)의 속성과 메서드를 하위 클래스(자식 클래스)가 상속받습니다.
extends 키워드를 사용하여 상속을 구현합니다.

```java
class Animal {
    void eat() { System.out.println("Eating"); }
}
class Dog extends Animal {
    void bark() { System.out.println("Barking"); }
}
```

다형성(Polymorphism)
다형성은 동일한 이름의 메서드가 다른 방식으로 동작하는 것을 의미합니다. 자바에서는 오버로딩(Overloading)과 오버라이딩(Overriding) 두 가지 형태로 다형성을 지원합니다.
오버로딩(Overloading): 같은 이름의 메서드를 여러 번 정의하되, 매개변수의 타입이나 개수가 달라야 합니다.
오버라이딩(Overriding): 상위 클래스에서 정의된 메서드를 하위 클래스에서 재정의하는 것을 의미합니다. 오버라이딩된 메서드는 객체가 상위 클래스 타입으로 선언되어 있어도, 하위 클래스의 구현이 호출됩니다.

```java
// 메서드 오버로딩
class Calculator {
    int add(int a, int b) {
        return a + b;
    }
    double add(double a, double b) {
        return a + b;
    }
}

// 메서드 오버라이딩
class Animal {
    void sound() {
        System.out.println("Some sound");
    }
}

class Dog extends Animal {
    void sound() {
        System.out.println("Bark");
    }
}
```

## 2. 클래스와 객체

클래스(Class)
클래스는 객체를 생성하기 위한 청사진입니다. 속성(필드)과 동작(메서드)을 정의합니다.

```java
class Car {
    // 속성(필드)
    String model;
    int speed;

    // 동작(메서드)
    void drive() {
        System.out.println("The car is driving.");
    }
}
```

객체(Object)
클래스의 인스턴스로, 클래스에서 정의된 속성과 동작을 실제로 가지는 실체입니다. new 키워드를 사용하여 객체를 생성합니다.

```java
Car myCar = new Car(); // 객체 생성
myCar.model = "BMW";
myCar.drive();
```

## 3. 상속

상속을 통한 코드 재사용
상속을 사용하면 부모 클래스에서 정의된 필드와 메서드를 자식 클래스에서 사용할 수 있으며, 이를 통해 코드 재사용성을 극대화할 수 있습니다.
자바에서는 단일 상속만 허용되지만, 인터페이스를 통해 다중 구현이 가능합니다.

```java
class Animal {
    String name;
    void eat() {
        System.out.println("Eating...");
    }
}

class Cat extends Animal {
    void meow() {
        System.out.println("Meowing...");
    }
}

Cat cat = new Cat();
cat.eat(); // 부모 클래스의 메서드 사용
cat.meow(); // 자식 클래스의 메서드
```

## 4. 인터페이스(Interface)

인터페이스의 역할
인터페이스는 클래스가 구현해야 하는 메서드의 목록을 정의합니다. 인터페이스 자체는 메서드의 구현을 포함하지 않으며, 구현은 해당 인터페이스를 구현한 클래스에서 이루어집니다.
인터페이스를 사용하면 다중 구현이 가능해집니다.

```java
interface Animal {
    void sound();
}

class Dog implements Animal {
    public void sound() {
        System.out.println("Bark");
    }
}

class Cat implements Animal {
    public void sound() {
        System.out.println("Meow");
    }
}
```

## 5. 예외 처리(Exception Handling)

예외 처리의 구조
자바에서 예외 처리는 프로그램이 예외 상황에 적절히 대응하도록 합니다. 예외는 try, catch, finally 블록을 사용하여 처리합니다.
Checked Exception(컴파일 시점에 확인)과 Unchecked Exception(런타임 시점에 발생)으로 구분됩니다.

```java
try {
    int result = 10 / 0; // ArithmeticException 발생
} catch (ArithmeticException e) {
    System.out.println("Cannot divide by zero!");
} finally {
    System.out.println("Finally block executed.");
}
```

## 6. JVM, JRE, JDK

JVM(Java Virtual Machine)
JVM은 자바 프로그램이 실행되는 가상 머신입니다. 자바 코드를 중간 단계인 바이트코드로 변환하여 JVM에서 실행합니다. 이를 통해 자바 프로그램은 운영 체제와 독립적으로 실행될 수 있습니다.
JRE(Java Runtime Environment)
JRE는 자바 프로그램을 실행하기 위한 환경입니다. JVM과 필요한 라이브러리, 클래스 파일 등이 포함되어 있습니다.
JDK(Java Development Kit)
JDK는 자바 애플리케이션을 개발하고 컴파일할 수 있는 도구입니다. JRE와 개발 도구(javac, debugger 등)가 포함되어 있습니다.

## 7. Garbage Collection

자바는 메모리 관리를 개발자가 직접 하지 않고, JVM이 자동으로 수행합니다. 더 이상 참조되지 않는 객체를 메모리에서 제거하는 것이 Garbage Collection입니다.
이를 통해 메모리 누수를 방지하고 효율적으로 메모리를 사용할 수 있습니다.

## 8. 패키지(Package)

패키지는 관련된 클래스들을 그룹화하여 관리합니다. 네임스페이스를 제공해 클래스 이름이 충돌하는 것을 방지하고, 클래스의 논리적 구조를 명확히 합니다.

```java
package com.myapp; // 패키지 선언

public class MyClass {
    // 클래스 내용
}
```
