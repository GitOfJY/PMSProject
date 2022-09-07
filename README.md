#  PMSProject

## 프로젝트 내용
```
Spring Framework를 이용한 PMS System입니다. 
PMS 서비스는 바쁜 프로젝트 일정과 범위를 효율적으로 프로젝트 관리를 할 수 있는 협업 도구입니다. 
재택 근무의 증가로 비대면 업무 시스템이 중요해짐에따라 주제를 선정하였고 특히 개발 부서에 특화되도록 기능을 구현했습니다.
```

## 개발 기간
```
2022.07.26 ~ 2022.09.07
```

## 개발환경  
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

## ERD
![ERD](https://user-images.githubusercontent.com/97590398/184394968-7831821d-dd34-421f-93a8-266f6b821fa7.png)

##  PMSProject 구성원 : 마지연, 차수연
```
- 마지연 
  - 로그인 기능
  - 대시보드 출력 기능
  - 내작업 관리 기능
  - 프로젝트 관리 기능
  - 관리자 관리 
- 차수연 
  - 프로젝트 정보 출력 기능
  - 프로젝트 관리 기능
  - 이슈관리 기능
```

## TroublShooting
```
- 마지연 : 
로그인 기능은 session을 이용했지만 당시 출력의 용이성만을 고려해 너무 많은 값을 저장했습니다. 프로젝트를 진행하면서 session의 사용 빈도가 높아짐에 따라 공부해 보니 쿠키에 허용되는 용량이 작으며 클라이언트가 많아질 때 문제가 발생하기 때문에 최소한의 정보를 저장해야 한다는 것을 알게 되었습니다. 또 Controller에서 model에 객체를 담아 페이지에서 출력하도록 구현했는데 Bootstrap에서 지원하는 table에 관련된 기능들은 Ajax 방식을 활용했을 때 더 구현하기 쉬웠겠다는 것을 느꼈습니다. 비록 모든 페이지 부분에서 완벽하게 끝내지 못했지만 시간 내에 구현해야 하는 필수 기능들을 완성했으며 놓치고 있던 부분들에 대해 다시 공부하는 계기였습니다.
- 차수연 : 
첫번째 웹 프로젝트는 JSP&Servlet을 이용하였지만 이번 두번째 웹 프로젝트는 Spring Framework, Mybatis, Tiles을 사용하여 이전 프로젝트보다 코드가 훨씬 간편해지고 코드관리가 수월하다라는 것을 느꼈습니다.
```
