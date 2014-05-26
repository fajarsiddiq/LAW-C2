/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Konten.AkunBean;
import Konten.BookmarkBean;
import Konten.IklanBean;
import Konten.KontakBean;
import Konten.MemberBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Anjar_Ibnu
 */
public class DatabaseInfo {

    /**
     *
     */
    public static final String DATABASE_DRIVER = "com.mysql.jdbc.Driver";

    /**
     *
     */
    public static final String DATABASE_URL = "jdbc:mysql://localhost:3306/jualbeli";

    /**
     *
     */
    public static final String DATABASE_USERNAME = "root";

    /**
     *
     */
    public static final String DATABASE_PASSWORD = "";
    private Connection con;
    private Statement stmt;
    private ResultSet rs;

    private void openConnection() {
        try {
            Class.forName(DATABASE_DRIVER);

            con = DriverManager.getConnection(DATABASE_URL, DATABASE_USERNAME, DATABASE_PASSWORD);
            stmt = con.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {

        }
    }

    private void closeConnection() {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     *
     * @param newMember
     */
    public void saveMember(MemberBean newMember) {
        openConnection();
        String query = "INSERT INTO member VALUES('" + newMember.getUsername() + "','" + newMember.getNama() + "','"
                + newMember.getJenisKelamin() + "','" + newMember.getJurusan() + "','"
                + newMember.getDomisili() + "','" + newMember.getBio() + "','" + newMember.getFotoProfil() + "');";
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }

    /**
     *
     * @param username
     * @return
     */
    public MemberBean getMember(String username) {
        openConnection();

        String query = "select * from member where user_ui = '" + username + "'";
        try {

            rs = stmt.executeQuery(query);
            if (rs.next()) {
                String nama = rs.getString("nama");
                String jenisKelamin = rs.getString("jenis_kelamin");
                String jurusan = rs.getString("jurusan");
                String domisili = rs.getString("domisili");
                String bio = rs.getString("bio");
                String fotoProfil = rs.getString("foto_profil");

                MemberBean result = new MemberBean(username, nama, jenisKelamin, jurusan, domisili, bio, fotoProfil);
                closeConnection();
                return result;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }

    /**
     *
     * @param newIklan
     */
    public void saveIklan(IklanBean newIklan) {
        openConnection();
        String query = "insert into iklan (nama, pemasang, kategori, status, jumlah_view, link_foto, harga, jenis_iklan, tanggal, deskripsi) values ("
                + newIklan.getNama() + "','" + newIklan.getPemasang() + "','" + newIklan.getKategori() + "','" + newIklan.getStatus() + "'," + newIklan.getJumlahView() + ",'"
                + newIklan.getLinkFoto() + "'," + newIklan.getHarga() + ",'" + newIklan.getJenisIklan() + "','" + newIklan.getTanggal() + "','" + newIklan.getDeskripsi() + "');";
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }

    public int getJumlahIklan(String query) {
        openConnection();
        query = "select count(*) as total " + query;
        int result = 0;
        try {
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                String tmp = rs.getString("total");
                result = Integer.parseInt(tmp);

            }
            //result = 8;

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return result;
    }

    public IklanBean getDetailIklan(int idIklan) {
        openConnection();
        String query = "select * from iklan where id = '" + idIklan + "'";
        try {
            stmt.executeQuery(query);
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                String nama = rs.getString("nama");
                String pemasang = rs.getString("pemasang");
                String kategori = rs.getString("kategori");
                String status = rs.getString("status");
                int jumlahView = rs.getInt("jumlah_view");
                String linkFoto = rs.getString("link_foto");
                int harga = rs.getInt("harga");
                String jenisIklan = rs.getString("jenis_iklan");
                Date tanggal = rs.getDate("tanggal");
                String deskripsi = rs.getString("deskripsi");

                IklanBean result = new IklanBean(idIklan, nama, pemasang, kategori, status, jumlahView, linkFoto, harga, jenisIklan, tanggal, deskripsi);

                closeConnection();
                return result;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }

    public ArrayList<IklanBean> getIklanBasedQuery(String query) {
        openConnection();

        try {
            rs = stmt.executeQuery(query);

            ArrayList<IklanBean> daftarIklan = new ArrayList<>();

            while (rs.next()) {
                int idIklan = rs.getInt("id");
                String nama = rs.getString("nama");
                String pemasang = rs.getString("pemasang");
                String kategori = rs.getString("kategori");
                String status = rs.getString("status");
                int jumlahView = rs.getInt("jumlah_view");
                String linkFoto = rs.getString("link_foto");
                int harga = rs.getInt("harga");
                String jenisIklan = rs.getString("jenis_iklan");
                Date tanggal = rs.getDate("tanggal");
                String deskripsi = rs.getString("deskripsi");

                IklanBean result = new IklanBean(idIklan, nama, pemasang, kategori, status, jumlahView, linkFoto, harga, jenisIklan, tanggal, deskripsi);
                daftarIklan.add(result);
            }

            closeConnection();
            return daftarIklan;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }

    public ArrayList<IklanBean> getIklan(String namaIklan, String offset) {
        openConnection();
//        int offNum = Integer.parseInt(offset);
        String query = "select * from iklan where nama like '%" + namaIklan + "%'";
//        if (offNum == 1) {
//            query = "select * from iklan where nama like '%" + namaIklan + "%' limit 3";
//        } else if (offNum > 1) {
//            query = "select * from iklan where nama like '%" + namaIklan + "%' limit 3 offset " + ((offNum - 1) * 3);
//        }
        try {
            stmt.executeQuery(query);
            rs = stmt.executeQuery(query);
            ArrayList<IklanBean> daftarIklan = new ArrayList<>();

            while (rs.next()) {
                int idIklan = rs.getInt("id");
                String nama = rs.getString("nama");
                String pemasang = rs.getString("pemasang");
                String kategori = rs.getString("kategori");
                String status = rs.getString("status");
                int jumlahView = rs.getInt("jumlah_view");
                String linkFoto = rs.getString("link_foto");
                int harga = rs.getInt("harga");
                String jenisIklan = rs.getString("jenis_iklan");
                Date tanggal = rs.getDate("tanggal");
                String deskripsi = rs.getString("deskripsi");

                IklanBean result = new IklanBean(idIklan, nama, pemasang, kategori, status, jumlahView, linkFoto, harga, jenisIklan, tanggal, deskripsi);
                daftarIklan.add(result);
            }

            closeConnection();
            return daftarIklan;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }

    /**
     *
     * @param newIklan
     */
    public void saveKontak(KontakBean newKontak) {
        openConnection();
        String query = "insert into kontak values ('" + newKontak.getNama() + "','" + newKontak.getNoHp() + "','" + newKontak.getEmailLain() + "','" + newKontak.getAkunFb()
                + "','" + newKontak.getAkunTwitter() + "','" + newKontak.getPinBbm() + "');";
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }

    public KontakBean getKontak(String namaPengguna) {
        openConnection();

        String query = "select * from kontak where nama = '" + namaPengguna + "'";
        try {
            stmt.executeQuery(query);
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                String noHp = rs.getString("no_hp");
                String emailLain = rs.getString("email_lain");
                String akunFb = rs.getString("akun_fb");
                String akunTwitter = rs.getString("akun_twitter");
                String pinBbm = rs.getString("pin_bbm");

                KontakBean result = new KontakBean(namaPengguna, noHp, emailLain, akunFb, akunTwitter, pinBbm);
                closeConnection();
                return result;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }

    /**
     *
     * @param newBookmark
     * @param newIklan
     */
    public void saveBookmark(BookmarkBean newBookmark) {
        openConnection();
        String query = "insert into bookmark values ('" + newBookmark.getNama() + "','" + newBookmark.getIdIklan() + "');";
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }

    public BookmarkBean getBookmark(String namaPengguna) {
        openConnection();

        String query = "select * from bookmark where user_ui = '" + namaPengguna + "'";
        try {
            stmt.executeQuery(query);
            rs = stmt.executeQuery(query);
            ArrayList<Integer> idIklan = new ArrayList<>();
            // retrieve semua bookmark yang tersedia
            while (rs.next()) {
                idIklan.add(rs.getInt("id_iklan"));
            }

            BookmarkBean result = new BookmarkBean(namaPengguna, idIklan);
            closeConnection();
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }

    public void savePassword(AkunBean newAkun) {
        openConnection();

        String query = "insert into password values ('" + newAkun.getUsername() + "','" + newAkun.getPassword() + "');";
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }

    public String getPassword(String username) {
        String hasil = "";
        openConnection();
        String query = "select password_baru from password where user_ui = '" + username + "'";
        try {
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                hasil = rs.getString("password_baru");
            }

            closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return hasil;
    }

    public String getUsername(String usernameUI) {
        String hasil = "";
        openConnection();
        String query = "select nama from member where user_ui = '" + usernameUI + "'";
        try {
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                hasil = rs.getString("nama");
            }

            closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return hasil;
    }

    public String getUsernameUI(String username) {
        String hasil = "";
        openConnection();
        String query = "select user_ui from member where nama = '" + username + "'";
        try {
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                hasil = rs.getString("user_ui");
            }

            closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return hasil;
    }

    public void updateMember(MemberBean member) {
        openConnection();
        String query = "Update member set "
                + "nama = '" + member.getNama() + "',"
                + "domisili = '" + member.getDomisili() + "',"
                + "bio = '" + member.getBio() + "' ,"
                + "foto_profil = '" + member.getFotoProfil() + "' "
                + "where user_ui = '" + member.getUsername() + "'";
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }

    public void updateKontak(KontakBean kontak) {
        openConnection();
        String query = "Update kontak set "
                + "no_hp = '" + kontak.getNoHp() + "',"
                + "akun_fb = '" + kontak.getAkunFb() + "',"
                + "email_lain = '" + kontak.getEmailLain() + "' ,"
                + "akun_twitter = '" + kontak.getAkunTwitter() + "',"
                + "pin_bbm = '" + kontak.getPinBbm() + "'"
                + "where nama = '" + kontak.getNama() + "'";
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }

    public void updateIklan(IklanBean iklan) {
        openConnection();
        String query = "Update iklan set "
                + "jumlah_view = " + iklan.getJumlahView()
                + " where id = " + iklan.getIdIklan();
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }

    public boolean cekBookmark(IklanBean iklan, String member) {
        openConnection();
        String query = "select * from bookmarks where id_iklan = " + iklan.getIdIklan() + " and nama = '" + member + "'";
        int idIklan = 0;
        try {
            rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                idIklan = rs.getInt("id_iklan");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        closeConnection();
        return (idIklan == 0);
    }
}
