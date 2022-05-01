/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import central.Central;
import dao.Registrar_usuariosJpaController;
import entidades.Registrar_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
public class Login extends HttpServlet {

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
        String error = null;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        String dni = request.getParameter("dni");
        String clave = request.getParameter("clave");
        //Compruebo que los datos introducidos no son ni nulos ni cadenas vacias 
        if (dni != null && clave != null && !dni.isEmpty() && !clave.isEmpty()) {
            Registrar_usuarios ru = null;
            Registrar_usuariosJpaController rujc = new Registrar_usuariosJpaController(emf);

            ru = rujc.findRegistrar_usuarios(dni);

            System.out.println("el usuario es : " + ru);
            //Si el usuario existe en la base de datos
            if (ru != null) {
                if (ru.getClave().equals(clave)) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("usuario", ru);
                    sesion.setAttribute("central", new Central());
                    response.sendRedirect("inicio.jsp");
                    return;
                } else {
                    //la contraseña es incorrecta
                    error = "Usuario o contraseña incorrectos 1 ";
                }
            } else {
                //El usuario no existe en la base de datos
                error = "Usuario o contraseña incorrectos 2 ";
            }
        } else {
            error = "Debe introducir usuario y contraseña";
        }

        emf.close();
        request.setAttribute("error", error);

        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);

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
