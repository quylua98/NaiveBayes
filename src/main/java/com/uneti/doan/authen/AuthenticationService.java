package com.uneti.doan.authen;

import com.uneti.doan.dto.UserDto;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AuthenticationService implements UserDetailsService{

    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
    	UserDto user = new UserDto();
        user.setPassword("admin");
        if (!email.equals("admin@admin.com")) {
            throw new UsernameNotFoundException("Account " //
                    + email + " was not found");
        }

        return new User(email,
        		user.getPassword(), true, true,
                true, true, new ArrayList<>());
    }
}

