---
layout: single
title: "리액트 개념 정리 (요약) "
categories: concept summary
tag: 개념 정리
toc: true
sidebar:
  nav: "counts"
---

# [리액트 개념 정리] 요약

**리액트(React)**는 사용자 인터페이스(UI)를 만들기 위한 자바스크립트 라이브러리로, 페이스북에서 개발했습니다. 주로 웹 애플리케이션의 뷰(View) 레이어를 관리하는 데 사용됩니다.
리액트의 가장 큰 특징은 컴포넌트 기반 개발과 **가상 DOM(Virtual DOM)**을 사용하여 UI 성능을 최적화하고, 복잡한 상태 관리를 간결하게 처리할 수 있다는 점입니다.

## 주요 개념

### 컴포넌트(Component)

리액트의 기본 단위는 컴포넌트입니다. 컴포넌트는 자바스크립트 함수 또는 클래스로 정의되며, UI의 일부분을 독립적으로 렌더링하고 상태(state)를 관리합니다.
컴포넌트는 재사용 가능한 코드 블록으로, 복잡한 UI를 여러 개의 작은 컴포넌트로 나눌 수 있습니다.

```jsx
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
```

### JSX

리액트에서는 JSX(JavaScript XML)라는 특별한 문법을 사용하여 자바스크립트 코드 안에서 HTML 요소를 직접 작성할 수 있습니다. JSX는 HTML과 유사하게 보이지만, 자바스크립트 문법과 통합되어 있습니다.

```jsx
const element = <h1>Hello, world!</h1>;
```

### 상태(State)와 속성(Props)

- **Props**: 부모 컴포넌트에서 자식 컴포넌트로 데이터를 전달하는 방법으로, 수정이 불가능한 읽기 전용 데이터입니다.

```jsx
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

<Welcome name="Sara" />;
```

- **State**: 컴포넌트 자체에서 관리하는 동적인 데이터입니다. 상태는 변경될 수 있으며, 변경 시 컴포넌트는 다시 렌더링됩니다.

```jsx
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date() };
  }

  render() {
    return (
      <div>
        <h1>It is {this.state.date.toLocaleTimeString()}.</h1>
      </div>
    );
  }
}
```

리액트는 실제 DOM 대신 **가상 DOM(Virtual DOM)**을 사용하여 UI 업데이트의 성능을 향상시킵니다. 가상 DOM은 메모리 내에서 일종의 가벼운 DOM 복사본을 유지하며, 상태가 변경될 때마다 변경된 부분만 실제 DOM에 반영합니다. 이를 통해 불필요한 DOM 조작을 최소화하고 성능을 최적화합니다.

### 훅(Hooks)

리액트 16.8 버전부터 도입된 **훅(Hooks)**은 함수형 컴포넌트에서도 상태 관리와 생명 주기 메서드와 같은 기능을 사용할 수 있도록 해줍니다.

- **useState**: 상태를 관리할 수 있는 훅

```jsx
import React, { useState } from "react";

function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>Click me</button>
    </div>
  );
}
```

- **useEffect**: 생명 주기 메서드를 관리하는 훅 (컴포넌트가 렌더링된 후에 실행할 코드를 작성할 수 있음)

```jsx
import React, { useState, useEffect } from "react";

function Timer() {
  const [time, setTime] = useState(new Date());

  useEffect(() => {
    const timerID = setInterval(() => setTime(new Date()), 1000);

    // cleanup function
    return () => clearInterval(timerID);
  }, []);

  return <h1>{time.toLocaleTimeString()}</h1>;
}
```
