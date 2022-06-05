/*
Servlet para leer los emails
 */
package controlador;

import central.LeerEmail;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Properties;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daw2
 */
public class LeerElEmail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

//         request.setAttribute("email", mensajes);
//         getServletContext().getRequestDispatcher("/admin/leerEmail.jsp").forward(request, response);
        try (PrintWriter out = response.getWriter()) {
            Message[] mensajes = null;
            Properties props = System.getProperties();
            props.setProperty("mail.store.protocol", "imaps");
            try {
                Session session = Session.getDefaultInstance(props, null);
                Store store = session.getStore("imaps");
                store.connect("outlook.office365.com", "msb.iescamas@outlook.com", "Msb.93345900");
                Folder[] folders = store.getDefaultFolder().list("*");
                for (Folder folder : folders) {
                    if (folder.getType() == 3) {
                        System.out.println(folder.getFullName() + ": " + folder.getMessageCount());

                        folder = store.getFolder(folder.getFullName());
                        folder.open(Folder.READ_ONLY);

                        mensajes = folder.getMessages();

                        for (int i = 0; i < mensajes.length; i++) {
                            out.println("<h1 style='color: green;'> " + mensajes[i].getFrom()[0].toString() + "</h1>");
                            out.println("<h1> " + mensajes[i].getSubject() + "</h1>");
//                        System.out.println("DE    : " + mensajes[i].getFrom()[0].toString());
//                        System.out.println("ASUNTO: " + mensajes[i].getSubject());
                        }
                    }
                }
            } catch (MessagingException e) {
                e.printStackTrace();
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
