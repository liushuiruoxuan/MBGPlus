package com.generator.chai.common;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableSwagger2WebMvc
// @ConditionalOnExpression(value = "'develop'.equals('${spring.cloud.nacos.config.namespace}') or 'testing'.equals('${spring.cloud.nacos.config.namespace}')")
public class SwaggerConfig {
//    @Bean(value = "swaggerBean")
//    public Docket swaggerBean() {
//        //指定使用Swagger2规范
//        List<Parameter> pars = new ArrayList<>();
//        //暂无需token校验
//        //pars.add(new ParameterBuilder().name("token").description("认证token").modelRef(new ModelRef("string")).parameterType("header").build());
//        return new Docket(DocumentationType.SWAGGER_2)
//                .apiInfo(new ApiInfoBuilder()
//                        .title("swagger测试查询")
//                        //描述字段支持Markdown语法
//                        .description("swagger测试查询系统")
//                        .contact(new Contact("tangzhi", "", "845195485@qq.com"))
//                        .version("1.0")
//                        .build())
//                //分组名称
//                .groupName("ssm-test-inquire")
//                .select()
//                //这里指定Controller扫描包路径
//                .apis(RequestHandlerSelectors.basePackage("com.xiaozhi.swagger"))
//                .paths(PathSelectors.any())
//                .build().globalOperationParameters(pars);
//    }
}
