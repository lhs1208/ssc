**SSCCAR: Car Sharing Reservation System**

**🚗 프로젝트 소개**
SSCCAR는 사용자 친화적인 실시간 예약 시스템을 제공하는 카셰어링 플랫폼입니다. 

주요 목표는 사용자가 페이지 이동 없이 직관적이고 편리한 서비스를 이용할 수 있도록 하는 것입니다. 

쏘카(SOCAR) 및 그린카(GREEN CAR)와 같은 기존 서비스의 장점을 참고하여 자체적인 시스템으로 재구성하였습니다.

**📌 주요 기능**

사용자 서비스
1. 메인 페이지
- 공지사항 및 이용 후기 게시판 제공
- 사이드바를 통한 실시간 예약, 날씨 정보, 추천지 보기

2. 회원 관리
- 회원가입, 로그인, 탈퇴 기능
- 정규 표현식 기반 입력 검증

3. 예약 시스템
- 지역 및 차량 종류별 실시간 예약
- 달력 플러그인을 활용한 대여일 및 반납일 설정
- 예약 내역 확인 및 취소

4. 추천지 및 후기
- 추천지 등록 및 후기 작성 가능
  
5. 1:1 문의
- 관리자와 사용자 간의 메시지 교환

관리자 서비스
1. Zone 및 차량 관리
- 지역(zone) 및 차량 데이터 추가/수정/삭제

2. 예약 관리
- 예약 내역 확인 및 관리

**🛠 기술 스택**

공통
- 운영체제: Windows 7/8.1/10
- 웹 서버: Apache, Tomcat
- 데이터베이스: MySQL Server 5.7, Oracle Database
- 형상 관리 도구: Git

프론트엔드
- 언어: HTML5, CSS3, JavaScript
- 프레임워크: Twitter Bootstrap 3, jQuery, Ajax

백엔드
- 언어: Java, JSP
- 프레임워크: Java EE, MVC-Model2

**🗂 데이터베이스 구성**
1. User: 회원 관리 테이블
2. Document: 게시판 테이블
3. Comment: 댓글 테이블
4. File: 파일 관리 테이블
5. Book: 예약 테이블
6. Zone: 지역(zone) 테이블
7. Car: 차량 정보 테이블

**🖼 시스템 구조**
- 고전 구조: 페이지 이동 및 새로고침 방식
- Ajax 구조: 페이지 이동 없이 비동기식 데이터 처리 방식

**📅 프로젝트 일정**
- 전체 작업 기간: 12주

**✨ 특장점**
- Ajax를 활용한 실시간 데이터 처리
- 사용자 및 관리자 권한 분리
- 동적 게시판 출력 및 정교한 예약 시스템


