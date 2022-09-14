#  PMSProject


### 프로젝트 내용
```
Spring Framework를 이용한 PMS System입니다. 
PMS 서비스는 바쁜 프로젝트 일정과 범위를 효율적으로 화면에 출력해 프로젝트 관리를 할 수 있는 협업 도구입니다. 
재택근무의 증가로 비대면 업무 시스템이 중요해짐에 따라 주제를 선정하였습니다.
```


### 개발 기간
```
2022.07.26 ~ 2022.09.07
```


### 개발환경  
```
Server : Apache Tomcat 
Database : Oracle
Development Tool :  Spring Tool Suite, sqlDeveloper, Visual Studio code
Framework : MyBatis, Spring
Build Tool : Maven
Development Language :  JAVA , HTML5, CSS3, JavaScript, jQuery, SQL, JSP, Ajax
Configuration Management : Github, Sourcetree 
Design tool : Bootstrap
```


### ERD
![ERD](https://user-images.githubusercontent.com/97590398/184394968-7831821d-dd34-421f-93a8-266f6b821fa7.png)


###  PMSProject 구성원 : 마지연, 차수연
```
- 마지연 
  - 로그인 기능
  - 대시보드 출력 기능
  - 내작업 관리 기능
  - 프로젝트 관리 기능
  - 관리자 관리 기능 
  
- 차수연 
  - 프로젝트 정보 출력 기능
  - 프로젝트 관리 기능
  - 이슈관리 기능
```


###  PMSProject 화면
#### 로그인 기능
<img width="80%" src="https://user-images.githubusercontent.com/104612045/189580600-188e073a-2ecd-4ae5-b0aa-2e631e15a818.gif"/>  

```
로그인 시 관리자, PL, 사원을 구분하여 왼쪽 메뉴를 다르게 출력합니다.
```

#### 대시보드 출력 기능
<img width="80%" src="https://user-images.githubusercontent.com/104612045/189579418-95eae8fe-e151-4d0e-acc1-9416edb2638c.gif"/>  

```
종합현황, 팀별현황, 개인별현황으로 프로젝트 진행 상태를 출력합니다.
각 출력 블럭에서는 링크를 통해 상세 페이지로 연결됩니다.
```

#### 관리자 기능
<img width="80%" src="https://user-images.githubusercontent.com/104612045/189577628-b32e17fc-4d96-4f1b-b54f-6bb6b1a4b1f8.gif"/>  

```
관리자로 로그인 시, 사용자 관리 메뉴에서는 사원들의 정보를 수정, 삭제, 등록할 수 있습니다.
프로젝트 관리 메뉴에서는 팀과 프로젝트를 등록하고 수정할 수 있습니다.
```

####  PL 기능
<img width="80%" src="https://user-images.githubusercontent.com/104612045/189595344-290455a4-1cd5-4e02-976a-6687ec28e21a.gif"/>  

```
PL로 로그인 시, 본인에게 할당된 프로젝트를 수정하고 팀원을 추가할 수 있습니다.
그 프로젝트의 스테이지를 수정, 삭제, 등록할 수 있는데 진행중인 작업이 있다면 삭제는 불가능합니다.
마찬가지로 해당 스테이지의 작업도 수정, 삭제, 등록할 수 있습니다.
```

#### 내작업 기능
<img width="80%" src="https://user-images.githubusercontent.com/104612045/189607773-84e25bb9-fc81-4edd-ab4c-f1d0386eca49.gif"/>  

```
본인에게 해당되는 프로젝트의 작업만 수정, 삭제, 등록할 수 있습니다.
```


### TroublShooting
```
- 마지연 : 
1. 페이지마다 로그인 계정의 정보로 화면을 출력해야 했습니다. 
DB의 테이블을 세세하게 나눠서 로그인 아이디만 가져왔을 때 controller에서 팀 이름이나 직급등 관련 정보를 가져오기 번거롭다 생각하여 처음 로그인 session에 대부분의 정보를 저장했습니다. 
하지만 쿠키에 허용되는 용량이 작으며 클라이언트가 많아질 때 문제가 되기 때문에 최소한의 정보를 저장해야 한다는 것을 알게 되었습니다.

2. 데이터를 넘기고 나서도 등록, 수정과 삭제 각각 페이지를 만들고 똑같은 데이터를 받아 사용하는 것은 똑같은 코드가 반복된다 생각하였습니다. 그
래서 한 페이지에 모달창 여러 개 구현하고 데이터를 이용하는 방식을 사용했습니다. 
또, 해당 페이지에서 데이터를 표에 출력한 후 한 개의 내용을 수정하려고 할 때, 선택된 행의 내용만을 다음 페이지로 넘기기 어려웠습니다. 
자바스크립트로 수정 버튼을 누르면 표에서 몇 번째 행을 눌렀는지 확인 후 해당 sequence 번호를 append로 input 태그를 추가해 controller에게 정보를 넘겼습니다. 
이때, 새로고침을 하지 않으면 input 태그가 계속 쌓이는 문제가 발생했습니다. 이것을 해결하기 위해 모달창은 취소 버튼으로만 닫게 수정하고 취소 버튼을 누르면 추가한 input 태그의 class를 이용해 삭제하도록 구현했습니다. 
삭제도 마찬가지로 표의 몇 행을 눌렀는지 확인 후 표에 hidden으로 숨겨둔 sequence 번호를 얻어왔습니다. 그리고 append를 이용해  sequence 번호의 삭제 page로 이동 버튼을 만들고 click 이벤트로 넘어가 삭제하도록 구현했습니다.

- 차수연 : 
첫번째 웹 프로젝트는 JSP&Servlet을 이용하였지만 이번 두번째 웹 프로젝트는 Spring Framework, Mybatis, Tiles을 사용하여 이전 프로젝트보다 코드가 훨씬 간편해지고 코드관리가 수월하다라는 것을 느꼈습니다.
```
