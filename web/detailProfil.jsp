<%@page import="edu.yale.its.tp.cas.client.filter.CASFilter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="databaseInfo" class="Controller.DatabaseInfo"></jsp:useBean>
<jsp:useBean id="currentMember" class="Konten.MemberBean"></jsp:useBean>
<jsp:useBean id="currentKontak" class="Konten.KontakBean"></jsp:useBean>

<jsp:include page="menu.jsp">
   <jsp:param name="aktif" value="" />
</jsp:include>

<br> 
<br>
<br>
<br>

<div class="container">
    <div class="bs-component">
        <ul class="breadcrumb">
            <li><a href="home.jsp">Home</a></li>
            <li class="active">Edit Profil</li>
        </ul>
    </div>

    <div class="row">
        <div class="col-lg-3">
            <div class="thumbnail"> 

                <img src="http://placehold.it/210x210" alt="">
                <ul class="list-group">
                    <li class="list-group-item">          
                        <span class="glyphicon glyphicon-user"></span>
                        <span>Riska Fadilla</span>
                    </li>
                    <li class="list-group-item">          
                        <span class="glyphicon glyphicon-calendar"></span>
                        <span>Member sejak: Agustus 2014</span>
                    </li>
                    <li class="list-group-item">
                        <span class="glyphicon glyphicon-envelope"></span>
                        <span>riska.fadilla21@gmail.com</span>
                    </li>
                    <li class="list-group-item">
                        <span class="glyphicon glyphicon-phone"></span>
                        <span>085263781518</span>
                    </li>
                    <li class="list-group-item">
                        <span class="glyphicon glyphicon-phone"></span>
                        <span>702010</span>
                    </li>
                </ul>
                <button type="submit" class="btn btn-primary btn-block">Edit Profil</button>

            </div>
        </div>

        <div class="col-lg-9">
            <div class="col-sm-12 col-lg-12 col-md-12">
                <h3 class="text-muted">Iklan</h3> 
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
    </div>    
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>