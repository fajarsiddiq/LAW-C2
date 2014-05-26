package Konten;


import java.util.Date;




/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Anjar_Ibnu
 */
public class IklanBean {
    private String nama, pemasang, kategori, status, linkFoto, jenisIklan, deskripsi;
    private int idIklan, jumlahView, harga;
    private Date tanggal;

    public IklanBean() {
    }

    public IklanBean(int idIklan, String nama, String pemasang, String kategori, String status, int jumlahView, String linkFoto, int harga, String jenisIklan, Date tanggal, String deskripsi) {
        this.nama = nama;
        this.pemasang = pemasang;
        this.kategori = kategori;
        this.status = status;
        this.linkFoto = linkFoto;
        this.jenisIklan = jenisIklan;
        this.deskripsi = deskripsi;
        this.idIklan = idIklan;
        this.jumlahView = jumlahView;
        this.harga = harga;
        this.tanggal = tanggal;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getPemasang() {
        return pemasang;
    }

    public void setPemasang(String pemasang) {
        this.pemasang = pemasang;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLinkFoto() {
        return linkFoto;
    }

    public void setLinkFoto(String linkFoto) {
        this.linkFoto = linkFoto;
    }

    public String getJenisIklan() {
        return jenisIklan;
    }

    public void setJenisIklan(String jenisIklan) {
        this.jenisIklan = jenisIklan;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public int getIdIklan() {
        return idIklan;
    }

    public void setIdIklan(int idIklan) {
        this.idIklan = idIklan;
    }

    public int getJumlahView() {
        return jumlahView;
    }

    public void setJumlahView(int jumlahView) {
        this.jumlahView = jumlahView;
    }

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }

    public Date getTanggal() {
        return tanggal;
    }

    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }
    
    
    
}
