---
layout: single
title: "PCCE 기출문제 8번"
categories: coding test
tag: PCCE 기출문제
toc: true
sidebar:
  nav: "counts"
---

# [PCCE 기출문제] 8번 / 창고 정리

## 문제 설명

\_posts/2024-10-08-codingtest7.md

## 제한사항

1 ≤ storage의 길이 = num의 길이 ≤ 30
storage[i]는 영어 대소문자로 이루어져 있습니다.
물건은 대소문자를 구분합니다. 즉, "Book"과 "book"은 서로 다른 물건입니다.
1 ≤ storage[i]의 길이 ≤ 30
1 ≤ num[i] ≤ 20
num[i]에는 storage[i]에 해당하는 물건의 개수가 담겨있습니다.
가장 개수가 많은 물건이 두 가지 이상인 경우는 없습니다.
한 칸에는 한 종류의 물건만 들어갈 수 있습니다.

## 입출력 예

storage num result
["pencil", "pencil", "pencil", "book"] [2, 4, 3, 1] "pencil"
["doll", "doll", "doll", "doll"] [1, 1, 1, 1] "doll"
["apple", "steel", "leaf", "apple", "leaf"] [5, 3, 5, 3, 7] "leaf"
["mirror", "net", "mirror", "net", "bottle"] [4, 1, 4, 1, 5] "mirror"

입출력 예 설명
입출력 예 #1

본문에 설명된 대로 창고를 정리하면 clean_storage = ["pencil", "book"], clean_num = [9, 1]이 됩니다. 따라서 가장 개수가 많은 물건인 "pencil"을 return합니다.
입출력 예 #2

창고를 정리하면 clean_storage = ["doll"], clean_num = [4]가 됩니다. 따라서 가장 개수가 많은 물건인 "doll"을 return합니다.

입출력 예 #3

창고를 정리하면 clean_storage = ["apple", "steel", "leaf"], clean_num = [8, 3, 12]가 됩니다. 따라서 가장 개수가 많은 물건인 "leaf"를 return합니다.

입출력 예 #4

창고를 정리하면 clean_storage = ["mirror", "net", "bottle"], clean_num = [8, 2, 5]가 됩니다. 따라서 가장 개수가 많은 물건인 "mirror"를 return합니다.
cpp를 응시하는 경우 리스트는 배열과 동일한 의미이니 풀이에 참고해주세요.
ex) 번호가 담긴 정수 리스트 numbers가 주어집니다. => 번호가 담긴 정수 배열 numbers가 주어집니다.
java를 응시하는 경우 리스트는 배열, 함수는 메소드와 동일한 의미이니 풀이에 참고해주세요.
ex) solution 함수가 올바르게 작동하도록 한 줄을 수정해 주세요. => solution 메소드가 올바르게 작동하도록 한 줄을 수정해 주세요.

## 문제풀이

```
class Solution {
    public String solution(String[] storage, int[] num) {
        int num_item = 0;
        String[] clean_storage = new String[storage.length];
        int[] clean_num = new int[num.length];

        for(int i=0; i<storage.length; i++){
            int clean_idx = -1;
            for(int j=0; j<num_item; j++){
                if(storage[i].equals(clean_storage[j])){
                    clean_idx = j;
                    break;
                }
            }
            if(clean_idx == -1){
                clean_storage[num_item] = storage[i];
                clean_num[num_item] = num[i];
                num_item += 1;
            }
            else{
                clean_num[clean_idx] += num[i];
            }
        }

        // 아래 코드에는 틀린 부분이 없습니다.

        int num_max = -1;
        String answer = "";
        for(int i=0; i<num_item; i++){
            if(clean_num[i] > num_max){
                num_max = clean_num[i];
                answer = clean_storage[i];
            }
        }
        return answer;
    }
}

```
