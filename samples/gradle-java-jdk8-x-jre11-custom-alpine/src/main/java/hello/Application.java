package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@RestController
@EnableConfigurationProperties
public class Application {

    @Value("${app.name}")
    private String name;

    @Value("${app.description}")
    private String description;

    @RequestMapping("/")
    public String home() {
        return "Hello Docker World from " + this.name + ": " + this.description;
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
