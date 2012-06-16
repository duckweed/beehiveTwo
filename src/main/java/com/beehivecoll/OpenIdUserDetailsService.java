package com.beehivecoll;

import com.beehivecoll.domain.Person;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public class OpenIdUserDetailsService implements UserDetailsService {

    public UserDetails loadUserByUsername(String openIdIdentifier) {
        List<Person> personList = Person.findPeopleByOpenIdIdentifier(openIdIdentifier).getResultList();

        Person person = personList.size() == 0 ? null : personList.get(0);

        if (person == null) {
            person = new Person();
            person.setOpenIdIdentifier(openIdIdentifier);
            person.setUsername(RandomStringUtils.random(7));
            person.persist();
            return person;
        }

        if (!person.isEnabled()) {
            throw new DisabledException("User is disabled");
        }

        return person;
    }
}
