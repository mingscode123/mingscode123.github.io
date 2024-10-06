---
layout: single
title: "자바스크립트 개념 정리 (요약) "
categories: concept_summary
tag: [javascript, 개념 정리]
toc: true
sidebar:
  nav: "counts"
---

# [자바스크립트 개념 정리] 요약

## 기본 개념

**자바스크립트(JavaScript)**는 웹 브라우저에서 동작하는 스크립팅 언어입니다. 주로 클라이언트 측에서 사용되며, 웹 페이지의 동적인 요소를 제어하거나 사용자와의 상호작용을 가능하게 합니다.
자바스크립트는 HTML 및 CSS와 함께 웹 개발의 기본 기술 중 하나입니다.

## 특징

- **인터프리터 언어**: 자바스크립트는 소스 코드를 기계어로 번역하지 않고, 한 줄씩 실행하는 인터프리터 언어입니다.
- **동적 타이핑(Dynamic Typing)**: 변수의 타입을 명시하지 않고 런타임에 동적으로 결정됩니다.
- **비동기 처리(Asynchronous)**: 자바스크립트는 기본적으로 비동기적인 처리를 지원하며, 이벤트 루프(Event Loop)를 통해 비동기적인 코드를 효율적으로 관리합니다.
- **객체 기반(Object-Based)**: 자바스크립트는 프로토타입 기반의 객체 지향 언어로서, 클래스가 아닌 객체를 사용하여 상속과 다형성을 구현합니다.

## 주요 기능

- **DOM 조작**: 자바스크립트는 웹 페이지의 DOM(Document Object Model)을 동적으로 조작하여 HTML 요소를 추가, 제거, 수정할 수 있습니다.

```javascript
document.getElementById("myElement").innerText = "Hello, JavaScript!";
```

- **이벤트 핸들링**: 사용자의 클릭, 키보드 입력 등의 이벤트를 감지하고 처리할 수 있습니다.

```javascript
document.getElementById("myButton").addEventListener("click", function () {
  alert("Button clicked!");
});
```

- **비동기 처리 (Promises, async/await)**: 자바스크립트는 비동기 요청(예: 서버 API 요청)을 처리하기 위해 Promise나 async/await 구문을 사용합니다.

```javascript
fetch("https://api.example.com/data")
  .then((response) => response.json())
  .then((data) => console.log(data));

async function getData() {
  const response = await fetch("https://api.example.com/data");
  const data = await response.json();
  console.log(data);
}
```
