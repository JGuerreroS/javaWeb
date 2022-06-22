
package Utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class EncriptarMD5 {
    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.reset();
            md.update(input.getBytes());
            byte[] encBytes = md.digest();
            BigInteger num = new BigInteger(1, encBytes);
            String encString = num.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
