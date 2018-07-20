package com.monkey.common.base;

public interface PermissionConst {
    public  static class  _dashboard{
        public static  final  String list="dashboard:show";
    }
    public  static  class  _order{
        public  static  final  String list="order:list";
        public  static  final  String show="order:show";
        public  static  final  String back="order:back";
    }
    public  static  class  _report{
        public static  final  String list="report:show";
        public  static  class _a{
            public static  final  String list="product:list";

        }
        public  static  class _b{
            public static  final  String list="box:list";
        }

    }


    public  static  class  _pm{
        public static  final  String list="product:show";
        public  static  class _product{
            public static  final  String list="product:list";
            public static  final  String modify="product:modify";
            public static  final  String delete="product:delete";
            public static  final  String batch="product:batch";
            public static  final  String first="org:first";
        }
        public  static  class _box{
            public static  final  String list="box:list";
            public static  final  String modify="box:modify";
            public static  final  String delete="box:delete";
            public static  final  String batch="box:batch";
            public static  final  String first="box:first";
        }

    }

    public  static  class  _watch{
        public static  final  String list="watch:show";
        public  static  class _actionlog{
            public static  final  String list="actionlog:list";
            public static  final  String modify="actionlog:modify";
            public static  final  String delete="actionlog:delete";
            public static  final  String batch="actionlog:batch";
            public static  final  String first="actionlog:first";
        }
        public  static  class _runlog{
            public static  final  String list="runlog:list";
            public static  final  String modify="runlog:modify";
            public static  final  String delete="runlog:delete";
            public static  final  String batch="runlog:batch";
            public static  final  String first="runlog:first";
        }
        public  static  class _errorlog{
            public static  final  String list="errorlog:list";
            public static  final  String modify="errorlog:modify";
            public static  final  String delete="errorlog:delete";
            public static  final  String batch="errorlog:batch";
            public static  final  String first="errorlog:first";
        }

    }


    public  static  class  _pointer{
        public static  final  String list="pointer:show";
        public  static  class _org{
            public static  final  String list="org:list";
            public static  final  String modify="org:modify";
            public static  final  String delete="org:delete";
            public static  final  String batch="org:batch";
            public static  final  String first="org:first";
        }
        public  static  class _point{
            public static  final  String list="point:list";
            public static  final  String modify="point:modify";
            public static  final  String delete="point:delete";
            public static  final  String batch="point:batch";
            public static  final  String first="point:first";
        }

    }

    public  static class  _system{
        public static  final  String list="system:show";
        public  static class  _user{
            public static  final  String list="user:list";
            public static  final  String modify="user:modify";
            public static  final  String delete="user:delete";
            public static  final  String batch="user:batch";
            public static  final  String first="user:first";
        }
        public  static class  _role{
            public static  final  String list="role:list";
            public static  final  String modify="role:modify";
            public static  final  String delete="role:delete";
            public static  final  String batch="role:batch";
            public static  final  String first="role:first";
        }
        public  static class  _menu{
            public static  final  String list="menu:list";
            public static  final  String modify="menu:modify";
            public static  final  String delete="menu:delete";
            public static  final  String batch="menu:batch";
            public static  final  String first="menu:first";
        }
        public  static class  _allowmanager{
            public static  final  String list="allow:list";
            public static  final  String modify="allow:modify";
            public static  final  String delete="allow:delete";
            public static  final  String batch="allow:batch";
            public static  final  String first="allow:first";
        }
    }

}
