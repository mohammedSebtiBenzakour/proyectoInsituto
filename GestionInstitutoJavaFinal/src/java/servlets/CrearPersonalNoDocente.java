/*
 Servlet crearPersonalNoDocente
 */
package servlets;

import dao.Departamento_institutoJpaController;
import dao.PerfilesJpaController;
import dao.Personal_no_docenteJpaController;
import dao.Registrar_alumnosJpaController;
import entidades.Departamento_instituto;
import entidades.Nivel_instituto;
import entidades.Perfiles;
import entidades.Personal_no_docente;
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
public class CrearPersonalNoDocente extends HttpServlet {

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

        Personal_no_docenteJpaController pndjc = new Personal_no_docenteJpaController(emf);

        String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        
        Personal_no_docente pnd = new Personal_no_docente();
       
        for (int i = 1; i < 10; i++) {
            Random r = new Random();

            pnd.setDni("123"+i);
            pnd.setApellidos("Sebti"+i);
            pnd.setCiudad("Sevilla");
            pnd.setClave("x"+i);
            
            Departamento_institutoJpaController dijc = new Departamento_institutoJpaController(emf);
            List<Departamento_instituto> listaDepartamentos = dijc.findDepartamento_institutoEntities();
            int rd = r.nextInt(listaDepartamentos.size());
            pnd.setDepartamento(listaDepartamentos.get(rd));
            
            pnd.setDireccion("Gines");
            pnd.setEmail("a"+i+"@b.fr");
                        
            String fechaR = "2022-02-0" + i;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date d = sdf.parse(fechaR);
                pnd.setFecha(d);
            } catch (ParseException ex) {
                Logger.getLogger(CrearUsuarios.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            pnd.setFecha_registro(timeStamp);
            pnd.setNombre("mohamed"+i);
            pnd.setPais("España");
            pnd.setTelefono("65432198"+i);
            pnd.setUsuario("x"+i);
            
            PerfilesJpaController pjc = new PerfilesJpaController(emf);
            List<Perfiles> listaPerfiles = pjc.findPerfilesEntities();
            pnd.setPerfil(listaPerfiles.get(4));

           
            try {
                pndjc.create(pnd);
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
            out.println("<title>Servlet CrearPersonalNoDocente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearPersonalNoDocente at " + request.getContextPath() + "</h1>");
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
