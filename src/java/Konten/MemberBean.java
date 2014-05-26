/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Konten;

/**
 *
 * @author Anjar_Ibnu
 */
public class MemberBean {
    private String username, nama, jenisKelamin, jurusan, domisili, bio, fotoProfil;

    /**
     *
     */
    public MemberBean() {
    }

    /**
     *
     * @param username
     * @param nama
     * @param jenisKelamin
     * @param jurusan
     * @param domisili
     * @param bio
     * @param fotoProfil
     */
    public MemberBean(String username, String nama, String jenisKelamin, String jurusan, String domisili, String bio, String fotoProfil) {
        this.username = username;
        this.nama = nama;
        this.jenisKelamin = jenisKelamin;
        this.jurusan = jurusan;
        this.domisili = domisili;
        this.bio = bio;
        this.fotoProfil = fotoProfil;
    }

    /**
     *
     * @return
     */
    public String getUsername() {
        return username;
    }

    /**
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
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
    public String getJenisKelamin() {
        return jenisKelamin;
    }

    /**
     *
     * @param jenisKelamin
     */
    public void setJenisKelamin(String jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }

    /**
     *
     * @return
     */
    public String getJurusan() {
        return jurusan;
    }

    /**
     *
     * @param jurusan
     */
    public void setJurusan(String jurusan) {
        this.jurusan = jurusan;
    }

    /**
     *
     * @return
     */
    public String getDomisili() {
        return domisili;
    }

    /**
     *
     * @param domisili
     */
    public void setDomisili(String domisili) {
        this.domisili = domisili;
    }

    /**
     *
     * @return
     */
    public String getBio() {
        return bio;
    }

    /**
     *
     * @param bio
     */
    public void setBio(String bio) {
        this.bio = bio;
    }

    /**
     *
     * @return
     */
    public String getFotoProfil() {
        return fotoProfil;
    }

    /**
     *
     * @param fotoProfil
     */
    public void setFotoProfil(String fotoProfil) {
        this.fotoProfil = fotoProfil;
    }

    
}