/*
 Servlet para insertar una matricula
 */
package controlador;

import central.ClaseParaValidarDatos;
import dao.MatriculaJpaController;
import entidades.Materia;
import entidades.Matricula;
import entidades.Registrar_alumnos;
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
public class InsertarMatricula extends HttpServlet {

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

        Registrar_alumnos ra = new Registrar_alumnos();
        Materia mat = new Materia();

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
        HttpSession sesion = request.getSession();

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

        MatriculaJpaController majc = new MatriculaJpaController(emf);

        String nombre_matricula = request.getParameter("nombre_matricula");
        String descripcion = request.getParameter("descripcion");
        String dni_alumno = request.getParameter("dni_alumno");
        String materia = request.getParameter("materia");
        Matricula matri = new Matricula();
        
        if (ClaseParaValidarDatos.validarSoloTexto(nombre_matricula) == true) {
            if (ClaseParaValidarDatos.validarSoloTexto(descripcion) == true) {

                ra.setDni_alumno(dni_alumno);
                mat.setMateria(materia);

                matri.setAlumno(ra);
                matri.setCreado_el(timeStamp);
                matri.setDescripcion(descripcion);
                matri.setNombre_matricula(nombre_matricula);
                matri.setNombre_materia(mat);

                try {
                    majc.create(matri);
                } catch (Exception ex) {
                    if (ex.getMessage().contains("Duplicate entry")) {
                        error = "Ya existe la matricula " + matri.getNombre_matricula();
                    } else {
                        error = "Error al insertar la matricula (" + ex.getMessage() + ")";
                        System.out.println("el error es " + error);
                        System.err.println(ex.getClass().getName() + " : " + ex.getMessage());
                    }
                }
            } else {
                error = "La descripcion no es correcta";
            }
        } else {
            error = "El nombre de la matricula no es correcto";
        }
        //Si no hay ningun error se dirige a una pagina o a otra   
        if (error == null) {
            mensaje = URLEncoder.encode("Se ha creado la matricula " + matri.getNombre_matricula(), "latin1");
            response.sendRedirect(response.encodeRedirectURL("gestionMatriculas.jsp?mensaje=" + mensaje));

            return;
        } else {

//            request.setAttribute("error", error);
//            getServletContext().getRequestDispatcher("/admin/insertarMatricula.jsp").forward(request, response);

            mensaje = URLEncoder.encode("Error en la matricula o descripcion ", "latin1");
            response.sendRedirect(response.encodeRedirectURL("insertarMatricula.jsp?mensaje=" + mensaje));

            return;
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
