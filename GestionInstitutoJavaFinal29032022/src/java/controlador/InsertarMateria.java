/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import central.ClaseParaValidarDatos;
import dao.MateriaJpaController;
import entidades.Materia;
import entidades.Registrar_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
public class InsertarMateria extends HttpServlet {

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
        String errorMateria = null;
        String errorDescripcion = null;
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        MateriaJpaController mtc = new MateriaJpaController(emf);

        Registrar_usuarios ru = new Registrar_usuarios();

        String profesor = request.getParameter("profesor");

        String materia = request.getParameter("materia");
        String descripcion = request.getParameter("descricpion");
        Materia mat = new Materia();

        if (ClaseParaValidarDatos.validarDatos(materia) == true) {
            if (ClaseParaValidarDatos.validarSoloTexto(descripcion) == true) {

                ru.setDni(profesor);
                mat.setMateria(materia);
                mat.setDescripcion_materia(descripcion);
                mat.setProfesor(ru);
                mat.setFecha_creacion(timeStamp);

                try {
                    mtc.create(mat);
                } catch (Exception ex) {
                    if (ex.getMessage().contains("Duplicate entry")) {
                        error = "Ya existe la materia " + mat.getMateria();
                    } else {
                        error = "Error al insertar la materia (" + ex.getMessage() + ")";
                        System.out.println("el error es " + error);
                        System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
                    }
                }
            } else {
                errorDescripcion = "La descripcion no es correcta";
                error = "La descripcion no es correcta";
            }
        } else {
            errorMateria = "La materia no es correcta";
            error = "La descripcion no es correcta";
        }
        //Si no hay ningun error se dirige a una pagina o a otra   
        if (error == null && errorMateria == null && errorDescripcion == null) {
            mensaje = URLEncoder.encode("Se ha creado la materia " + mat.getMateria(), "latin1");
            response.sendRedirect(response.encodeRedirectURL("gestionMaterias.jsp?mensaje=" + mensaje));

            return;
        } else {

//            request.setAttribute("error", error);
//            getServletContext().getRequestDispatcher("/admin/insertarMateria.jsp").forward(request, response);
            mensaje = URLEncoder.encode("Error en la materia o descripcion ", "latin1");
            response.sendRedirect(response.encodeRedirectURL("insertarMateria.jsp?mensaje=" + mensaje));

            return;
        }

    }

    public static boolean validarNombreODescripcion(String nombre) {
        String patronRegular = "^[A-Za-z\\s]{1,}[\\.]{0,1}[A-Za-z\\s]{0,}$";

        String patron = "^\\pL+[\\pL\\pZ\\pP]{0,}$";
        Pattern p = Pattern.compile(patron, Pattern.CASE_INSENSITIVE);

        Matcher m = p.matcher(nombre);
        return m.find();
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
