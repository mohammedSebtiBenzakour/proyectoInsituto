/*
Servlet para enviar un email de otra manera
 */
package controlador;

import central.Central;
import central.Email;
import central.EmailUtility;
import dao.Registrar_alumnosJpaController;
import entidades.Registrar_alumnos;
import entidades.Registrar_usuarios;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.MessagingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author daw2
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class EnviarEmailGeneral extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void init() {
        // reads SMTP server setting from web.xml file

//        host = "smtp.gmail.com";
//        port = "587";
//        user = "msb.caixa@gmail.com";
//        pass = "93345900";
        host = "smtp.office365.com";
        port = "587";
        user = "msb.iescamas@outlook.com";
        pass = "Msb.93345900";
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=latin1");
        request.setCharacterEncoding("latin1");
        String error = null;

        HttpSession sesion = request.getSession();

        String mensaje = null;

        List<File> uploadedFiles = saveUploadedFiles(request);

        String recipient = request.getParameter("para");
        String subject = request.getParameter("asunto");
        String content = request.getParameter("mensaje_email");
        String resultMessage = "";

        if (validarEmail(recipient) == true) {

            try {
                EmailUtility.sendEmailWithAttachment(host, port, user, pass, recipient, subject, content, uploadedFiles);

                resultMessage = "The e-mail was sent successfully";
            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "There were an error: " + ex.getMessage();
            } finally {
                deleteUploadFiles(uploadedFiles);
                request.setAttribute("message", resultMessage);
                //  getServletContext().getRequestDispatcher("/admin/enviarEmail.jsp").forward(request, response);
            }
            System.out.println("el mensaje " + resultMessage);

        } else {
            resultMessage = "El email NO es valido.";
        }
        if (resultMessage == null) {
            mensaje = URLEncoder.encode("Se ha enviado el email al nombre " + "latin1");
            response.sendRedirect(response.encodeRedirectURL("../inicio.jsp?mensaje=" + mensaje));
        } else {
            resultMessage = URLEncoder.encode(resultMessage, "latin1");
            response.sendRedirect(response.encodeRedirectURL("enviarEmail.jsp?mensaje=" + resultMessage));
        }
    }

    public static boolean validarEmail(String email) {
        String patron = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        Pattern p = Pattern.compile(patron);

        Matcher m = p.matcher(email);
        return m.find();
    }

    private List<File> saveUploadedFiles(HttpServletRequest request)
            throws IllegalStateException, IOException, ServletException {
        List<File> listFiles = new ArrayList<File>();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        Collection<Part> multiparts = request.getParts();
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {
                // creates a file to be saved
                String fileName = extractFileName(part);
                if (fileName == null || fileName.equals("")) {
                    // not attachment part, continue
                    continue;
                }

                File saveFile = new File(fileName);
                System.out.println("saveFile: " + saveFile.getAbsolutePath());
                FileOutputStream outputStream = new FileOutputStream(saveFile);

                // saves uploaded file
                InputStream inputStream = part.getInputStream();
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.close();
                inputStream.close();

                listFiles.add(saveFile);
            }
        }
        return listFiles;
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }

    private void deleteUploadFiles(List<File> listFiles) {
        if (listFiles != null && listFiles.size() > 0) {
            for (File aFile : listFiles) {
                aFile.delete();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
