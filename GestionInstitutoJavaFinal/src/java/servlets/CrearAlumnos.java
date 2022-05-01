/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.Nivel_insitutoJpaController;
import dao.Registrar_alumnosJpaController;
import dao.Registrar_usuariosJpaController;
import entidades.Nivel_instituto;
import entidades.Registrar_alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
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
public class CrearAlumnos extends HttpServlet {

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

        Registrar_alumnosJpaController rajc = new Registrar_alumnosJpaController(emf);

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        Registrar_alumnos ra = new Registrar_alumnos();

        Nivel_insitutoJpaController niv = new Nivel_insitutoJpaController(emf);

        String[] gen = {"hombre", "mujer"};

        String n = null;

        for (int i = 1; i < 10; i++) {
            Random r = new Random();

            int e = r.nextInt(gen.length);

            ra.setDni_alumno("a" + i);
            ra.setCalle_alumno("Calle camas " + i);
            ra.setCiudad_alumno("Camas");
            ra.setCp_alumno("41222");
            ra.setCreado_el(timeStamp);
            ra.setEmail_alumno("a" + i + "@a.com");
            String fechaR = "2022-02-0" + i;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date d = sdf.parse(fechaR);
                ra.setFecha_nacimiento_alumno(d);
            } catch (ParseException ex) {
                Logger.getLogger(CrearUsuarios.class.getName()).log(Level.SEVERE, null, ex);
            }
            ra.setGenero(gen[e]);
            ra.setImagen_alumno("logoInstituto.jpg");
            ra.setNombre_alumno("a" + i);
            ra.setPais_alumno("España");
            ra.setPrimer_apellido_alumno("a" + i);
            ra.setSegundo_apellido_alumno("b" + i);
            ra.setTelefono_alumno("12345678" + i);

            List<Nivel_instituto> listaNiv = niv.findNivel_insitutoEntities();
            int f = r.nextInt(listaNiv.size());
            ra.setNivel_alumno(listaNiv.get(f));
//            System.out.println(listaNiv.size());
//            System.out.println("El f es : " + f);
            try {
                rajc.create(ra);
            } catch (Exception ex) {
                Logger.getLogger(CrearAlumnos.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        emf.close();

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrearAlumnos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearAlumnos at " + request.getContextPath() + " correcto</h1>");
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
