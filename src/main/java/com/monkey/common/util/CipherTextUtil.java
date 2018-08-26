package com.monkey.common.util;

import com.monkey.common.wechatsdk.PayToolUtil;
import org.apache.shiro.codec.Base64;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.Security;

public class CipherTextUtil  {

    private static final String serectKey = "your API Serect key";

    /**
     * 密钥算法
     */
    private static final String ALGORITHM = "AES";
    /**
     * 加解密算法/工作模式/填充方式
     */
    private static final String ALGORITHM_MODE_PADDING = "AES/ECB/PKCS7Padding";
    static {
        try {
            Security.addProvider(new BouncyCastleProvider());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 生成 MD5
     *
     * @param data 待处理数据
     * @return MD5结果
     */

    /**
     * AES解密
     */
    public static String decryptData(byte[] b,String serectKey) throws Exception {
        SecretKeySpec key = new SecretKeySpec(PayToolUtil.MD5(serectKey).toLowerCase().getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(ALGORITHM_MODE_PADDING);
        cipher.init(Cipher.DECRYPT_MODE, key);
        return new String(cipher.doFinal(b));
    }
    public static  String dedede(String text,String key) throws  Exception{
        byte[] b = Base64.decode(text);
        String result = decryptData(b,key);
        return  result;
    }
}

