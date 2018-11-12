package com.example.demo.util;

import com.example.demo.entity.Usersurface;
import com.example.demo.service.jyf.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class ShiroRealm extends AuthorizingRealm {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        /*logger.info("doGetAuthorizationInfo+" + principalCollection.toString());
        Usersurface user = userService.findByUser((String) principalCollection.getPrimaryPrincipal());
        //把principals放session中 key=userId value=principals
        SecurityUtils.getSubject().getSession().setAttribute(String.valueOf(user.getUserid()), SecurityUtils.getSubject().getPrincipals());*/
        /*SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        return info;*/
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String userName =(String) token.getPrincipal();
        Usersurface user=userService.findByUser(userName);
        if (user != null) {
            //设置用户session
            Session session = SecurityUtils.getSubject().getSession();
            session.setAttribute("id", user.getUserid());
            session.setAttribute("name", user.getUsername());
            AuthenticationInfo info=new SimpleAuthenticationInfo(user,user.getUserpassword(),getName());
            return info;
        } else {
            throw new UnknownAccountException();//没找到帐号
        }
    }
}
