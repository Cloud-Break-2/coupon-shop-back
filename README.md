# 실행방법 
1. Mysql, Redis 먼저 실행 
```
docker-compose up -d 
```

2. 자바 소스코드 빌드 및 실행 
```
./gradlew clean build
cd ./build/libs
java -jar -Dspring.profiles.active=local kakao-1.0.jar
```

3. 확인 
```
curl localhost:8080
```
- 프론트에서 상품이미지 보여지면 연결완료 
