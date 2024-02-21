package org.website.blog.infra.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CorsConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowCredentials(true)
                .allowedMethods("GET", "POST", "DELETE", "PUT")
                .maxAge(3600);
    }
//    @Autowired
//    private Environment env;

//    @Override
//    public void addCorsMappings(CorsRegistry registry) {
//        // 从application.yml中读取CORS配置
//        String[] allowedOrigins = env.getProperty("cors.allowed-origins").split(",");
//        String[] allowedMethods = env.getProperty("cors.allowed-methods").split(",");
//        String[] allowedHeaders = env.getProperty("cors.allowed-headers").split(",");
//        boolean allowCredentials = env.getProperty("cors.allow-credentials", Boolean.class);
//        long maxAge = env.getProperty("cors.max-age", Long.class);
//
//        // 设置CORS配置
//        registry.addMapping("/**")
//                .allowedOrigins(allowedOrigins)
//                .allowedMethods(allowedMethods)
//                .allowedHeaders(allowedHeaders)
//                .allowCredentials(allowCredentials)
//                .maxAge(maxAge);
//    }
}