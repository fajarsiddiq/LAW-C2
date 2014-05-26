/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

/**
 *
 * @author RiskaFadilla
 */
public class Checker {

    public static void main(String[] args) throws Exception {

        String password = "1234567890123456";
        String passwordEnc = EncryptDecrypt.encrypt(password);
        String passwordDec = EncryptDecrypt.decrypt(passwordEnc);

        System.out.println("Plain Text : " + password);
        System.out.println("Encrypted Text : " + passwordEnc);
        System.out.println("Decrypted Text : " + passwordDec);
    }
}
