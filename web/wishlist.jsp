<jsp:include page="header.jsp"></jsp:include>
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a href="#linkJualBeli" class="navbar-brand">Jual Beli ala UI</a>
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="navbar-collapse collapse" id="navbar-main">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="home.jsp">Home</a>
                    </li>
                    <li>
                        <a href="pasangiklan.jsp">Pasang Iklan</a>
                    </li>


                <%
                    String username = "";
                    HttpSession sesi = request.getSession();
                    if (sesi == null || sesi.getAttribute("username") == null) {
                %>
                <li>
                    <a href="register.jsp">Daftar</a>
                </li>
            </ul>

            <form action="/Jual_Beli_UI/Autentikasi" method="POST" class="navbar-form navbar-right">
                <input type="text" name="username" class="form-control" placeholder="Masukkan username">   
                <input type="password" name="password" class="form-control" placeholder="Masukkan password"> 
                <button type="submit" class="btn btn-primary">Masuk</button>                     
            </form>

            <%
            } else {
                username = sesi.getAttribute("username").toString();
            %>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="profile.html/#" id="profile"><%= username%><span class="caret"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="themes">
                        <li><a href="detailProfil.jsp">Lihat Profil</a></li>
                        <li><a href="#">Edit Profil</a></li>
                        <li><a href="wishlist.jsp">Lihat Wishlist</a></li>
                        <li class="divider"></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </div>
</div>

<br> 
<br>
<br>
<br>

<div class="container">
    <div class="bs-component">
        <ul class="breadcrumb">
            <li><a href="home.jsp">Home</a></li>
            <li class="active">Wishlist</li>
        </ul>
    </div>

    <div class="col-sm-12 col-lg-12 col-md-12">
        <p class="text-muted pull-right">Menampilkan 10 iklan</p>
    </div>

    <div class="col-sm-4 col-lg-4 col-md-4">

        <div class="thumbnail">
            <img src="http://placehold.it/280x150" alt="">
            <div class="caption">
                <h4 class="pull-right">Rp200000</h4>
                <h4><a href="#">Hayo Apa Coba</a>
                </h4>

                <p>
                    <span class="glyphicon glyphicon-globe"></span>
                    <span>Kepo yaa</span>
                    <span class="glyphicon glyphicon-tag pull-little-right"></span>
                    <span>Baru kok</span>
                </p>
            </div>
            <div class="ratings">
                <p class="pull-right">2000 views</p>
                <p>
                    <span class="glyphicon glyphicon-time"></span>
                    <span>Kemarin</span>
                </p>
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-lg-4 col-md-4">
        <div class="thumbnail">
            <img src="http://placehold.it/280x150" alt="">
            <div class="caption">
                <h4 class="pull-right">Rp200000</h4>
                <h4><a href="#">Hayo Apa Coba</a>
                </h4>

                <p>
                    <span class="glyphicon glyphicon-globe"></span>
                    <span>Kepo yaa</span>
                    <span class="glyphicon glyphicon-tag pull-little-right"></span>
                    <span>Baru kok</span>
                </p>
            </div>
            <div class="ratings">
                <p class="pull-right">2000 views></p>
                <p>
                    <span class="glyphicon glyphicon-time"></span>
                    <span>Kemarin</span>
                </p>
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-lg-4 col-md-4">
        <div class="thumbnail">
            <img src="http://placehold.it/280x150" alt="">
            <div class="caption">
                <h4 class="pull-right">Rp200000</h4>
                <h4><a href="#">Hayo Apa Coba</a>
                </h4>

                <p>
                    <span class="glyphicon glyphicon-globe"></span>
                    <span>Kepo yaa</span>
                    <span class="glyphicon glyphicon-tag pull-little-right"></span>
                    <span>Baru kok</span>
                </p>
            </div>
            <div class="ratings">
                <p class="pull-right">2000 views></p>
                <p>
                    <span class="glyphicon glyphicon-time"></span>
                    <span>Kemarin</span>
                </p>
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-lg-4 col-md-4">
        <div class="thumbnail">
            <img src="http://placehold.it/280x150" alt="">
            <div class="caption">
                <h4 class="pull-right">Rp200000</h4>
                <h4><a href="#">Hayo Apa Coba</a>
                </h4>

                <p>
                    <span class="glyphicon glyphicon-globe"></span>
                    <span>Kepo yaa</span>
                    <span class="glyphicon glyphicon-tag pull-little-right"></span>
                    <span>Baru kok</span>
                </p>
            </div>
            <div class="ratings">
                <p class="pull-right">2000 views></p>
                <p>
                    <span class="glyphicon glyphicon-time"></span>
                    <span>Kemarin</span>
                </p>
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-lg-4 col-md-4">
        <div class="thumbnail">
            <img src="http://placehold.it/280x150" alt="">
            <div class="caption">
                <h4 class="pull-right">Rp200000</h4>
                <h4><a href="#">Hayo Apa Coba</a>
                </h4>

                <p>
                    <span class="glyphicon glyphicon-globe"></span>
                    <span>Kepo yaa</span>
                    <span class="glyphicon glyphicon-tag pull-little-right"></span>
                    <span>Baru kok</span>
                </p>
            </div>
            <div class="ratings">
                <p class="pull-right">2000 views></p>
                <p>
                    <span class="glyphicon glyphicon-time"></span>
                    <span>Kemarin</span>
                </p>
            </div>
        </div>
    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>