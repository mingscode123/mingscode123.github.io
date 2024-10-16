---
layout: single
title: "자바 개념 정리"
categories: JAVA
tag: [Java, 개념정리]
toc: true
sidebar:
  nav: "counts"
---

# 자바 개념 정리

## 1. 클래스, 객체, 인스턴스

### 1-1. 클래스란?

- **클래스**는 객체를 만들어 내기 위한 설계도로서, 변수와 메서드의 집합입니다.
- 객체의 속성과 동작을 정의하며, 동일한 특성을 가진 객체들을 생성하는 틀입니다.

### 1-2. 객체란?

- **객체**는 클래스에서 정의한 내용을 바탕으로 메모리에 할당된 실체입니다.
- 소프트웨어 세계에서 구현할 대상이며, 클래스의 인스턴스라고도 합니다.

### 1-3. 인스턴스란?

- **인스턴스**는 클래스가 구체화되어 메모리에 할당된 객체를 의미합니다.
- 객체를 실체화한 것으로, 객체와 인스턴스는 유사한 의미로 사용되지만, 인스턴스는 메모리에 할당된 상태를 강조합니다.

```
// 클래스 선언
public class Animal {
    // 필드와 메서드 정의
}

// 객체 생성 및 인스턴스화
public class Main {
    public static void main(String[] args) {
        Animal cat = new Animal(); // 인스턴스 생성
        Animal dog = new Animal(); // 인스턴스 생성
    }
}
```

- 클래스 vs 객체: 클래스는 설계도, 객체는 설계도로 만들어진 구체적인 대상입니다.
- 객체 vs 인스턴스: 객체는 실체 자체를 말하며, 인스턴스는 클래스와의 관계를 강조할 때 사용합니다.

## 2. 클래스의 3요소 (객체 모델링)

- 필드 (Field): 객체의 속성을 나타내는 멤버 변수입니다.
- 생성자 (Constructor): 객체 생성 시 호출되어 필드를 초기화하는 특수한 메서드입니다.
- 메서드 (Method): 객체의 동작이나 기능을 정의하는 함수입니다.

```
public class Person {
    // 필드
    private String name;
    private int age;

    // 생성자
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // 메서드
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }
}

// 인스턴스 생성 및 사용
Person person = new Person("Alice", 25);
String name = person.getName();
int age = person.getAge();
```

## 오버로딩 (Overloading)

- 오버로딩은 동일한 이름의 메서드를 매개변수의 타입, 개수, 순서를 다르게 하여 여러 개 정의하는 것입니다.
- 다양한 매개변수 조합에 대해 하나의 메서드 이름을 사용할 수 있어 코드의 가독성과 유지보수성이 높아집니다.

```
public class Calculator {
    // 정수 덧셈
    public int add(int a, int b) {
        return a + b;
    }

    // 실수 덧셈
    public double add(double a, double b) {
        return a + b;
    }

    // 세 개의 정수 덧셈
    public int add(int a, int b, int c) {
        return a + b + c;
    }
}
```

## 4. 인스턴스 멤버 vs 정적 멤버

- 인스턴스 멤버: 객체에 소속된 멤버로, 객체를 생성해야 사용할 수 있습니다.
  인스턴스 필드, 인스턴스 메서드 등이 포함됩니다.
- 정적 멤버: 클래스에 소속된 멤버로, 객체 생성 없이 클래스 이름으로 직접 사용할 수 있습니다.
  정적 필드, 정적 메서드 등이 포함됩니다.

차이점

- 소유 주체
  인스턴스 멤버: 객체
  정적 멤버: 클래스

- 메모리 할당 시점
  인스턴스 멤버: 객체 생성 시
  정적 멤버: 클래스 로딩 시

- 접근 방법
  인스턴스 멤버: 객체를 통해 접근
  정적 멤버: 클래스 이름으로 직접 접근

- 예시

```
public class Calculator {
   // 인스턴스 필드와 메서드
   String color;
   void setColor(String color) { this.color = color; }

   // 정적 메서드
   static int plus(int x, int y) { return x + y; }
   static int minus(int x, int y) { return x - y; }
  }
  // 사용법
  Calculator calc = new Calculator();
  calc.setColor("Red"); // 인스턴스 멤버 사용

  int result = Calculator.plus(10, 5); // 정적 멤버 사용
```

# 5 final 필드와 상수

- final 필드: 한 번 초기화되면 변경할 수 없는 필드입니다.
  필드 선언 시 또는 생성자에서 초기화합니다.
  상수: static final로 선언된 필드로, 모든 객체에서 공유되며 변경할 수 없습니다.

```
public class Constants {
   public static final double PI = 3.14159;
   public final String name;

   public Constants(String name) {
       this.name = name;
   }
  }
```
