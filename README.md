<div align="center">
  
  ![cafap_logo](https://github.com/hjm8333/cafmap/assets/35636560/3f625030-6574-485a-aa7c-3fbe15d37f8f)

</div>

## Draw your cafe map, Cafap

## 🚀 프로젝트 개요
- *주 포지션*

|   Name   | 황정민 |
| :------: | --- |
| position | 지도 API, 내 지도, 유저관리 |

- 프로젝트 기간 : 2023.07.18 ~ 2023.08.04

#### 프레젠테이션
https://www.canva.com/design/DAFqftFdggk/I8ObStampda6dWG408F4qw/view?utm_content=DAFqftFdggk&utm_campaign=designshare&utm_medium=link&utm_source=publishsharelink

<br> 

## 🎮 기술 스택

|   ✨ Front-End   | 💻 Back-End | 🛠 외부 API 및<br> Collaborative Software
| --- | --- | --- |
| <img src="https://img.shields.io/badge/html5-1572B6?style=flat&logo=html5&logoColor=white"/> : 5.0<br><img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white"/> : 3.0<br><img src="https://img.shields.io/badge/javascript-F7DF1E?style=flat&logo=javascript&logoColor=white"/> : 1.16.1<br><img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery&logoColor=white"/> : 3.5.1<br><img src="https://img.shields.io/badge/FontAwesome-528DD7?style=flat&logo=Font Awesome&logoColor=white"/> : 6.4.2<br><img src="https://img.shields.io/badge/Sweetalert2-8e64a6?style=flat&logo=&logoColor=white"/> : 2.11 | <img src="https://img.shields.io/badge/OpenJDK-437291?style=flat&logo=OpenJDK&logoColor=white"/> : 1.8 Amazon Correto<br><img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=flat&logo=Spring Boot&logoColor=white"/> : 2.7.17<br><img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=flat&logo=apachetomcat&logoColor=black"/> : 9.0<br><img src="https://img.shields.io/badge/lombok-d00223?style=flat&logo=&logoColor=black"/> : 1.18.30<br><img src="https://img.shields.io/badge/Mybatis-0a0a0a?style=flat&logo=&logoColor=white"/> : 3.0<br><img src="https://img.shields.io/badge/JSP-007396?style=flat&logo=JSP&logoColor=white"/> : 2.3<br><img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/> : 8.0.21<br><img src="https://img.shields.io/badge/Gradle-02303A?style=flat&logo=Gradle&logoColor=white"/> : 8.3 | <img src="https://img.shields.io/badge/Kakao-FFCD00?style=flat&logo=kakao&logoColor=white"/> : Maps V2.0<br><img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"/> : 3.10.3<br><img src="https://img.shields.io/badge/GitHub_Desktop-802790?style=flat&logo=GitHub&logoColor=white"/> : 3.3.5<br><img src="https://img.shields.io/badge/IntelliJ_IDEA-000000?style=flat&logo=IntelliJ IDEA&logoColor=white"/> : Ultimate 2023.2.4<br><img src="https://img.shields.io/badge/MySQL_Workbench-4479A1?style=flat&logo=MySQL&logoColor=white"/> : 8.0 CE |

<br>

## ⚙ 의존성
```java
	implementation 'org.springframework.boot:spring-boot-starter-web'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.1'
	implementation 'org.springframework.boot:spring-boot-starter-jdbc'
	implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
	implementation 'javax.servlet:jstl:1.2'
	implementation 'commons-io:commons-io:2.12.0'
	implementation 'commons-fileupload:commons-fileupload:1.4'

	runtimeOnly 'com.mysql:mysql-connector-j'
	compileOnly 'org.projectlombok:lombok'
	annotationProcessor 'org.projectlombok:lombok'

	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:2.3.1'
```

<br>
<br>

## 1️⃣ 프로젝트 구조 

|   Class   | Webapp |
| --- | --- |
| ![image](https://github.com/hjm8333/cafmap/assets/35636560/6e26554b-5dc4-4731-9758-f25ababa9fdb) | ![image](https://github.com/hjm8333/cafmap/assets/35636560/0db79fcd-cb8b-4887-9efe-8b26ff182c41) | 

  
<br>

## 2️⃣ 프로젝트 개요

* 카페 지도 탐색, 조회 / 나만의 지도 등록

<br>

## 3️⃣ 기능 구분

#### 사용자
* 회원가입, 로그인, 회원정보 수정
* 카페지도 조회, 평점 리뷰 작성
* 나만의 지도 태그별 등록

<br>

## 4️⃣ ERD
![image](https://github.com/hjm8333/cafmap/assets/35636560/6fb5addf-ea49-4e63-b6fb-1302db19445f)

<br>
<br>


## 5️⃣ SiteMap

<br>

![image](https://github.com/hjm8333/cafmap/assets/35636560/63fb1300-8c0b-4b61-986f-f42a6ffc4f1e)



