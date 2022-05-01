/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import central.ClaseParaValidarDatos;
import dao.CursoJpaController;
import entidades.Curso;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author daw2
 */
public class InsertarCurso extends HttpServlet {

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
        String mensaje = null;
        String error = null;

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        CursoJpaController cujc = new CursoJpaController(emf);

        Curso cu = new Curso();

        String curso = request.getParameter("curso");
        String descripcion = request.getParameter("descricpion");

        if (ClaseParaValidarDatos.validarDatosNumeros(curso) == true) {
            if (ClaseParaValidarDatos.validarDatos(descripcion) == true) {

                cu.setCurso(curso);
                cu.setDescripcion_curso(descripcion);
                cu.setFecha_creacion(timeStamp);

                try {
                    cujc.create(cu);
                } catch (Exception ex) {
                    if (ex.getMessage().contains("Duplicate entry")) {
                        error = "Ya existe el curso " + cu.getCurso();
                    } else {
                        error = "Error al insertar el curso (" + ex.getMessage() + ")";
                        System.out.println("el error es " + error);
                        System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
                    }
                }
            } else {
                error = "La descripcion no es correcta";
            }

        } else {
            error = "El formato del curso no es correcto";
        }

        //Si no hay ningun error se dirige a una pagina o a otra   
        if (error == null) {
            mensaje = URLEncoder.encode("Se ha creado el curso " + cu.getCurso(), "latin1");
            response.sendRedirect(response.encodeRedirectURL("gestionCursos.jsp?mensaje=" + mensaje));

            return;
        } else {

            mensaje = URLEncoder.encode("Error en el curso o la descripcion ", "latin1");
            response.sendRedirect(response.encodeRedirectURL("insertarCurso.jsp?mensaje=" + mensaje));
            return;
//            request.setAttribute("error", error);
//            getServletContext().getRequestDispatcher("/admin/insertarCurso.jsp").forward(request, response);
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
