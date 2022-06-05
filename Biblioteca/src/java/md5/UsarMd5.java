/*
Clase para encryptar pero no se utiliza
 */
package md5;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.swing.JOptionPane;
import org.apache.commons.codec.digest.DigestUtils;
import javax.crypto.*;

import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author daw2
 */
public class UsarMd5 {

    public static void main(String[] args) {
        String secretKey = "SomosProgramadores";
        String a = "mohammed";
        UsarMd5 u = new UsarMd5();
        String cadenaAEncriptar = a;
        String cadenaEncriptada = u.ecnode(secretKey, cadenaAEncriptar);
//        JOptionPane.showMessageDialog(null, "Cadena encriptada: " + cadenaEncriptada);
        System.out.println("Cadena encriptada: " + cadenaEncriptada);
        String cadenaDesencriptada = u.deecnode(secretKey, cadenaEncriptada);
//        JOptionPane.showMessageDialog(null, "Cadena desencriptada: " + cadenaDesencriptada);
        System.out.println("Cadena desencriptada: " + cadenaDesencriptada);
    }

    public static String md5ToString(byte[] md5) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < md5.length; i++) {
            int temp = md5[i] & 0Xff;
            String hexString = Integer.toHexString(temp);
            if (hexString.length() < 2) {
                sb.append("0").append(hexString);
            } else {
                sb.append(hexString);
            }
        }
        return sb.toString();
    }

    public String ecnode(String secretKey, String cadena) {
        String encriptacion = "";
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] llavePassword = md5.digest(secretKey.getBytes("utf-8"));
            byte[] BytesKey = Arrays.copyOf(llavePassword, 24);
            SecretKey key = new SecretKeySpec(BytesKey, "DESede");
            Cipher cifrado = Cipher.getInstance("DESede");
            cifrado.init(Cipher.ENCRYPT_MODE, key);
            byte[] plainTextBytes = cadena.getBytes("utf-8");
            byte[] buf = cifrado.doFinal(plainTextBytes);
            byte[] base64Bytes = Base64.encodeBase64(buf);
            encriptacion = new String(base64Bytes);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Algo salió mal");
        }
        return encriptacion;
    }

    public String deecnode(String secretKey, String cadenaEncriptada) {
        String desencriptacion = "";
        try {
            byte[] message = Base64.decodeBase64(cadenaEncriptada.getBytes("utf-8"));
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] digestOfPassword = md5.digest(secretKey.getBytes("utf-8"));
            byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
            SecretKey key = new SecretKeySpec(keyBytes, "DESede");
            Cipher decipher = Cipher.getInstance("DESede");
            decipher.init(Cipher.DECRYPT_MODE, key);
            byte[] plainText = decipher.doFinal(message);
            desencriptacion = new String(plainText, "UTF-8");

        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Algo salió mal");
        }
        return desencriptacion;
    }

}
