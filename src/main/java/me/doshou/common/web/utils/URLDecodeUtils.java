package me.doshou.common.web.utils;

import java.io.UnsupportedEncodingException;

/**
 * URLDecodeUtils
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 15-1-12
 * Time: 上午11:08
 */
public class URLDecodeUtils {

    public static String decode(String encodeMsg) {
        try {
            String transMsg = new String(encodeMsg.getBytes("ISO-8859-1"), "UTF-8");
            return java.net.URLDecoder.decode(transMsg , "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String[] decode(String[] ecodeMsgs) {
        String[] result = new String[ecodeMsgs.length];
        try {
            for (int i = 0; i < ecodeMsgs.length; i++) {
                String transMsg = new String(ecodeMsgs[i].getBytes("ISO-8859-1"), "UTF-8");
                result[i] = java.net.URLDecoder.decode(transMsg , "UTF-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return result;
    }
}
