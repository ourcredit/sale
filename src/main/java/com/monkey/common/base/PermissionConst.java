package com.monkey.common.base;

public interface PermissionConst {
    public  static class  _system{
        public static  final  String list="system:list";
    }
    public  static class  _user{
        public static  final  String list="user:list";
        public static  final  String modify="user:modify";
        public static  final  String delete="user:delete";
        public static  final  String batch="user:batch";
        public static  final  String userrole="user:userrole";
        public static  final  String first="user:first";
    }
    public  static class  _role{
        public static  final  String list="role:list";
        public static  final  String modify="role:modify";
        public static  final  String delete="role:delete";
        public static  final  String batch="role:batch";
        public static  final  String rolemenu="role:rolemenu";
        public static  final  String first="role:first";
    }
    public  static class  _menu{
        public static  final  String list="role:list";
        public static  final  String modify="role:modify";
        public static  final  String delete="role:delete";
        public static  final  String batch="role:batch";
        public static  final  String first="role:first";
    }
    public  static class  _log{
        public static  final  String list="log:list";
        public static  final  String modify="log:modify";
        public static  final  String delete="log:delete";
        public static  final  String batch="log:batch";
        public static  final  String first="log:first";
    }
}
