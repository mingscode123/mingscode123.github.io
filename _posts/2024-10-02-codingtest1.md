---
layout: single
title: "PCCE 기출문제 1번"
categories: coding test
tag: PCCE 기출문제
toc: true
sidebar:
  nav: "counts"
---

# [PCCE 기출문제] 1번 / 출력

## 문제 설명

주어진 초기 코드는 변수에 데이터를 저장하고 출력하는 코드입니다.
아래와 같이 출력되도록 빈칸을 채워 코드를 완성해 주세요.

## 출력 예시

Spring is beginning
13
310

## 문제풀이

```
#include <iostream>

using namespace std;

int main(void) {
    string msg = "Spring is beginning";
    int val1 = 3;
    string val2 = "3"
;

    cout << msg << endl;
    cout << val1 + 10 << endl;
    cout << val2 + "10" << endl;

    return 0;
}
```
