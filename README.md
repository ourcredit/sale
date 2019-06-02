### 引言
 ##### 旨在分享.
 
### 项目技术栈

>###后端技术统计：

    * 后端骨架： `springboot`
    * 数据库 : `[mysql,mssql]`
    * Orm： `Mybatis,Mybatis-plus,`
    * 权限组件： `Shiro`
    * ddd模式： ` `
    * JWTtoken :`实现restful api接口,无状态授权认证`
    * 自注解 ：`实现@Pass,@Log,@Current 注解功能`
    * SpringAOP `切面注入事务,过滤请求,防止xss攻击`
    * Bcrypt加密 ：`保证密码安全性`
    * 基于u-r-p的权限体系:`用户-角色-授权体系,接口只需要关心权限。`
    * DataCreator:`项目初始数据初始化。`
    * MpGenerater:`项目代码生成器,减少60%开发。`
    * SwaggerUi ：`api接口文档，authoration认证`

>###前端技术统计:

    * 语言： `node,typescript` 
    * ui库： `iview,vue`
    * 组件： `vuex,router,axios,singlr...`
    * 全局utils：`封装通用方法,异常类,cookie,session帮助类`
    * 通用查询条件:`table展示,filter过滤自动装配.`

### 目录树
```
├────────────────
│  .gitignore   //配置文件
│  init.sql     //数据库初始化sql脚本
│  pom.xml      //springboot pom配置
│  README.md    //readme
│  sale.iml     //...
├─dashboard     //前端目录结构
│  │  .gitignore    //...
│  │  .npmrc        //...
│  │  package.json  //
│  │  tsconfig.json  //ts项目配置文件
│  │  vue.config.js  //vue配置
│  │  yarn.lock  
│  ├─node_modules  //依赖库         
│  ├─public     //公共库        
│  └─src        //源文件     
├─src   //java服务端源码
│  ├─main
│  │  ├─java
│  │  │  └─com
│  │  │      └─monkey
│  │  └─resources //资源路径
│  └─test  //测试相关
│      └─java
└─target //打包文件
```

### 服务端部署流程
 #### 环境需求:java jdk 1.8以上 maven 3.0以上
    1.通过git下载源码,进入项目根目录
    2.使用开发工具idea 或eslipe打开根目录的 pom.xml文件
    3.在工具内执行资源包还原或者在项目根目录通过mvn install 命令 安装依赖。
    4.修改~/resources/config/application-dev.properties 内数据库名以及相关信息.
    5.使用init.sql初始化数据库信息。
    6.ide直接运行SpringbootApplication.java 启动项目 
    7.访问 localhost:8081/api-docs/# 直观api文档
    8.或者 在根目录(pom所在目录) shell执行 mvn clean package 执行打包
    9.在target内直接执行打包好的jar文件 nohup java -jar sale-1.0.jar &  后台运行项目


### 客户端架构
  #### 环境需求 node 6.0以上 npm5.6以上
    1.在项目目录/dashboard内打开cmd 命令行
    2.shell内执行 npm install 还原依赖
    3.npm run serve 启动项目 预览
    4.npm run build 打包项目 打包好的文件在dist文件夹内 
    5.将打包好的项目部署到nginx 或者其他容器内。

