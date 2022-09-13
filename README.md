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
로그인 기능은 session을 이용했지만 당시 출력의 용이성만을 고려해 너무 많은 값을 저장했습니다. 
프로젝트를 진행하면서 session의 사용 빈도가 높아짐에 따라 공부해 보니 쿠키에 허용되는 용량이 작으며 클라이언트가 많아질 때 문제가 발생하기 때문에 최소한의 정보를 저장해야 한다는 것을 알게 되었습니다. 
또 Controller에서 model에 객체를 담아 페이지에서 출력하도록 구현했는데 Bootstrap에서 지원하는 table에 관련된 기능들은 Ajax 방식을 활용했을 때 더 구현하기 쉬웠겠다는 아쉬움이 있었습니다.
비록 모든 페이지 부분에서 완벽하게 끝내지 못했지만 시간 내에 구현해야 하는 필수 기능들을 완성했으며 놓치고 있던 부분들에 대해 다시 공부하는 계기였습니다.
- 차수연 : 
첫번째 웹 프로젝트는 JSP&Servlet을 이용하였지만 이번 두번째 웹 프로젝트는 Spring Framework, Mybatis, Tiles을 사용하여 이전 프로젝트보다 코드가 훨씬 간편해지고 코드관리가 수월하다라는 것을 느꼈습니다.
```
