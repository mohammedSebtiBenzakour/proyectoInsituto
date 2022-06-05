/*
Servlet para modificar una matricula
 */
package controlador;

import dao.MatriculaJpaController;
import entidades.Evaluacion;
import entidades.Materia;
import entidades.Matricula;
import entidades.Registrar_alumnos;
import entidades.Registrar_usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class ModificarMatricula extends HttpServlet {

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
        long id = 0;

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();
        EntityManager em = emf.createEntityManager();

        Query consultaA = em.createQuery("Select a From Registrar_alumnos a");

        List<Matricula> listaMatriculas = null;
        List<Registrar_alumnos> listaAlumnos = null;
        List<Materia> listaMaterias = null;

        Query consultaM = em.createQuery("Select m From Materia m");

        listaAlumnos = consultaA.getResultList();
        request.setAttribute("listaAlumnos", listaAlumnos);

        listaMaterias = consultaM.getResultList();
        request.setAttribute("listaMaterias", listaMaterias);

        Registrar_alumnos ra = new Registrar_alumnos();
        Materia mat = new Materia();

        Matricula matri = new Matricula();

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        MatriculaJpaController mjc = new MatriculaJpaController(emf);

        String idS = request.getParameter("id");
        String nombre_matricula = request.getParameter("nombre_matricula");
        String descripcion = request.getParameter("descripcion");
        String dni_alumno = request.getParameter("dni_alumno");
        String materia = request.getParameter("materia");

        ra.setDni_alumno(dni_alumno);
        mat.setMateria(materia);

        matri.setAlumno(ra);
        matri.setNombre_materia(mat);

        matri.setDescripcion(descripcion);
        matri.setNombre_matricula(nombre_matricula);

        id = Long.parseLong(idS);

        matri.setId(id);

        if (request.getParameter("modificarMatricula") == null) {

            request.setAttribute("id", matri.getId());
            request.setAttribute("nombre_matricula", matri.getNombre_matricula());
            request.setAttribute("materia", matri.getNombre_materia().getMateria());
            request.setAttribute("descripcion", matri.getDescripcion());
            request.setAttribute("dni_alumno", matri.getAlumno().getDni_alumno());

            getServletContext().getRequestDispatcher("/admin/modificarMatricula.jsp").forward(request, response);
        } else {
            id = Long.parseLong(idS);
            System.out.println("el id es " + idS);

            ra.setDni_alumno(dni_alumno);
            mat.setMateria(materia);

            matri.setAlumno(ra);
            matri.setNombre_materia(mat);

            matri.setDescripcion(descripcion);
            matri.setNombre_matricula(nombre_matricula);

            matri.setId(id);

            matri.setCreado_el(timeStamp);

            try {

                Matricula otraMatri = mjc.findMatricula(id);

                if (otraMatri.getId().equals(matri.getId())) {
                    mjc.edit(matri);
                } else {
                    error = "Error al intentar modificar la matricula - 1";
                }
            } catch (Exception ex) {
                error = "Error al intentar modificar la matricula -2";
            }
            emf.close();

            if (error == null) {
                mensaje = URLEncoder.encode("Se ha modificado la matricula ", "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarListadoMatriculas?mensaje=" + mensaje));
            } else {
                error = URLEncoder.encode(error, "latin1");
                response.sendRedirect(response.encodeRedirectURL("MostrarListadoMatriculas?mensaje=" + error));
            }

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
