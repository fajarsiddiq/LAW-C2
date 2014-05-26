/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Konten;

import java.util.ArrayList;

/**
 *
 * @author Fajar Siddiq
 */
public class BookmarkBean {
    private String nama;
    private ArrayList<Integer> idIklan;

    /**
     *
     */
    public BookmarkBean() {
    }

    public BookmarkBean(String nama, ArrayList<Integer> idIklan) {
        this.nama = nama;
        this.idIklan = idIklan;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public ArrayList<Integer> getIdIklan() {
        return idIklan;
    }

    public void setIdIklan(ArrayList<Integer> idIklan) {
        this.idIklan = idIklan;
    }
    
    
    
}
