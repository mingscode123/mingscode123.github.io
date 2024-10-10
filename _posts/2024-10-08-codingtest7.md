---
layout: single
title: "PCCE 기출문제 7번"
categories: coding test
tag: PCCE 기출문제
toc: true
sidebar:
  nav: "counts"
---

# [PCCE 기출문제] 7번 / 가습기

## 문제 설명

상우가 사용하는 가습기에는 "auto", "target", "minimum"의 세 가지 모드가 있습니다. 가습기의 가습량은 0~5단계로 구분되며 각 모드 별 동작 방식은 다음과 같습니다.

"auto" 모드

습도가 0 이상 10 미만인 경우 : 5단계
습도가 10 이상 20 미만인 경우 : 4단계
습도가 20 이상 30 미만인 경우 : 3단계
습도가 30 이상 40 미만인 경우 : 2단계
습도가 40 이상 50 미만인 경우 : 1단계
습도가 50 이상인 경우 : 0단계
"target" 모드

습도가 설정값 미만일 경우 : 3단계
습도가 설정값 이상일 경우 : 1단계
"minimum"모드

습도가 설정값 미만일 경우 : 1단계
습도가 설정값 이상일 경우 : 0단계
상우가 설정한 가습기의 모드를 나타낸 문자열 mode_type, 현재 공기 중 습도를 나타낸 정수 humidity, 설정값을 나타낸 정수 val_set이 주어질 때 현재 가습기가 몇 단계로 작동 중인지 return하도록 빈칸을 채워 solution 함수를 완성해 주세요.

## 제한사항

mode_type은 "auto", "target", "minimum" 세 가지 중 하나의 값을 갖습니다.
0 ≤ humidity, val_set ≤ 100

## 입출력 예

`입출력 예
mode_type humidity val_set result
"auto" 23 45 3
"target" 41 40 1
"minimum" 10 34 1
입출력 예 설명
입출력 예 #1

"auto"모드이므로 습도에 따라 가습량이 조절됩니다. 현재 습도가 20 이상 30 미만이므로 3을 return합니다.
입출력 예 #2

"target"모드이고, 설정값보다 습도가 높으므로 1을 return합니다.
입출력 예 #3

"minimum"모드이고, 설정값보다 습도가 낮으므로 1을 return합니다.
cpp를 응시하는 경우 리스트는 배열과 동일한 의미이니 풀이에 참고해주세요.
ex) 번호가 담긴 정수 리스트 numbers가 주어집니다. => 번호가 담긴 정수 배열 numbers가 주어집니다.
java를 응시하는 경우 리스트는 배열, 함수는 메소드와 동일한 의미이니 풀이에 참고해주세요.
ex) solution 함수가 올바르게 작동하도록 한 줄을 수정해 주세요. => solution 메소드가 올바르게 작동하도록 한 줄을 수정해 주세요.

## 문제풀이

```
class Solution {
    public int func1(int humidity, int val_set){
        if(humidity < val_set)
            return 3;
        return 1;
    }

    public int func2(int humidity){
        if(humidity >= 50)
            return 0;
        else if (humidity >= 40)
            return 1;
        else if (humidity >= 30)
            return 2;
        else if (humidity >= 20)
            return 3;
        else if (humidity >= 10)
            return 4;
        else
        return 5;
    }

    public int func3(int humidity, int val_set){
        if(humidity < val_set)
            return 1;
        return 0;
    }

    public int solution(String mode_type, int humidity, int val_set) {
        int answer = 0;

        if(mode_type.equals("auto")){
            answer = func2(humidity);
        }
        else if(mode_type.equals("target")){
            answer = func1(humidity,val_set);
        }
        else if(mode_type.equals("minimum")){
            answer = func3(humidity, val_set);
        }

        return answer;
    }
}

```
