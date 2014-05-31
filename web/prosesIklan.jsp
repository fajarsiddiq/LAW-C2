<%@page import="Controller.DatabaseInfo"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%-- 
    Document   : prosesIklan
    Created on : May 31, 2014, 3:53:29 AM
    Author     : Fajar Siddiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="iklanBaru" class="Konten.IklanBean"></jsp:useBean>
<jsp:useBean id="gambarBaru" class="Konten.GambarBean"></jsp:useBean>
<jsp:useBean id="member" class="Konten.MemberBean"></jsp:useBean>
<%
    String username = "";
    HttpSession sesi = request.getSession();
    if (sesi == null || sesi.getAttribute("username") == null) {
    } else {
        username = sesi.getAttribute("username").toString();
    }

    String namaIklan = "";
    String kategori = "";;
    int harga = 0;
    String jenis = "";
    String status = "";
    String deskripsi = "";
    ArrayList<String> path = new ArrayList<String>();

    if (request.getMethod().equalsIgnoreCase("post")) {
        File file;
        int maxFileSize = 2560 * 1920;
        int maxMemSize = 2560 * 1920;
        ServletContext context = pageContext.getServletContext();
        String filePath = context.getInitParameter("file-upload");

        // Verify the content type
        String contentType = request.getContentType();
        if ((contentType.indexOf("multipart/form-data") >= 0)) {

            DiskFileItemFactory factory = new DiskFileItemFactory();
            // maximum size that will be stored in memory
            factory.setSizeThreshold(maxMemSize);
            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File("f:\\temp"));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            // maximum file size to be uploaded.
            upload.setSizeMax(maxFileSize);
            try {
                // Parse the request to get file items.
                List fileItems = upload.parseRequest(request);

                // Process the uploaded file items
                Iterator i = fileItems.iterator();

                out.println("<html>");
                out.println("<head>");
                out.println("<title>UIBerdagang</title>");
                out.println("</head>");
                out.println("<body>");
                
                // tolong periksa setelah while selesai
                while (i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField()) {
                        // Get the uploaded file parameters

                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();
                        // Write the file
                        if (fileName.lastIndexOf("\\") >= 0) {
                            file = new File(filePath
                                    + fileName.substring(fileName.lastIndexOf("\\")));
                        } else {
                            file = new File(filePath
                                    + fileName.substring(fileName.lastIndexOf("\\") + 1));
                        }
                        fi.write(file);
                        //out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                        path.add(fileName);

                    } else {
                        if (fi.getFieldName().equalsIgnoreCase("namaIklan")) {
                            namaIklan = fi.getString();
                            //out.println(namaIklan);
                        }
                        if (fi.getFieldName().equalsIgnoreCase("kategori")) {
                            kategori = fi.getString();
                            //out.println(kategori);
                        }
                        if (fi.getFieldName().equalsIgnoreCase("harga")) {
                            harga = Integer.parseInt(fi.getString());
                            //out.println(harga);
                        }
                        if (fi.getFieldName().equalsIgnoreCase("jenis")) {
                            jenis = fi.getString();
                            //out.println(jenis);
                        }
                        if (fi.getFieldName().equalsIgnoreCase("status")) {
                            status = fi.getString();
                            //out.println(status);
                        }
                        if (fi.getFieldName().equalsIgnoreCase("deskripsi")) {
                            deskripsi = fi.getString();
                            //out.println(deskripsi);
                        }
                    }

                }
                // cek mulai di sini
                DatabaseInfo databaseInfo = new DatabaseInfo();

                iklanBaru.setNama(namaIklan);
                //out.println("Nama iklan = " + namaIklan);
                iklanBaru.setHarga(harga);
                iklanBaru.setJenisIklan(jenis);
                iklanBaru.setPemasang("muhammad.fajar12");
                iklanBaru.setKategori(kategori);
                iklanBaru.setStatus(status);
                java.util.Date utilDate = new java.util.Date();
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                iklanBaru.setTanggal(sqlDate);
                iklanBaru.setJumlahView(0);
                iklanBaru.setLinkFoto("");
                iklanBaru.setDeskripsi(deskripsi);

                String tes = databaseInfo.saveIklan(iklanBaru);
                //out.println(tes);

                gambarBaru.setAkun_ui("muhammad.fajar12");
                int id = databaseInfo.getIdIklan(namaIklan);
                gambarBaru.setIdIklan(id);
                out.println(id);
                for (int ii = 0; ii < path.size(); ii++) {
                    if (ii == 0) {
                        gambarBaru.setPath1(path.get(0));
                    }
                    if (ii == 1) {
                        gambarBaru.setPath1(path.get(1));
                    }
                    if (ii == 2) {
                        gambarBaru.setPath1(path.get(2));
                    }
                    if (ii == 3) {
                        gambarBaru.setPath1(path.get(3));
                    }
                    if (ii == 4) {
                        gambarBaru.setPath1(path.get(4));
                    }
                    if (ii == 5) {
                        gambarBaru.setPath1(path.get(5));
                    }
                }
                databaseInfo.saveGambar(gambarBaru);
                
                
                out.println("</body>");
                out.println("</html>");
            } catch (Exception ex) {
                System.out.println(ex);
            }
        } else {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>No file uploaded</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }


%>