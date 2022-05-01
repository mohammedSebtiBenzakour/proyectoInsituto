/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.Departamento_institutoJpaController;
import dao.Nivel_insitutoJpaController;
import dao.PerfilesJpaController;
import dao.Registrar_usuariosJpaController;
import entidades.Departamento_instituto;
import entidades.Perfiles;
import entidades.Registrar_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daw2 
 */
public class CrearUsuarios extends HttpServlet {

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
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        
        Registrar_usuariosJpaController rujc = new Registrar_usuariosJpaController(emf);
        
        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        
        Registrar_usuarios ru = new Registrar_usuarios();
        
        ru.setDni("111");
        ru.setApellidos("aaa");
        ru.setCiudad("Sevilla");
        ru.setClave("aaa");

        Departamento_institutoJpaController djc = new Departamento_institutoJpaController(emf);
        List<Departamento_instituto> listad = djc.findDepartamento_institutoEntities();
        ru.setDepartamento(listad.get(2));
        
        
        ru.setDireccion("Camas");
        ru.setEmail("a@a.com");
        String fechaR = "2022-02-23";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date d = sdf.parse(fechaR);
            ru.setFecha(d);
        } catch (ParseException ex) {
            Logger.getLogger(CrearUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ru.setFecha_registro(timeStamp);
        ru.setNombre("aaa");
        ru.setPais("España");
        
        PerfilesJpaController pjc = new PerfilesJpaController(emf);
        List<Perfiles> lista = pjc.findPerfilesEntities();
        
        ru.setPerfil(lista.get(3));
        
        ru.setUsuario("aaa");
        ru.setTelefono("123123123");
        
        try {
            rujc.create(ru);
        } catch (Exception ex) {
            Logger.getLogger(CrearUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        emf.close();
        
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrearUsuarios</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearUsuarios at " + request.getContextPath() + " hecho</h1>");
            out.println("</body>");
            out.println("</html>");
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
