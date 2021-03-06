/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Konten.AkunBean;
import Konten.BookmarkBean;
import Konten.GambarBean;
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
import sun.rmi.runtime.Log;

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
    public String saveIklan(IklanBean newIklan) {
        openConnection();
        String query = "insert into iklan (nama, pemasang, kategori, status, jumlah_view, link_foto, harga, jenis_iklan, tanggal, deskripsi) values ('"
                + newIklan.getNama() + "','" + newIklan.getPemasang() + "','" + newIklan.getKategori() + "','" + newIklan.getStatus() + "'," + newIklan.getJumlahView() + ",'"
                + newIklan.getLinkFoto() + "'," + newIklan.getHarga() + ",'" + newIklan.getJenisIklan() + "','" + newIklan.getTanggal() + "','" + newIklan.getDeskripsi() + "');";
        try {
            stmt.executeUpdate(query);
            closeConnection();
            return query;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return "salah";
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
    
    public AkunBean getAkunBean(String username)
    {
        AkunBean hasil = new AkunBean();
        openConnection();
        String query = "select * from password where user_ui = '" + username + "'";
        try {
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                hasil.setPassword(rs.getString("password_baru"));
                hasil.setUsername(rs.getString("user_ui"));
            }
            closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return hasil;
    }
    
    public void updateAkun(String username, AkunBean akun, MemberBean member)
    {
        openConnection();
        System.out.println("ini nih " + username + ", " + akun.getPassword() + ", nama = " + member.getNama());
        String query = "Update password set "
                + "password_baru = '" + akun.getPassword() + "'"
                + " where user_ui = '" + username + "';";
        String query2 = "Update member set "
                + "nama = '" + member.getNama() + "'"
                + " where user_ui = '" + username + "';";
        try {
            stmt.executeUpdate(query);
            stmt.executeUpdate(query2);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }
    
    public GambarBean getGambarBean (String username, int idIklan) {
        openConnection();
        String query = "select * from gambar where user_ui = '" + username + "' and id_iklan = " + idIklan + ";";
        try {
            String path1 = "";
            String path2 = "";
            String path3 = "";
            String path4 = "";
            String path5 = "";
            String path6 = "";
            String userUI = "";
            int id_iklan = 0;
            rs = stmt.executeQuery(query);
            int i = 1;
            while (rs.next()) {
                if (i == 1) {
                    path1 = rs.getString("path_satu");
                } else if (i == 2) {
                    path2 = rs.getString("path_dua");
                } else if (i == 3) {
                    path3 = rs.getString("path_tiga");
                } else if (i == 4) {
                    path4 = rs.getString("path_empat");
                } else if (i == 5) {
                    path5 = rs.getString("path_lima");
                } else if (i == 6) {
                    path6 = rs.getString("path_enam");
                }
                i++;
                userUI = rs.getString("user_ui");
                id_iklan = rs.getInt("id_iklan");
            }
            GambarBean gb = new GambarBean(userUI, id_iklan, path1, path2, path3, path4, path5, path6);
            closeConnection();
            return gb;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }
    
    public void saveGambar(GambarBean gb) {
        openConnection();
        String query = "insert into gambar values ('" + gb.getAkun_ui() + "', " + gb.getIdIklan() + ", '" + gb.getPath1() + "', '"
                + gb.getPath2() + "', '" + gb.getPath3() + "', '" + gb.getPath4() + "', '" + gb.getPath5() + "', '" + gb.getPath6() + "');";
        try {
            stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
    }
    
    public int getIdIklan (String namaIklan) {
        openConnection();
        String query = "select id from iklan where nama = '" + namaIklan + "';";

        try {
            rs = stmt.executeQuery(query);
            int idIklan = 0;
            while (rs.next()) {
                idIklan = rs.getInt("id");
            }

            closeConnection();
            return idIklan;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return 0;
    }
    
    public String getUserByNama (String nama) {
        openConnection();
        String query = "select user_ui from member where nama = '" + nama + "';";

        try {
            rs = stmt.executeQuery(query);
            String username = "";
            while (rs.next()) {
                username = rs.getString("user_ui");
            }

            closeConnection();
            return username;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }
    
    public String getPathFotoById (int id) {
        openConnection();
        String query = "select path_satu from gambar where id_iklan = " + id + ";";

        try {
            rs = stmt.executeQuery(query);
            String path = "";
            while (rs.next()) {
                path = rs.getString("path_satu");
            }

            closeConnection();
            return path;
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        closeConnection();
        return null;
    }
}
