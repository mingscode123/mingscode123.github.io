---
layout: single
title: "스프링부트 개념 정리 (요약) "
categories: concept summary
tag: 개념 정리
toc: true
sidebar:
  nav: "counts"
---

# [스프링부트 개념 정리] 요약

## 주요 특징

1. 자동 설정(Auto-Configuration)

스프링부트는 자동 설정(Auto-Configuration) 기능을 통해 개발자가 특정 설정을 명시적으로 정의하지 않아도, 필요한 환경을 자동으로 구성합니다. 예를 들어, 데이터베이스 설정, 웹 서버 설정 등을 수동으로 할 필요 없이, 애플리케이션의 종속성에 따라 스프링부트가 자동으로 적절한 설정을 적용합니다.

```java
// 스프링부트 애플리케이션에서의 기본 설정
@SpringBootApplication
public class MySpringBootApplication {
    public static void main(String[] args) {
        SpringApplication.run(MySpringBootApplication.class, args);
    }
}
```

위 코드에서 `@SpringBootApplication`은 여러 애너테이션을 결합한 형태로, 자동 설정을 활성화합니다.

2. 내장 웹 서버(Embedded Web Server)

스프링부트는 내장 웹 서버를 포함하고 있어, 톰캣(Tomcat), 제티(Jetty), 언더토우(Undertow) 등의 서버를 애플리케이션 내에 포함하여 배포할 수 있습니다. 이는 전통적인 웹 애플리케이션과 달리 WAR 파일을 생성하여 외부 서버에 배포하지 않고, 독립 실행 가능한 JAR 파일로 패키징하여 서버와 애플리케이션을 함께 배포할 수 있게 합니다.

```bash
# 빌드 후 실행 가능한 JAR 파일 생성
$ mvn clean package

# JAR 파일 실행
$ java -jar target/myapp-0.0.1-SNAPSHOT.jar
```

3. 의존성 관리와 스타터(Starters)

스프링부트는 다양한 의존성을 쉽게 관리할 수 있도록, **스타터(Starters)**라는 의존성 모음을 제공합니다. 각 스타터는 특정 기능을 쉽게 사용할 수 있도록 관련 라이브러리와 설정을 포함하고 있습니다. 예를 들어, 웹 애플리케이션을 만들고자 한다면 `spring-boot-starter-web` 의존성만 추가하면 관련 설정을 자동으로 처리해줍니다.

```xml
<!-- Maven에서의 스타터 의존성 추가 -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-web</artifactId>
</dependency>
```

스프링부트 스타터를 사용하면 의존성을 일일이 추가하거나 설정 파일을 작성할 필요 없이, 필요한 기능에 따라 적절한 구성과 라이브러리를 자동으로 포함시킬 수 있습니다.

4. 스프링 부트 CLI (Spring Boot CLI)

스프링 부트는 커맨드라인 인터페이스(CLI)를 통해, 간단한 스크립트로 애플리케이션을 실행할 수 있는 기능을 제공합니다. 스프링 부트 CLI를 사용하면 간단한 코드로 스프링 애플리케이션을 빠르게 실행하고 테스트할 수 있습니다.

```bash
$ spring init --dependencies=web myapp
$ cd myapp
$ ./mvnw spring-boot:run
```

5. 애플리케이션 구성 파일

스프링부트는 환경 설정을 위해 `application.properties` 또는 `application.yml` 파일을 사용합니다. 이 파일을 통해 데이터베이스 연결 정보, 서버 포트, 로깅 설정 등 다양한 설정을 쉽게 관리할 수 있습니다.

**application.properties** 예시:

```properties
server.port=8081
spring.datasource.url=jdbc:mysql://localhost:3306/mydb
spring.datasource.username=root
spring.datasource.password=secret
```

**application.yml** 예시:

```yaml
server:
  port: 8081
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: root
    password: secret
```

6. Spring Data JPA 통합

스프링부트는 데이터베이스 통합을 쉽게 하기 위해 Spring Data JPA와 같은 ORM(Object-Relational Mapping) 프레임워크를 통합하여 사용할 수 있습니다. 이를 통해 간단한 메서드 정의만으로 데이터베이스에 접근할 수 있는 기능을 제공합니다.

```java
// JPA 엔터티(Entity) 클래스 정의
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String email;
    // getters and setters
}

// JpaRepository를 확장하여 리포지토리 생성
public interface UserRepository extends JpaRepository<User, Long> {
    List<User> findByName(String name);
}
```

위 코드에서 `UserRepository`는 자동으로 구현되어 데이터베이스 CRUD 작업을 처리합니다. `JpaRepository` 인터페이스는 기본적인 CRUD 메서드를 제공합니다.

7. REST API 개발

스프링부트는 REST API 개발을 간편하게 지원합니다. 컨트롤러에서 HTTP 요청을 처리하고, JSON 형식의 응답을 반환할 수 있습니다.

```java
@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public List<User> getUsers() {
        return userRepository.findAll();
    }

    @PostMapping
    public User createUser(@RequestBody User user) {
        return userRepository.save(user);
    }
}
```

- `@RestController`: 컨트롤러가 RESTful 웹 서비스의 엔드포인트임을 나타냅니다.
- `@RequestMapping`: HTTP 요청을 특정 경로와 메서드에 매핑합니다.
- `@GetMapping`, `@PostMapping`: HTTP GET, POST 요청을 처리합니다.

8. Actuator: 모니터링과 관리

스프링부트는 애플리케이션의 상태 및 메트릭을 모니터링할 수 있는 Actuator를 제공합니다. Actuator는 애플리케이션의 상태, 사용 메모리, 스레드 상태 등을 모니터링할 수 있는 다양한 엔드포인트를 제공합니다.

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-actuator</artifactId>
</dependency>
```

Actuator를 추가하고 설정하면 `/actuator/health`, `/actuator/metrics` 등의 엔드포인트를 통해 애플리케이션의 상태를 확인할 수 있습니다.

9. 보안(Spring Security)

스프링부트는 Spring Security와 쉽게 통합할 수 있어, 애플리케이션에 보안 기능(인증 및 권한 부여)을 추가할 수 있습니다. 몇 가지 간단한 설정만으로 기본적인 로그인, 로그아웃 기능을 구현할 수 있으며, 더욱 복잡한 보안 정책도 쉽게 정의할 수 있습니다.

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
```

## 스프링부트의 장점

- **빠른 개발 속도**: 자동 설정과 내장 서버 등을 제공하여, 빠르게 애플리케이션을 개발하고 배포할 수 있습니다.
- **간편한 설정**: 수많은 XML 설정 파일을 작성할 필요 없이, 간단한 애너테이션과 프로퍼티 파일로 설정을 관리할 수 있습니다.
- **확장성**: 스프링부트는 작은 서비스에서 대규모 엔터프라이즈 애플리케이션까지 확장할 수 있는 유연성을 제공합니다.
- **강력한 생태계**: 스프링부트는 스프링 생태계와 쉽게 통합되며, 다양한 스프링 프로젝트(Spring Data, Spring Security 등)를 바로 사용할 수 있습니다.
