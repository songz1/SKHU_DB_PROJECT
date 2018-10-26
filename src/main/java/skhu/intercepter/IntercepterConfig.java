package skhu.intercepter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class IntercepterConfig implements WebMvcConfigurer {

	@Autowired
    private Intercepter interceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(interceptor)
        .addPathPatterns("/**")
        .excludePathPatterns("/admin/login/login")
        .excludePathPatterns("/user/login/**")
        .excludePathPatterns("/user/forgot/**")
        .excludePathPatterns("/user/regist/**");
    }

}