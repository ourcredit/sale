package com.monkey.web.shiro;
import com.monkey.application.Menus.IMenuService;
import com.monkey.application.Roles.IUserRoleService;
import com.monkey.application.Users.IUserService;
import com.monkey.common.util.ComUtil;
import com.monkey.common.util.JWTUtil;
import com.monkey.core.entity.Menu;
import com.monkey.core.entity.User;
import com.monkey.core.entity.Userrole;
import com.monkey.web.config.SpringContextBean;
import com.monkey.web.exception.UnauthorizedException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author liugh
 * @since 2018-05-03
 */
public class MyRealm extends AuthorizingRealm {
    private Logger logger = LoggerFactory.getLogger(MyRealm.class);
    private IUserService userService;
    private IUserRoleService userRoleService;
    private IMenuService menuService;
    /**
     * 大坑！，必须重写此方法，不然Shiro会报错
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JWTToken;
    }

    /**
     * 只有当需要检测用户权限的时候才会调用此方法，例如checkRole,checkPermission之类的
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        if (userRoleService == null) {
            this.userRoleService = SpringContextBean.getBean(IUserRoleService.class);
        }
        if (menuService == null) {
            this.menuService = SpringContextBean.getBean(IMenuService.class);
        }

        String username = JWTUtil.getUsername(principals.toString());
        User user = userService.getUserByUserName(username);
        List<Userrole> userToRole = userRoleService.selectByUserId(user.getId());

        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        ArrayList<String> peers = new ArrayList<>();
        List<Integer> roles=new ArrayList<>();
        for (Userrole r :userToRole){
            roles.add(r.getRoleId());
        }
        List<Menu> menuList = menuService.findMenuByRoleId(roles);
        for (Menu per : menuList) {
            if (!ComUtil.isEmpty(per.getCode())) {
                if (!ComUtil.isEmpty(per.getCode().replace(" ", ""))) {
                    peers.add(per.getCode());
                }
            }
        }
        Set<String> permission = new HashSet<>(peers);
        simpleAuthorizationInfo.addStringPermissions(permission);
        return simpleAuthorizationInfo;
    }

    /**>
     * 默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws UnauthorizedException {
        if (userService == null) {
            this.userService = SpringContextBean.getBean(IUserService.class);
        }
        String token = (String) auth.getCredentials();

        // 解密获得username，用于和数据库进行对比
        String username = JWTUtil.getUsername(token);
        if (username == null) {
            throw new UnauthorizedException("token invalid");
        }

        User userBean = userService.getUserByUserName(username);
        if (userBean == null) {
            throw new UnauthorizedException("User didn't existed!");
        }
        if (! JWTUtil.verify(token, username, userBean.getPassword())) {
            throw new UnauthorizedException("Username or password error");
        }
        return new SimpleAuthenticationInfo(token, token, this.getName());
    }
}
