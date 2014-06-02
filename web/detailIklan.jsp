<%@page import="Konten.KontakBean"%>
<%@page import="java.util.Date"%>
<%@page import="Konten.MemberBean"%>
<%@page import="Konten.IklanBean"%>
<%@page import="Controller.DatabaseInfo"%>
<!DOCTYPE html>
<% try {

%>
<jsp:include page="menu.jsp">
   <jsp:param name="aktif" value="" />
</jsp:include>
<%
                    String username = "";
                    HttpSession sesi = request.getSession();
                    if (sesi == null || sesi.getAttribute("username") == null) {
                        } else {
                username = sesi.getAttribute("username").toString();
                    }
                %>
                <br>
                <br>
                <br>

<div class="container">
    <div class="bs-component">
        <ul class="breadcrumb">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="#">Kategori</a></li>
            <li class="active">Nama Barang</li>
        </ul>
    </div>
    <%
        DatabaseInfo db = new DatabaseInfo();
        int id = Integer.parseInt(request.getParameter("idIklan"));
        IklanBean iklan = db.getDetailIklan(id);
        int view = iklan.getJumlahView();
        view++;
        iklan.setJumlahView(view);
        db.updateIklan(iklan);
        DatabaseInfo db2 = new DatabaseInfo();
        MemberBean member = db2.getMember(iklan.getPemasang());
        DatabaseInfo db3 = new DatabaseInfo();
        KontakBean kontak = db3.getKontak(iklan.getPemasang());
        Date today = new Date();

        long diff = today.getTime() - iklan.getTanggal().getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
        String waktu = ""; //untuk keterangan waktu di iklan
        if (diffDays == 0) {
            waktu = "Hari ini";
        } else if (diffDays == 1) {
            waktu = "Kemarin";
        } else if (diffDays > 1) {
            waktu = diffDays + " hari yang lalu";
        }
    %>

    <h3><%= iklan.getNama()%></h3>
    <div class="ratings">
        <p>
            <span class="glyphicon glyphicon-globe"></span>
            <span><%= member.getDomisili()%></span>
            <span class="glyphicon glyphicon-time pull-little-right"></span>
            <span><%= waktu%></span>
            <span class="glyphicon glyphicon-user pull-little-right"></span>
            <span>Ditampilkan : <%= iklan.getJumlahView()%> kali</span>
        </p>
    </div>
            <% String path = db2.getPathFotoById(id); %>
    <!-- Place somewhere in the <body> of your page -->
    <div class="row">
        <div class="col-lg-8">
            <section class="slider">
                <div id="slider" class="flexslider">
                    <ul class="slides">
                        <li>
                            <img src="images/<%= path %>" />
                        </li>
                        

                    </ul>
                </div>
                <div id="carousel" class="flexslider">
                    <ul class="slides">
                        <li>
                            <img src="images/<%= path %>" />
                        </li>
                        

                    </ul>
                </div>
            </section>
        </div>

        <div class="col-lg-4">
            <div class="bs-component">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h2 class="panel-title">Rp <%= iklan.getHarga()%></h2>                
                        <p>
                            <span class="glyphicon glyphicon-tag"></span>
                            <span><%= iklan.getStatus()%></span>
                        </p>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="http://placehold.it/100x100" alt="">
                            </div>
                            <div class="col-md-8">
                                <h3><%= member.getNama()%></h3>
                                <%--<p><%= member.getBio() %></p> --%>
                            </div>
                        </div>

                        <div class="row">
                            <ul class="list-group">
                                <% if (kontak.getNoHp() != null) {
                                %>
                                <li class="list-group-item">
                                    <span class="glyphicon glyphicon-phone"></span>
                                    <span><%= kontak.getNoHp()%></span>
                                </li>
                                <%
                                    }
                                    if (kontak.getPinBbm() != null) {
                                %>
                                <li class="list-group-item">          
                                    <span class="glyphicon glyphicon-phone"></span>
                                    <span><%= kontak.getPinBbm()%></span>
                                </li>
                                <%
                                    }
                                    if (kontak.getAkunFb() != null) {
                                %>
                                <li class="list-group-item">
                                    <span class="glyphicon glyphicon-phone"></span>
                                    <span><%= kontak.getAkunFb()%></span>
                                </li>
                                <%
                                    }
                                    if (kontak.getAkunTwitter() != null) {
                                %>
                                <li class="list-group-item">
                                    <span class="glyphicon glyphicon-phone"></span>
                                    <span><%= kontak.getAkunTwitter()%></span>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                            <form action="detailIklan.jsp?idIklan=<%= iklan.getIdIklan()%>" method="POST">
                                <%
                                if (db.cekBookmark(iklan, username)) {
                                    %>
                                        <button name="wishlist" value="0" type="submit" class="btn btn-primary btn-block">Hapus dari Wishlist</button>
                                    <%
                                } else {
                                    %>
                                        <button name="wishlist" value="1" type="submit" class="btn btn-primary btn-block">Tambahkan ke Wishlist</button>
                                    <%
                                }
                                //%>
                                <button name="voucher" value="1" type="submit" class="btn btn-primary btn-block">Bayar Melalui Voucher</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="bs-component">
                <div class="well">
                    <h3>Deskripsi</h3>
                    <%= iklan.getDeskripsi() %>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>

            <script type="text/javascript">
                $(function() {
                    SyntaxHighlighter.all();
                });
                $(window).load(function() {
                    $('#carousel').flexslider({
                        animation: "slide",
                        controlNav: false,
                        animationLoop: false,
                        slideshow: false,
                        itemWidth: 210,
                        itemMargin: 5,
                        asNavFor: '#slider'
                    });

                    $('#slider').flexslider({
                        animation: "slide",
                        controlNav: false,
                        animationLoop: false,
                        slideshow: false,
                        sync: "#carousel",
                        start: function(slider) {
                            $('body').removeClass('loading');
                        }
                    });
                });
            </script>

            </body>
            </html>
        <% } catch (Exception e) {
                e.printStackTrace();
            }
        %>