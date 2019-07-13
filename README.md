# 复盘 
目标:
2个角色：admin/admin(所有权限)   zhangsan/zhangsan
zhangsan访问系统资源时,提示权限不足



技术选型：
- ssm
- dTree
- RBAC-0 
> RBAC,基于角色的访问控制
> RBAC96模型中,RBAC-0是最基础的


![Image text](https://github.com/nbchen/rbac-demo/blob/master/assets/img/rbac0.png)




表:用户,角色,菜单,功能


![Image text](https://github.com/nbchen/rbac-demo/blob/master/assets/img/tables.png)



[注意点1：mybatis,多表查询的映射封装]
```xml
    <resultMap id="userMapper" type="Users">
        <id property="username" column="username"/>
        <result property="userpwd" column="userpwd"/>
        <!--配置关联对象Roles-->
        <association property="roles" javaType="Roles">
            <id property="roleid" column="roleid"/>
            <result property="rolename" column="rolename"/>
        </association>
        <!--配置关联对象Menus-->
        <collection property="menus" ofType="Menus">
            <id property="menuid" column="menuid"/>
            <result property="menuname" column="menuname"/>
            <result property="menuurl" column="menuurl"/>
            <result property="fatherid" column="fatherid"/>
        </collection>
        <!--配置关联对象Funs-->
        <collection property="funs" ofType="Funs">
            <id property="funid" column="funid"/>
            <result property="funname" column="funname"/>
            <result property="funurl" column="funurl"/>
        </collection>
    </resultMap>
    
    <!--查询一个用户拥有角色对应的菜单权限-->
    <select id="selectUserByname" parameterType="String" resultMap="userMapper">
        SELECT
            *
        FROM
            users u
            LEFT JOIN roles r ON u.role_id = r.roleid
            LEFT JOIN roles_menus rm ON r.roleid = rm.roles_id
            LEFT JOIN menus m ON rm.menus_id = m.menuid
            LEFT JOIN funs f ON m.menuid = f.menu_id
        WHERE
            u.username = #{username}
    </select>
```

[注意点2：xml找不到]
```xml
        <!--其中<directory>中的路径写自己xml文件的所在位置，
    一般就写class路径；由于此处配置后就不会再扫描resources包下的xml和其他配置文件，所以此处也添加进来；-->
        <resources>
            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/*.xml</include>
                </includes>
            </resource>
            <resource>
                <directory>src/main/resources</directory>
                <includes>
                    <include>**/*.xml</include>
                    <include>**/*.properties</include>
                </includes>
            </resource>
        </resources>
```

[注意点3：mysql连接报错:补全后面的]
```properties
jdbc.driver=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql:///test-rbac?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true
jdbc.username=root
jdbc.password=root

```


[注意点4：自定义异常的使用]
```java
public class UsersException extends RuntimeException {

    public UsersException() {
    }

    public UsersException(String message) {
        super(message);
    }

    public UsersException(String message, Throwable cause) {
        super(message, cause);
    }
}

```
```markdown
  @Override
    public Users userLogin(String username, String password) {
        Users users = userMapper.selectUserByname(username);
        if (Objects.isNull(users)) {
            // 用户不存在
            throw new UsersException("用户不存在或密码有误");
        } else if (!users.getUserpwd().equals(password)) {
            // 密码有误
            throw new UsersException("用户不存在或密码有误");
        }
        return users;
    }
```

```markdown
    @RequestMapping("userLogin")
    public String userLogin(Users users, Model model, HttpSession session) {

        try {
            Users user = userService.userLogin(users.getUsername(), users.getUserpwd());

            session.setAttribute("user",user);
        } catch (UsersException e) {
            // 登录失败
            e.printStackTrace();
            model.addAttribute("msg",e.getMessage());
            return "login";
        }

        return "redirect:/index";
    }
```

[注意点5：mybatis:加了@Param,mapper.xml中就可以用#{username},而不是#{0}之类的,增加可读性;当前,实际上,一个参数时,你不写@param,直接用#{username}也可以,但是习惯养成]
```markdown
Users selectUserByname(@Param("username") String username);
```
