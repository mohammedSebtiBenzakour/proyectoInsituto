/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladorEditarLibro;

import controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daw2
 */
@WebServlet(name = "ServletAniadirLibro", urlPatterns = {"/ServletAniadirLibro"})
public class ServletAniadirLibro extends HttpServlet {

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
        response.setContentType("text/html;charset=latin1");
        request.setCharacterEncoding("latin1");
        String mensaje = "";
        String error = "";
        String bname = request.getParameter("nombreLibro");
        String bdesc = request.getParameter("descripcionLibro");
        String athname = request.getParameter("autorLibro");
        String cat = request.getParameter("categoriaLibro");
        Categoria cate = new Categoria();
        Libros book = null;
        int contador = 0;

        if (ClaseParaValidarDatos.validarSoloTexto(bname) == true) {
            contador++;
        } else {
            error = "El nombre del libro no es correcto";
        }
        if (ClaseParaValidarDatos.validarSoloTexto(bdesc) == true) {
            contador++;
        } else {
            error = "La descripcion del libro no es correcta";
        }
        if (ClaseParaValidarDatos.validarSoloTexto(athname) == true) {
            contador++;
        } else {
            error = "El autor del libro no es correcto";
        }
        if (contador == 3) {

            cate.setCategoriaLibro(cat);
            cate.getCategoriaLibro();
            book = new Libros(bname, bdesc, athname, cate);

            try {
                LibrosDao bkdao = new LibrosDao(Conexion.conectarBD());
                if (bkdao.añadirLibro(book)) {
                    response.sendRedirect("editarLibroIndex.jsp");
                } else {
                    error = "Algun problema en añadir el libro";
//                out.print("wrong cre3dential");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            mensaje = URLEncoder.encode("Error en el nombre del libro, la descripcion o el autor ", "latin1");
            response.sendRedirect(response.encodeRedirectURL("editarLibroIndex.jsp?mensaje=" + mensaje));
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
