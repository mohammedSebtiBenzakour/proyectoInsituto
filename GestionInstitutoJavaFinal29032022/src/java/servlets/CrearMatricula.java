/*
Servlet para crear matriculas
 */
package servlets;

import dao.MateriaJpaController;
import dao.MatriculaJpaController;
import dao.Registrar_alumnosJpaController;
import entidades.Materia;
import entidades.Matricula;
import entidades.Registrar_alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daw2
 */
public class CrearMatricula extends HttpServlet {

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

        EntityManager em = emf.createEntityManager();

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        MatriculaJpaController mjc = new MatriculaJpaController(emf);

        Registrar_alumnosJpaController rajc = new Registrar_alumnosJpaController(emf);

        Matricula ma = new Matricula();

        Registrar_alumnos ra = new Registrar_alumnos();

        Query consultaA = em.createQuery("Select a From Registrar_alumnos a");

        Query consultaM = em.createQuery("Select m From Materia m");

        List<Registrar_alumnos> listaAlumnos = null;

        List<Materia> listaMaterias = null;

        listaAlumnos = consultaA.getResultList();

        listaMaterias = consultaM.getResultList();
        
        System.out.println("el es " + listaMaterias.get(0).getMateria());

        for (int i = 1; i < 10; i++) {
            Random r = new Random();

            int ema = r.nextInt(listaMaterias.size());
            int eal = r.nextInt(listaAlumnos.size());

            ma.setAlumno(listaAlumnos.get(eal));
            ma.setCreado_el(timeStamp);
            ma.setDescripcion("Descripcion matricula-" + i);
            ma.setNombre_matricula("Matricula-" + i);
            ma.setNombre_materia(listaMaterias.get(ema));

            mjc.create(ma);
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrearMatricula</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearMatricula at " + request.getContextPath() + "</h1>");
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
