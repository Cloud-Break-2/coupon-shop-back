# 멀티 아키텍처 이미지 빌드를 위한 Dockerfile 작성
# Stage 1 - 빌드 스테이지
# 빌드 시 사용하는 베이스 이미지 이미지 및 플랫폼 설정
FROM --platform=$BUILDPLATFORM eclipse-temurin:17-jdk AS builder

# 작업 디렉토리 설정
WORKDIR /app

# 빌드된 JAR 파일을 스테이지로 복사
COPY ./build/libs/kakao-1.0.jar /app/kakao-1.0.jar

# Stage 2 - 런타임 스테이지
# 최종 이미지를 위한 베이스 이미지 및 플랫폼 설정
FROM eclipse-temurin:17-jre

# 빌드된 JAR 파일을 런타임 스테이지로 복사
COPY --from=builder /app/kakao-1.0.jar /app/kakao-1.0.jar

# JAR 파일 실행
# 실행시점에 "java -jar -Dspring.profiles.active=local { jar 파일명 } &" 명령어를 실행
ENTRYPOINT ["java", "-jar", "/app/kakao-1.0.jar"]
#ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=local", "/app/kakao-1.0.jar"]


# 컨테이너가 실행될 때 기본적으로 사용할 포트 설정
EXPOSE 8082