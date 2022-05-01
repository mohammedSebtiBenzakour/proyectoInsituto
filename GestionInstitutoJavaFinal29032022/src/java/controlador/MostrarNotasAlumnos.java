/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import entidades.Evaluacion;
import entidades.Materia;
import entidades.Matricula;
import entidades.Registrar_alumnos;
import entidades.Registrar_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author daw2
 */
public class MostrarNotasAlumnos extends HttpServlet {

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

        String error = null;
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();
        List<Registrar_alumnos> listaAlumnos = null;
        EntityManager em = emf.createEntityManager();
        List<Registrar_usuarios> listaProfesores = null;
        List<Materia> Materias = null;
        List<Matricula> Matriculas = null;
        List<Evaluacion> Evaluaciones = null;
        Materia ma = new Materia();
        Registrar_usuarios ru = new Registrar_usuarios();
        Matricula matr = new Matricula();
        Registrar_alumnos ra = new Registrar_alumnos();

        Query consultaP = em.createQuery("Select p From Registrar_usuarios p");

//        listaProfesores = consultaP.getResultList();
        String op = request.getParameter("operation");
//        System.out.println("op " + op);
        if (op.equals("profesor")) {
            listaProfesores = consultaP.getResultList();
//            System.out.println("listaProfesores " + listaProfesores.get(0).getApellidos());
            Gson json = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
            String listProfesores = json.toJson(listaProfesores);
//            System.out.println("listProfesores " + listProfesores);

            response.setContentType("text/html");
            response.getWriter().write(listProfesores);
        }
        if (op.equals("materia")) {
            String dni = request.getParameter("id");
            Query consultaM = em.createQuery("Select m From Materia m where m.profesor =?1 ", Materia.class);
            ru.setDni(dni);
            consultaM.setParameter(1, ru);
            Materias = consultaM.getResultList();

            Gson json = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
            String listMaterias = json.toJson(Materias);

            response.setContentType("text/html");
            response.getWriter().write(listMaterias);
        }

        if (op.equals("matricula")) {
            String mat = request.getParameter("id");
            Query consultaM = em.createQuery("Select m From Matricula m where m.nombre_materia =?1 ", Matricula.class);
            ma.setMateria(mat);
            consultaM.setParameter(1, ma);
            Matriculas = consultaM.getResultList();

            Gson json = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
            String listMatriculas = json.toJson(Matriculas);

            response.setContentType("text/html");
            response.getWriter().write(listMatriculas);
        }

        if (op.equals("evaluacion")) {
            String mat = request.getParameter("id");
            System.out.println("el matr es " + mat);
            Query consultaD = em.createQuery("Select m From Matricula m where m.nombre_matricula =?1 ", Matricula.class);
            Query consultaM = em.createQuery("Select e From Evaluacion e where e.alumno =?1 ", Evaluacion.class);

            consultaD.setParameter(1, mat);

            Matriculas = consultaD.getResultList();
            ra = Matriculas.get(0).getAlumno();
            consultaM.setParameter(1, ra);
            Evaluaciones = consultaM.getResultList();
            System.out.println("el dn es " + Matriculas.get(0).getAlumno().getDni_alumno());
            Gson json = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
            String listEvaluaciones = json.toJson(Evaluaciones);

            response.setContentType("text/html");
            response.getWriter().write(listEvaluaciones);

            sesion.setAttribute("Evaluaciones", Evaluaciones);

        }

        emf.close();

//        request.setAttribute("listaProfesores", listaProfesores);
//
//        getServletContext().getRequestDispatcher("/admin/mostrarNotasAlumnos.jsp").forward(request, response);
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
