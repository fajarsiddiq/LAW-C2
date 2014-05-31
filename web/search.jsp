<%@page import="java.text.DecimalFormat"%>
<%@page import="Konten.MemberBean"%>
<%@page import="java.util.Date"%>
<%@page import="Controller.DatabaseInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Konten.IklanBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>

<%
//  String kataKunci = request.getParameter("kataKunci");
//  String kategori = request.getParameter("herolist");
    //out.println(kataKunci + "==" + kategori);
%>

<jsp:include page="menu.jsp">
    <jsp:param name="aktif" value="Home" />
</jsp:include>

<br>

<div class="container">
    <div class="bs-docs-section clearfix">
        <div class="page-header" id="banner">
            <div class="row">
                <div class="col-lg-6">
                    <h1>Pencarian</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <form action="search.jsp?page=1" method="get">
                <div class="col-xs-6">
                    <div class="form-group">
                        <input type="text" class="form-control" name="keyword" id="inputDefault" value="" placeholder="Kata Pencarian">
                    </div>
                </div>

                <div class="col-lg-4">
                    <select name="kategori" class="form-control" id="select">
                        <option value="">Semua kategori</option>
                        <option value="Buku Kuliah">Buku Kuliah</option>
                        <option value="Alat Tulis">Alat Tulis</option>
                        <option value="Elektronik">Elektronik</option>
                        <option value="Fashion">Fashion</option>
                        <option value="Jasa">Jasa</option>
                        <option value="Lainnya">Lainnya</option>
                    </select>
                </div>

                <div class="col-xs-2">
                    <button type="submit" value="1" name="page" class="btn btn-primary btn-block">Search</button>
                </div>
            </form>
        </div>
    </div>

    <div class="bs-component">
        <ul class="breadcrumb">
            <li><a href="home.jsp">Home</a></li>
            <li class="active">Query Pencarian</li>
        </ul>
    </div>
    <%
        if (request.getMethod().equalsIgnoreCase("get")) {

            DatabaseInfo db = new DatabaseInfo();
            String keyword = (String) request.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }
            String kategori = (String) request.getParameter("kategori");
            if (kategori == null) {
                kategori = "";
            }
            ArrayList<IklanBean> listIklan;
            int offset = Integer.parseInt(request.getParameter("page"));
            //out.println(offset);
            String query;
            String select = "select * ";
            //if (!kategori.equalsIgnoreCase("")) {
            query = "from iklan where nama like '%" + keyword + "%' and kategori like '%" + kategori + "%'";
            int hasil = db.getJumlahIklan(query);
            query = select + query + " limit 6";
            if (offset > 1) {
                query = query + " offset " + 6 * (offset - 1);
            }
            listIklan = db.getIklanBasedQuery(query);
            //out.println(query);
            //} else {
            //listIklan = db.getIklan(keyword, request.getParameter("page"));
            //out.println("Masuk sini");
            //}
            //out.println(query);
            Date today = new Date();
            
    %>
    <p class="text-muted pull-right">Menampilkan <%= listIklan.size()%> hasil dari total <%= hasil%> hasil </p>

    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <%

                    //nampilin iklan
                    for (int i = 0; i < listIklan.size(); i++) {
                        IklanBean tmp = listIklan.get(i);
                        DatabaseInfo db2 = new DatabaseInfo();
                        MemberBean mbr = db2.getMember(tmp.getPemasang());
                        long diff = today.getTime() - tmp.getTanggal().getTime();
                        long diffDays = diff / (24 * 60 * 60 * 1000);
                        String waktu = ""; //untuk keterangan waktu di iklan
                        if (diffDays == 0) {
                            waktu = "Hari ini";
                        } else if (diffDays == 1) {
                            waktu = "Kemarin";
                        } else if (diffDays > 1) {
                            waktu = diffDays + " hari yang lalu";
                        }

                        String namaIklan = ""; //untuk trimming jika namanya terlalu panjang
                        if (tmp.getNama().length() > 25) {
                            namaIklan = tmp.getNama().substring(0, 22);
                            namaIklan = namaIklan + "...";
                        } else {
                            namaIklan = tmp.getNama();
                        }
                        DecimalFormat format = new DecimalFormat("#.###");
                        String hargaIklan = format.format(tmp.getHarga());
                %>
                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="http://placehold.it/280x150" alt="">
                        <div class="caption">
                            <h4 class="pull-right"><%= "Rp " + hargaIklan%></h4>
                            <form method="get">
                                <h4><a href="detailIklan.jsp?idIklan=<%= tmp.getIdIklan()%>" name="idIklan" value="<%= tmp.getIdIklan()%>"><%= namaIklan%></a>
                                </h4></form>

                            <p>
                                <span class="glyphicon glyphicon-globe"></span>
                                <span><%= mbr.getDomisili()%></span>
                                <span class="glyphicon glyphicon-tag pull-little-right"></span>
                                <span><%= tmp.getStatus()%></span>
                            </p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right"><%= tmp.getJumlahView() + " tampilan"%></p>
                            <p>
                                <span class="glyphicon glyphicon-time"></span>
                                <span><%= waktu%></span>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                    }

                %>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="pull-right">
                <div class="bs-component">
                    <ul class="pagination">

                        <%                            //int jlhIklan = db.getJumlahIklan(keyword);
                            int jlhPage = (hasil / batasan);
                            if (hasil % batasan != 0) {
                                jlhPage++;
                            }
                            if (offset == 1) {
                        %>
                        <li class="disabled"><a href="#"><<</a></li>
                            <%
                            } else {
                            %>
                        <li><a href="search.jsp?keyword=<%= keyword%>&kategori=<%= kategori%>&page=<%= offset - 1 %>"><<</a></li>
                            <%
                                }
                            for (int i = 1; i <= jlhPage; i++) {
                                
                                if (i == offset) {
                            %>
                        <li class="disabled"><a href="#"><%= i %></a></li>
                            <%
                            } else {
                            %>
                        <li><a href="search.jsp?keyword=<%= keyword%>&kategori=<%= kategori%>&page=<%= i%>"><%= i %></a></li>
                            <%
                                }
                                }
                            %>
                            <%
                                if (offset == jlhPage) {
                            %>
                        <li class="disabled"><a href="search.jsp">>></a></li>
                            <%
                            } else {
                            %>
                        <li><a href="search.jsp?keyword=<%= keyword%>&kategori=<%= kategori%>&page=<%= offset + 1 %>">>></a></li>
                            <%
                                }
                            %>
                            <%
                                }
                            %>


                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
