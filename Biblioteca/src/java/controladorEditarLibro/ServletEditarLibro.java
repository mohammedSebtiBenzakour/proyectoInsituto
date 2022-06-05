/*
Servlet para editar un libro
 */
package controladorEditarLibro;

import controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
@WebServlet(name = "ServletEditarLibro", urlPatterns = {"/ServletEditarLibro"})
public class ServletEditarLibro extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=latin1");
            request.setCharacterEncoding("latin1");
            String mensaje = null;
            String error = null;
            Connection con = Conexion.conectarBD();
            int id = Integer.parseInt(request.getParameter("id"));
            String nombreLibro = request.getParameter("nombre_libro");
            String descripcionLibro = request.getParameter("descripcion_libro");
            String autorLibro = request.getParameter("autor_libro");
            String categoriaLibro = request.getParameter("categoria_libro");

            System.out.println("la catelibr " + categoriaLibro);

            LibrosDao librosDao = new LibrosDao(con);
            Categoria cat = new Categoria();
            cat.setCategoriaLibro(categoriaLibro);

            List<Categoria> listaCategorias = null;
            listaCategorias = librosDao.getCategoriaLibros();
            request.setAttribute("listaCategorias", listaCategorias);
            System.out.println("listaCategorias " + listaCategorias);

            Libros libro = new Libros();
            libro.setId(id);
            libro.setAutorLibro(autorLibro);
            libro.setDescripcionLibro(descripcionLibro);
            libro.setNombreLibro(nombreLibro);
            libro.setCategoriaLibro(cat);
            System.out.println("el boton " + request.getParameter("modificarCategoria"));
            if (request.getParameter("modificarCategoria") == null) {
                request.setAttribute("nombreLibro", libro.getNombreLibro());
                request.setAttribute("descripcionLibro", libro.getDescripcionLibro());
                request.setAttribute("autorLibro", libro.getAutorLibro());
                request.setAttribute("categoriaLibro", libro.getCategoriaLibro().getCategoriaLibro());
                request.setAttribute("id", libro.getId());

                getServletContext().getRequestDispatcher("/editarLibro.jsp").forward(request, response);

            } else {
                System.out.println("el boton " + request.getParameter("modificarCategoria"));
                libro.setId(id);
                libro.setAutorLibro(autorLibro);
                libro.setDescripcionLibro(descripcionLibro);
                libro.setNombreLibro(nombreLibro);
                cat.setCategoriaLibro(categoriaLibro);
                libro.setCategoriaLibro(cat);
//                librosDao.modificarLibro2(libro);
                Libros l = librosDao.getLibro(id);

                int idNuevo = l.getId();

                System.out.println("idnuevo " + idNuevo);
                System.out.println("idnuevo vvvv " + libro.getId());

                if (idNuevo == libro.getId()) {
                    librosDao.modificarLibro2(libro);
                } else {
                    error = "Datos erroneos ";
                }

                boolean test = librosDao.modificarLibro(libro);
                System.out.println("el test " + test);

                if (error == null) {
                    mensaje = URLEncoder.encode("Se ha modificado el libro ", "latin1");
                    response.sendRedirect(response.encodeRedirectURL("editarLibroIndex.jsp?mensaje=" + mensaje));
                } else {
                    error = URLEncoder.encode(error, "latin1");
                    response.sendRedirect(response.encodeRedirectURL("editarLibroIndex.jsp?mensaje=" + error));
                }
            }

//            
        } catch (SQLException ex) {
            Logger.getLogger(ServletEditarLibro.class.getName()).log(Level.SEVERE, null, ex);
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
