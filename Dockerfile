# Bước 1: Build ứng dụng bằng Maven
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app

# Copy pom.xml và tải dependency trước (cache)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy toàn bộ project và build
COPY . .
RUN mvn clean package -DskipTests

# Bước 2: Chạy bằng Tomcat
FROM tomcat:9.0.80-jdk11

# Xóa webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR đã build sang Tomcat ROOT
COPY --from=build /app/target/EmailListApp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
