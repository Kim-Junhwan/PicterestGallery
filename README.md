# PicterestGallery

원티드 프리온 보딩 코스에서 마지막으로 진행한 프로젝트인 [Picterest](https://github.com/Kim-Junhwan/Picterest)를 리팩토링 + 기능 추가한 프로젝트 입니다.

# 추가 기능
| 이미지 검색 | 로그인 |
|:---:|:---:|
|![화면_기록_2023-04-04_오후_9_06_20_AdobeExpress](https://user-images.githubusercontent.com/58679737/229786525-32ed1935-f1f8-4ca8-ad8f-b7f8916ff0e3.gif)|![화면_기록_2023-04-04_오후_9_02_19_AdobeExpress](https://user-images.githubusercontent.com/58679737/229787053-2f64fafd-f21f-4c04-bfe1-5473fd99fb6b.gif)|

# 아키텍처 및 디자인 패턴

- 클린 아키텍처
- MVVM
- Coordinator

## 클린 아키텍처
usecase로 주요 비즈니스 로직 처리
Domain - Network - Presentation 계층 구조로 각 계층의 책임을 나눔

![image](https://user-images.githubusercontent.com/58679737/229797560-edd90b63-4452-4ed1-948b-2efa39494bf2.png)

코드상에서 의존이 생겼을때, 상세히 구현된 객체가 아닌 usecase나 protocol로 추상화 된 객체에 의존하여, 의존성 역전 법칙과 인터페이스 분리 원칙, 개방 - 폐쇄 원칙을 지킬 수 있음


## 다중 소셜 로그인
로그인 객체와 과정을 추상화 해 중복된 코드를 제거 했습니다. 구글 로그인, 카카오 로그인 모두 로그인/ 로그아웃 / 자동 로그인이 있다는 점을 들어 protocol로 추상화 한 후, 로그인을 하나의 UseCase로 만들어 상세히 구현된 하위레벨 객체가 아닌, 추상화 된 protocol에 의존하도록 했습니다.

<img width="465" alt="image" src="https://user-images.githubusercontent.com/58679737/229791312-a9dca4a6-bfae-42b3-b233-9002e973f473.png">
