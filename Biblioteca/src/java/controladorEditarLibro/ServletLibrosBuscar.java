/*
Servlet para buscar un libro
 */
package controladorEditarLibro;

import controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daw2
 */
@WebServlet(name = "ServletLibrosBuscar", urlPatterns = {"/ServletLibrosBuscar"})
public class ServletLibrosBuscar extends HttpServlet {

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

        boolean test = false;
        try {
            response.setContentType("text/html;charset=latin1");
            request.setCharacterEncoding("latin1");

            String error = "";
            Connection con = Conexion.conectarBD();

            String buscar = request.getParameter("buscar");

            LibrosDao librosDao = new LibrosDao(con);

            List<Libros> libros = librosDao.getLibros(buscar);
            request.setAttribute("libros", libros);

            test = true;

            if (test) {
                //  response.sendRedirect("editarLibroBuscar.jsp");
                request.getRequestDispatcher("editarLibroBuscar.jsp").forward(request, response);
                // error = "todo correcto " + " el buscaar : " + buscar;
            } else {
                error = "Algun error suelto ";
            }

            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ServletLibrosBuscar</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet ServletLibrosBuscar at " + request.getContextPath() + "</h1>");
                out.println("<h1> " + error + "</h1>");
                out.println("<h1> " + libros + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
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
