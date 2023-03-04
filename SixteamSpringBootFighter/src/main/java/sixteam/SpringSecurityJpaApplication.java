package sixteam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

import sixteam.t6_10.model.AccountManagerRepository;
import sixteam.t6_10.model.AccountRepository;
import sixteam.t6_10.securitymodel.UserRepository;
import sixteam.t6_21.model.ClassRepository;
import sixteam.t6_21.model.MemberRepository;
import sixteam.t6_21.model.OrderItemRepository;
import sixteam.t6_21.model.OrderRepository;
import sixteam.t6_14.model.Actives;
import sixteam.t6_14.model.ActivesRepository;
import sixteam.t6_14.model.EventRegistrations;
import sixteam.t6_14.model.EventRegistrationsRepository;

@EnableGlobalMethodSecurity(securedEnabled = true,prePostEnabled = true)
@SpringBootApplication
@EnableJpaRepositories(basePackageClasses = {MemberRepository.class,OrderRepository.class,OrderItemRepository.class,ClassRepository.class,UserRepository.class,AccountRepository.class,AccountManagerRepository.class,EventRegistrationsRepository.class,ActivesRepository.class})
public class SpringSecurityJpaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringSecurityJpaApplication.class, args);
	}	

}