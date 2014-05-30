function setOptions(chosen) {
var selbox = document.myform.opttwo;
 
selbox.options.length = 0;
if (chosen == " ") {
  selbox.options[selbox.options.length] = new Option('Silakan pilih fakultas terlebih dahulu.',' ');
 
}
if (chosen == "1") {
  selbox.options[selbox.options.length] = new
Option('Pendidikan Dokter','oneone');
}
if (chosen == "2") {
  selbox.options[selbox.options.length] = new
Option('Pendidikan Dokter Gigi','twoone');
}
if (chosen == "3") {
  selbox.options[selbox.options.length] = new
Option('Biologi','threeone');
  selbox.options[selbox.options.length] = new
Option('Fisika','threetwo');
selbox.options[selbox.options.length] = new
Option('Geografi','threethree');
  selbox.options[selbox.options.length] = new
Option('Kimia','threefour');
selbox.options[selbox.options.length] = new
Option('Matematika','threefive');
}
if (chosen == "4") {
  selbox.options[selbox.options.length] = new
Option('Farmasi','fourone');
}
if (chosen == "5") {
  selbox.options[selbox.options.length] = new
Option('Arsiektur','fiveone');
selbox.options[selbox.options.length] = new
Option('Arsitektur Interior','fivetwo');
selbox.options[selbox.options.length] = new
Option('Teknik Elektro','fivethree');
selbox.options[selbox.options.length] = new
Option('Teknik Industri','fivefour');
selbox.options[selbox.options.length] = new
Option('Teknik Kimia','fivefive');
selbox.options[selbox.options.length] = new
Option('Teknik Komputer','fivesix');
selbox.options[selbox.options.length] = new
Option('Teknik Lingkungan','fiveseven');
selbox.options[selbox.options.length] = new
Option('Teknik Mesin','fiveeight');
selbox.options[selbox.options.length] = new
Option('Teknik Metalurgi & Material','fivenine');
selbox.options[selbox.options.length] = new
Option('Teknik Perkapalan','fiveten');
selbox.options[selbox.options.length] = new
Option('Teknik Sipil','fiveeleven');
selbox.options[selbox.options.length] = new
Option('Teknologi Bioproses','fivtwelve');
}
if (chosen == "6") {
  selbox.options[selbox.options.length] = new
Option('Ilmu Hukum','sixone');
}
if (chosen == "7") {
  selbox.options[selbox.options.length] = new
Option('Akuntansi','sevenone');
selbox.options[selbox.options.length] = new
Option('Ilmu Ekonomi','seventwo');
selbox.options[selbox.options.length] = new
Option('Ilmu Ekonomi Islam','seventhree');
selbox.options[selbox.options.length] = new
Option('Manajemen','sevenfour');
selbox.options[selbox.options.length] = new
Option('Bisnis Islam','sevenfive');
}
if (chosen == "8") {
  selbox.options[selbox.options.length] = new
Option('Arkeologi','eightone');
selbox.options[selbox.options.length] = new
Option('Bahasa dan Kebudayaan Korea','eighttwo');
selbox.options[selbox.options.length] = new
Option('Ilmu Filsat','eightthree');
selbox.options[selbox.options.length] = new
Option('Ilmu Perpustakaan','eightfour');
selbox.options[selbox.options.length] = new
Option('Ilmu Sejarah','eightfive');
  selbox.options[selbox.options.length] = new
Option('Sastra Arab','eightsix');
selbox.options[selbox.options.length] = new
Option('Sastra Belanda','eightseven');
selbox.options[selbox.options.length] = new
Option('Sastra Cina','eighteight');
selbox.options[selbox.options.length] = new
Option('Sastra Daerah untuk Sastra Jawa','eightnine');
selbox.options[selbox.options.length] = new
Option('Sastra Indonesia','eightten');
  selbox.options[selbox.options.length] = new
Option('Sastra Inggris','eighteleven');
selbox.options[selbox.options.length] = new
Option('Sastra Jepang','eighttwelve');
selbox.options[selbox.options.length] = new
Option('Sastra Jerman','eightthirteen');
selbox.options[selbox.options.length] = new
Option('Sastra Perancis','eightfourteen');
selbox.options[selbox.options.length] = new
Option('Sastra Rusia','eightfifteen');
}
if (chosen == "9") {
  selbox.options[selbox.options.length] = new
Option('Psikologi','nineone');
}
if (chosen == "10") {
  selbox.options[selbox.options.length] = new
Option('Antropologi Sosial','tenone');
selbox.options[selbox.options.length] = new
Option('Ilmu Administrasi Fiskal','tentwo');
selbox.options[selbox.options.length] = new
Option('Ilmu Administrasi Negara','tenthree');
selbox.options[selbox.options.length] = new
Option('Ilmu Administrasi Niaga','tenfour');
selbox.options[selbox.options.length] = new
Option('Ilmu Hubungan Internasional','tenfive');
  selbox.options[selbox.options.length] = new
Option('Ilmu Kesejahteraan Sosial','tensix');
selbox.options[selbox.options.length] = new
Option('Ilmu Komunikasi','tenseven');
selbox.options[selbox.options.length] = new
Option('Ilmu Politik','teneight');
selbox.options[selbox.options.length] = new
Option('Kriminologi','tennine');
selbox.options[selbox.options.length] = new
Option('Sosiologi','tenten');
}
if (chosen == "11") {
  selbox.options[selbox.options.length] = new
Option('Gizi','elevenone');
selbox.options[selbox.options.length] = new
Option('Kesehatan Masayarakat','eleventwo');
selbox.options[selbox.options.length] = new
Option('Kesehatan Lingkungan','eleventhree');
}
if (chosen == "12") {
  selbox.options[selbox.options.length] = new
Option('Ilmu Komputer','twelveone');
selbox.options[selbox.options.length] = new
Option('Sistem Informasi','twelvetwo');
}
if (chosen == "13") {
  selbox.options[selbox.options.length] = new
Option('Ilmu Keperawatan','thirteenone');
}
}