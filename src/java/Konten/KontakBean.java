/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Konten;

/**
 *
 * @author Fajar Siddiq
 */
public class KontakBean {
    private String nama, noHp, emailLain, akunFb, akunTwitter, pinBbm;

    /**
     *
     */
    public KontakBean() {
    }

    /**
     *
     * @param nama
     * @param noHp
     * @param emailLain
     * @param akunFb
     * @param akunTwitter
     * @param pinBbm
     */
    public KontakBean(String nama, String noHp, String emailLain, String akunFb, String akunTwitter, String pinBbm) {
        this.nama = nama;
        this.noHp = noHp;
        this.emailLain = emailLain;
        this.akunFb = akunFb;
        this.akunTwitter = akunTwitter;
        this.pinBbm = pinBbm;
    }

    /**
     *
     * @return
     */
    public String getNama() {
        return nama;
    }

    /**
     *
     * @param nama
     */
    public void setNama(String nama) {
        this.nama = nama;
    }

    /**
     *
     * @return
     */
    public String getNoHp() {
        return noHp;
    }

    /**
     *
     * @param noHp
     */
    public void setNoHp(String noHp) {
        this.noHp = noHp;
    }

    /**
     *
     * @return
     */
    public String getEmailLain() {
        return emailLain;
    }

    /**
     *
     * @param emailLain
     */
    public void setEmailLain(String emailLain) {
        this.emailLain = emailLain;
    }

    /**
     *
     * @return
     */
    public String getAkunFb() {
        return akunFb;
    }

    /**
     *
     * @param akunFb
     */
    public void setAkunFb(String akunFb) {
        this.akunFb = akunFb;
    }

    /**
     *
     * @return
     */
    public String getAkunTwitter() {
        return akunTwitter;
    }

    /**
     *
     * @param akunTwitter
     */
    public void setAkunTwitter(String akunTwitter) {
        this.akunTwitter = akunTwitter;
    }

    /**
     *
     * @return
     */
    public String getPinBbm() {
        return pinBbm;
    }

    /**
     *
     * @param pinBbm
     */
    public void setPinBbm(String pinBbm) {
        this.pinBbm = pinBbm;
    }
    
    
}
