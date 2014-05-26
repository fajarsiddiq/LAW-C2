<!DOCTYPE html>
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
                        <li><a href="#">Lihat Profil</a></li>
                        <li><a href="#">Edit Profil</a></li>
                        <li><a href="#">Edit Akun</a></li>
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

<div class="container">
    <br>
    <br>
    <div class="bs-docs-section clearfix">
        <div class="page-header" id="banner">
            <div class="row">
                <div class="col-lg-6">
                    <h1>Pencarian</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <form action="search.jsp" method="get">
                <div class="col-xs-6">
                    <div class="form-group">
                        <input type="text" class="form-control" name="keyword" id="inputDefault" value="" placeholder="Kata Pencarian">
                    </div>
                </div>

                <div class="col-lg-4">
                    <select class="form-control" name="kategori" id="select">
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
                    <button type="submit" name="page" value="1" class="btn btn-primary btn-block">Cari</button>
                </div>
            </form>
        </div>
    </div>

    <div class="bs-docs-section clearfix">
        <div class="page-header" id="banner">
            <div class="row">
                <div class="col-lg-6">
                    <h1>Kategori</h1>
                </div>
            </div>
        </div>
        <div class="demo-illustrations">
            <div class="row">
                <div class="col-xs-2 text-center">
                    <a href="search.jsp?keyword=&kategori=Buku Kuliah&page=1"><img  width="125" height="125" src="images/icons/png/bukukuliah.png" alt="Buku Kuliah"></a>
                </div>
                <div class="col-xs-2 text-center">
                    <a href="search.jsp?keyword=&kategori=Alat Tulis&page=1"><img width="125" height="125" src="images/icons/png/alattulis.png" alt="Alat Tulis"></a>
                </div>
                <div class="col-xs-2 text-center">
                    <a href="search.jsp?keyword=&kategori=Elektronik&page=1"><img width="125" height="125" src="images/icons/png/elektronik.png" alt="Elektronik"></a>
                </div>
                <div class="col-xs-2 text-center">
                    <a href="search.jsp?keyword=&kategori=Fashion&page=1"><img width="125" height="125"src="images/icons/png/fashion.png" alt="Fashion"></a>
                </div>
                <div class="col-xs-2 text-center">
                    <a href="search.jsp?keyword=&kategori=Jasa&page=1"><img width="125" height="125" src="images/icons/png/jasa.png" alt="Jasa"></a>
                </div>
                <div class="col-xs-2 text-center">
                    <a href="search.jsp?keyword=&kategori=Lainnya&page=1"><img width="125" height="125" src="images/icons/png/lainnya.png" alt="Lainnya"></a>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xs-2 text-center"> 
                <a href="search.jsp?kategori=Buku Kuliah">Buku Kuliah</a>
            </div>
            <div class="col-xs-2 text-center"> 
                <a href="search.jsp?kategori=Alat Tulis">Alat Tulis</a>
            </div>
            <div class="col-xs-2 text-center"> 
                <a href="search.jsp?kategori=Elektronik">Elektronik</a>
            </div>
            <div class="col-xs-2 text-center"> 
                <a href="search.jsp?kategori=Fashion">Fashion</a>
            </div>
            <div class="col-xs-2 text-center"> 
                <a href="search.jsp?kategori=Jasa">Jasa</a>
            </div>
            <div class="col-xs-2 text-center"> 
                <a href="search.jsp?kategori=Lainnya">Lainnya</a>
            </div>
        </div>
    </div>
</div>

<div id="sign_up">
    <h3>Apakah Anda sudah terdaftar?</h3>
    <span>Silakan login dibawah ini :)</span>
    <div id="sign_up_form">
        <div class="form-group">
            <label class="control-label" for="inputDefault">Username</label>
            <input type="text" name="username" class="form-control" placeholder="Masukkan username">
        </div>

        <div class="form-group">
            <label class="control-label" for="inputDefault">Password</label>
            <input type="password" name="username" class="form-control" placeholder="Masukkan password">
        </div>

        <a class="close form_button sprited" id="cancel" href="#">Cancel</a>
        <a class="form_button sprited" id="log_in" href="#">Sign in</a>
    </div>
<h3 id="left_out" class="sprited">Anda belum terdaftar</h3>
<span>Jangan sedih, silakan <a href="register.jsp">daftar</a> dulu!</span>
<a id="close_x" class="close sprited" href="#">close</a>
</div>


<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript" charset="utf-8">
    $(function() {
        function launch() {
            $('#sign_up').lightbox_me({centered: true, onLoad: function() {
                    $('#sign_up').find('input:first').focus()
                }});
        }

        $('#try-1').click(function(e) {
            $("#sign_up").lightbox_me({centered: true, preventScroll: true, onLoad: function() {
                    $("#sign_up").find("input:first").focus();
                }});

            e.preventDefault();
        });


        $('table tr:nth-child(even)').addClass('stripe');
    });
</script>

</body>

</html>
