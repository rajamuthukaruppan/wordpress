package com.test;

import java.security.acl.Group;
import java.util.Map;

import javax.security.auth.Subject;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.login.LoginException;

import org.jboss.security.SimpleGroup;
import org.jboss.security.SimplePrincipal;
import org.jboss.security.auth.spi.UsernamePasswordLoginModule;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The simples username and password based login module possible,
 * extending JBoss' {@link UsernamePasswordLoginModule}.
 */
public class MySimpleUsernamePasswordLoginModule extends UsernamePasswordLoginModule {
	private static final Logger logger = LoggerFactory.getLogger(MySimpleUsernamePasswordLoginModule.class);

    @SuppressWarnings("rawtypes")
    public void initialize(Subject subject, CallbackHandler callbackHandler,
            Map sharedState,
            Map options) {
        super.initialize(subject, callbackHandler, sharedState, options);
    }

    /**
     * (required) The UsernamePasswordLoginModule modules compares the result of this
     * method with the actual password.
     */
    @Override
    protected String getUsersPassword() throws LoginException {
        System.out.format("MyLoginModule: authenticating user '%s'\n", getUsername());
        // Lets pretend we got the password from somewhere and that it's, by a chance, same as the username
        String password = super.getUsername();
        // Let's also pretend that we haven't got it in plain text but encrypted
        // (the encryption being very simple, namely capitalization)
        password = password.toUpperCase();
        return password;
    }

    /**
     * (optional) Override if you want to change how the password are compared or
     * if you need to perform some conversion on them.
     */
    @Override
    protected boolean validatePassword(String inputPassword, String expectedPassword) {
        // Let's encrypt the password typed by the user in the same way as the stored password
        // so that they can be compared for equality.
        String encryptedInputPassword = (inputPassword == null)? null : inputPassword.toUpperCase();
        System.out.format("Validating that (encrypted) input psw '%s' equals to (encrypted) '%s'\n"
                , encryptedInputPassword, expectedPassword);
        return super.validatePassword(encryptedInputPassword, expectedPassword);
    }

    /**
     * (required) The groups of the user, there must be at least one group called
     * "Roles" (though it likely can be empty) containing the roles the user has.
     */
    @Override
    protected Group[] getRoleSets() throws LoginException {
    	String user = getIdentity().getName();
    	logger.info("getting roles for user: " + user);
        SimpleGroup group = new SimpleGroup("Roles");
        try {
            group.addMember(new SimplePrincipal("user_role"));
            if("admin".equalsIgnoreCase(user)) 
            	group.addMember(new SimplePrincipal("admin_role"));
        } catch (Exception e) {
            throw new LoginException("Failed to create group member for " + group);
        }
        return new Group[] { group };
    }

}
