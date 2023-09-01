package com.mattmottle.authentication.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.mattmottle.authentication.models.LoginUser;
import com.mattmottle.authentication.models.User;
import com.mattmottle.authentication.repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;
    
    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
        // TO-DO: Additional validations!
    	Optional<User> registerUser = userRepo.findByEmail(newUser.getEmail());
        
    	if(registerUser.isPresent()) {
    		result.rejectValue("email", "Matches", "Email already exists!");
    	}
    	if(!newUser.getPassword().equals(newUser.getConfirmedPassword())) {
    		result.rejectValue("confirm","Matches", "The Confirm Password must match Password!");
    	}
    	if(result.hasErrors()) {
    		return null;
    	} else {
    		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    		newUser.setPassword(hashed);
    		return userRepo.save(newUser);
    	}
    }
    public User login(LoginUser newLoginObject, BindingResult result) {
        // TO-DO: Additional validations!
    	Optional<User> loginUser = userRepo.findByEmail(newLoginObject.getEmail());
    	
    	if(!loginUser.isPresent()) {
    		result.rejectValue("email", "Matches", "Invalid login!");
    		return null;
    	} else {
    		User user = loginUser.get();
    		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    			result.rejectValue("password", "Matches", "Invalid login!");
    		}
    		if(result.hasErrors()) {
    			return null;
    		} else {
    			return user;
    		}
    	} 
    }
    public User findById(Long id) {
    	Optional <User> thisUser = userRepo.findById(id);
    	if(thisUser.isPresent()) {
    		return thisUser.get();
    	} else {
    		return null;
    	}
    }
}
