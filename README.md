# Inception

## 과제 소개
- 42서울 5서클 과제입니다.
- 도커를 사용해서 wordpress를 구동시켜야 합니다.

## 프로젝트 구조
- `srcs/`: 도커 관련 설정 파일들
  - `docker-compose.yaml`: 컨테이너 구성 정의
  - `requirements/`: 각 서비스별 Dockerfile과 설정 파일
    - `mariadb/`: MariaDB 데이터베이스 서버
    - `wordpress/`: WordPress + php-fpm
    - `nginx/`: nginx 웹 서버

## Docker 구성 상세
### 1. MariaDB Container
- Alpine Linux 기반
- WordPress용 데이터베이스 호스팅
- 볼륨 마운트: `/var/lib/mysql`에 데이터 영구 저장
- 네트워크: intra 브릿지 네트워크 사용

### 2. WordPress Container
- Alpine Linux 기반
- php-fpm으로 구동
- MariaDB 컨테이너와 연동
- 볼륨 마운트: `/var/www/html`에 WordPress 파일 저장
- 네트워크: intra 브릿지 네트워크 사용

### 3. Nginx Container
- Alpine Linux 기반
- SSL/TLS 설정 (포트 443)
- WordPress와 연동
- 볼륨 마운트: WordPress 파일 접근
- 네트워크: intra 브릿지 네트워크 사용

## 볼륨 구성
- mariadbDB: 데이터베이스 영구 저장
- wordpressDB: WordPress 파일 영구 저장

## 네트워크 구성
- intra: 브릿지 네트워크
  - 컨테이너 간 내부 통신
  - 외부에서는 NGINX를 통해서만 접근 가능

## 실행 방법
1. `make` 명령어로 도커 컨테이너 빌드 및 실행
2. https://localhost 접속으로 WordPress 사이트 확인

## 주요 기능
- TLS v1.2/v1.3을 통한 보안 연결
- 컨테이너 자동 재시작 설정
- 데이터 영구 보존을 위한 볼륨 구성
- 컨테이너 간 격리된 네트워크 구성
