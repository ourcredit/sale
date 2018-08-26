package com.monkey.common.util;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.monkey.core.entity.Tree;
import com.monkey.web.controller.dtos.TreeDtoInput;

import javax.swing.event.TreeWillExpandListener;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author liugh
 * @since 2018-05-07
 */
public class ComUtil {

    public static boolean isEmpty(Object aObj) {
        if (aObj instanceof String) {
            return isEmpty((String) aObj);
        } else if (aObj instanceof Long) {
            return isEmpty((Long) aObj);
        } else if (aObj instanceof Date) {
            return isEmpty((Date) aObj);
        } else if (aObj instanceof Collection) {
            return isEmpty((Collection) aObj);
        } else if (aObj instanceof Map) {
            return isEmpty((Map) aObj);
        } else if (aObj != null && aObj.getClass().isArray()) {
            return isEmptyArray(aObj);
        } else {
            return isNull(aObj);
        }
    }

    private static boolean isEmptyArray(Object array) {
        int length = 0;
        if (array instanceof int[]) {
            length = ((int[]) array).length;
        } else if (array instanceof byte[]) {
            length = ((byte[]) array).length;
        } else if (array instanceof short[]) {
            length = ((short[]) array).length;
        } else if (array instanceof char[]) {
            length = ((char[]) array).length;
        } else if (array instanceof float[]) {
            length = ((float[]) array).length;
        } else if (array instanceof double[]) {
            length = ((double[]) array).length;
        } else if (array instanceof long[]) {
            length = ((long[]) array).length;
        } else if (array instanceof boolean[]) {
            length = ((boolean[]) array).length;
        } else {
            length = ((Object[]) array).length;
        }
        if (length == 0) {
            return true;
        }
        return false;
    }


    public static boolean isEmpty(Date aDate) {
        if (aDate == null) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isEmpty(Long aLong) {
        if (aLong == null) {
            return true;
        } else {
            return false;
        }
    }


    public static boolean isEmpty(Map m) {
        if (m == null || m.size() == 0) {
            return true;
        }
        return false;
    }

    public static boolean isEmpty(Collection c) {
        if (c == null || c.size() == 0) {
            return true;
        }
        return false;
    }

    public static boolean isEmpty(String aStr) {
        if (aStr == null || aStr.trim().isEmpty()) {
            return true;
        } else {
            return false;
        }
    }


    public static String trim(String aStr) {
        if (aStr == null) {
            return "";
        } else {
            return aStr.trim();
        }
    }

    public static boolean isNull(Object oStr) {
        if (oStr == null) {
            return true;
        } else {
            return false;
        }
    }


    public static boolean equals(String str1, String str2) {
        return str1 != null ? str1.equals(str2) : str2 == null;
    }

    public static boolean equals(Long L1, Long L2) {
        return L1 != null ? L1.equals(L2) : L2 == null;
    }

    public static boolean equals(Object obj1, Object obj2) {
        boolean result;
        if (obj1 != null) {
            result = obj1.equals(obj2);
        } else {
            result = (obj2 == null);
        }
        return result;
    }

    public static boolean equalsIgnoreCase(String str1, String str2) {
        return str1 != null ? str1.equalsIgnoreCase(str2) : str2 == null;
    }

    public static EntityWrapper genderFilter(EntityWrapper e, Map<String, Object> m) {
        if (m != null && !m.isEmpty()) {
            Set<String> r = m.keySet();
            for (String key : r) {
                Object v = m.get(key);

                if (v instanceof Number) {
                    e.eq(key, v);
                } else if (v instanceof String) {
                    String s = (String) v;
                   s= s.trim();
                    if (!s.isEmpty()) {
                        e.like(key, s);
                    }
                } else if (v instanceof Boolean) {
                    Boolean b = ((Boolean) v).booleanValue();
                    if (b != null) {
                        e.eq(key, b);
                    }
                } else if (v instanceof Date) {
                    Date d = (Date) v;
                    e.eq(key, d);
                } else if (v instanceof List) {
                    List a = (List) v;
                    if (!a.isEmpty() && a.size() == 2) {
                        String l = a.get(0).toString();
                        if (!l.isEmpty()) {
                            e.ge(key, l);

                        }
                        String rr = a.get(1).toString();
                        if (!rr.isEmpty()) {
                            e.le(key, rr);

                        }
                    }

                }

            }
        }
        return e;
    }


}
