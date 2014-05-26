package Controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Irania - Riska Fadilla
 */
public class RC4 {

    //array untuk menyimpan tabel S
    static int[] S = new int[256];

    //temporary array untuk membangun tabel permutasi S 
    static int[] T = new int[256];

    /**
     *
     * @return
     */
    public static int[] getS() {
        return S;
    }

    /**
     *
     * @return
     */
    public static int[] getT() {
        return T;
    }

//    public static void main(String[] args) {
//        //bacaInputText("C:\\Users\\DFB\\Documents\\Plaintext.txt");
//        //System.out.println((char) (34));
//          char[] key = RC4.bacaInputKey("C:\\Users\\DFB\\Documents\\NetBeansProjects\\Pretty_RC4\\key.txt");
//        //membangun tabel permutasi S\
//            RC4.keyTable(key);
//         String title = "Tabel S (Setelah Permutasi Awal)";
//            RC4.tulisOutputTabelS(S, title, false);
//
//            //membaca input ciphertext dan menuliskan hasil deskripsi ke file
//            tulisOutputResult(RC4.enkripsi(bacaInputText("C:\\Users\\DFB\\Documents\\NetBeansProjects\\Pretty_RC4\\Ciphertext.txt")), "enkripsi");
//
//            //menuliskan tabel S setelah proses deskripsi
//            title = "Tabel S (Sesudah Enkripsi)";
//            RC4.tulisOutputTabelS(S, title, true);
//        
//    }

	/*
		method untuk membaca input text yang berupa ascii kedalam arraylist hex
		dan dari arraylist hex yang berisi ascii dimasukan kedalam array of integer
		resultText
	*/

    /**
     *
     * @param file
     * @return
     */
    
    public static int[] bacaInputText(String file) {
        BufferedReader br = null;
        int[] resultText = null;
        ArrayList<Character> hex = new ArrayList<Character>();
        
        try {
            String text;
            br = new BufferedReader(new FileReader(file));

            //membaca satu baris input dan menyimpannya ke array String 
            //dengan memisahkannya berdasarkan spasi (" ")
            while ((text = br.readLine()) != null) {
                for(int i = 0; i < text.length(); i++){
                    hex.add(text.charAt(i));
                }
                hex.add('\n');
            }
            
            resultText = new int[hex.size()];

            //mengconvert tiap elemen array hex ke format integer
            for (int i = 0; i < hex.size(); i++) {
                resultText[i] = (int) hex.get(i);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return resultText;
    }

	/*
		method ini berfungsi untuk membaca input key yang berupa file
		dan file dari key tersebut berisi karakter ascii yang nantinya akan dimasukan 
		kedalam arraylist key yang nantinya digunakan untuk method lain
	*/

    /**
     *
     * @param file
     * @return
     */
    
    public static ArrayList<Character> bacaInputKey(String file) {
        BufferedReader br = null;
        ArrayList<Character> key = new ArrayList<Character>();

        try {
            String text;
            br = new BufferedReader(new FileReader(file));

            //membaca satu baris input dan menyimpannya ke array Char
            while ((text = br.readLine()) != null) {
                for(int i = 0; i < text.length(); i++){
                    key.add(text.charAt(i));
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return key;
    }

	/*
		method untuk menulis hasil output table S kedalam sebuah file .txt
		isi dari table S diambil dari static array S yang kemudian dituliskan kedalam file
	*/

    /**
     *
     * @param title
     * @param append
     */
    
    public static void tulisOutputTabelS(String title, boolean append) {
        try {

            File file = new File("S.txt");

            // if file doesnt exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw;

            // file akan di append untuk tabel S sesudah proses enkripsi/deskripsi
            if (append) {
                fw = new FileWriter(file.getAbsoluteFile(), true);
            } else {
                fw = new FileWriter(file.getAbsoluteFile());
            }
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(title);
            for (int i = 0; i < S.length; i++) {
                 if (i % 10 == 0) {
                     bw.newLine();
                 }
                     bw.write(String.format("%8d", S[i]));
                     
            }
            bw.newLine();
            bw.newLine();
            bw.flush();
            

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	/*
		method untuk menyimpan hasil dari enkripsi/dekripsi kedalam file .txt
		isi yang akan ditulis ke file diambil dari array int, karena hasil dari enkripsi/dekripsi
		ingin berupa ascii, maka isi dari array int di konversi menjadi char
	*/

    /**
     *
     * @param array
     * @param jenis
     * @return
     */
    
    public static String tulisOutputResult(int[] array, String jenis) {
        String text = "";
        try {
            
            File file = null;
            if(jenis.equals("enkripsi")) {
                file = new File("Ciphertext.txt");
            } else {
                file = new File("Plaintext.txt");
            }
            

            // if file doesnt exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);

            for (int i = 0; i < array.length; i++){
                
                if(array[i] == 10){
                    bw.newLine();
                    text+="\n";
                }
                else{
                    bw.write((char) array[i]);
                    text+=(char) array[i];
                }
            }

            bw.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return text;
    }

	/*
		method untuk membuat table S, arraylist keyText didapatkan dari method bacaInputKey
	*/

    /**
     *
     * @param keyText
     */
    
    public static void keyTable(ArrayList<Character> keyText) {
        for (int i = 0; i < 256; i++) {
            S[i] = i;
            T[i] = (int) (keyText.get(i % keyText.size()));

        }
        int j = 0;
        for (int i = 0; i < 256; i++) {
            j = (j + S[i] + T[i]) % 256;
            int tmp = S[i];
            S[i] = S[j];
            S[j] = tmp;
        }
    }

	/*
		method untuk melakukan enkripsi, algoritma dari method ini diambil dari slide kuliah
	*/

    /**
     *
     * @param M
     * @return
     */
    
    public static int[] enkripsi(int[] M) {
        int[] C = new int[M.length];
        int i = 0;
        int j = 0;
        int t;

        for (int k = 0; k < M.length; k++) {
            
                i = (i + 1) % 256;
                j = (j + S[i]) % 256;

                //swap(S[i], S[j])
                int temp = S[i];
                S[i] = S[j];
                S[j] = temp;

                t = (S[i] + S[j]) % 256;
				//jika isinya 10, artinya new line
                if(M[k] == 10){
                     C[k] = 10;
                }
                 else{
                C[k] = M[k] ^ S[t];
                }
        }
        return C;
    }

	/*
		method untuk dekripsi dengan memanggil method enkripsi
	*/

    /**
     *
     * @param ciphertext
     * @return
     */
    
    public static int[] deskripsi(int[] ciphertext) {
        return enkripsi(ciphertext);
    }
}
