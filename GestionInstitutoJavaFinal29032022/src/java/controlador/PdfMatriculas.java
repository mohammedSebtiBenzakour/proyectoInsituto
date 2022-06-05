/*
Servlet para mostrar el listado de matriculas por pdf
 */
package controlador;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.EvaluacionJpaController;
import entidades.Evaluacion;
import entidades.Matricula;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class PdfMatriculas extends HttpServlet {

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
        
            try {
            response.setContentType("application/pdf;charset=UTF-8");

            OutputStream out = response.getOutputStream();

            String error = null;
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("GestionInstitutoJavaFinalPU");
            EntityManager em = emf.createEntityManager();
            HttpSession sesion = request.getSession();

            int numColumnas = 5;
            int spacing = 3;
            int padding = 10;

            EvaluacionJpaController ejc = new EvaluacionJpaController(emf);
            List<Matricula> listaMatriculas = null;

            Query consultaM = em.createQuery("Select m From Matricula m");

            listaMatriculas = consultaM.getResultList();

            Document document = new Document(new Rectangle(1000, 600), 10, 10, 10, 10);
            PdfWriter.getInstance(document, out);
            document.open();
            Font fuente = new Font();
            fuente.setColor(0, 127,255);
            fuente.setSize(34);
            fuente.setFamily("COURIER");
            fuente.setStyle(1);
            fuente.setStyle(Font.BOLD | Font.UNDERLINE);
            Paragraph parrafo1 = new Paragraph("Listado de todos las matriculas", fuente);
            parrafo1.setAlignment(Paragraph.ALIGN_CENTER);
            parrafo1.setSpacingAfter(20);
            document.add(parrafo1);
            document.add(new Paragraph(" "));
            document.add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(numColumnas);
            int[] cellsWidth = {6, 15, 8, 6, 6};

            table.setWidths(cellsWidth);
            // Establecer la relación de tamaño de la tabla al documento
            table.setWidthPercentage(90);
            table.getDefaultCell().setPadding(padding);
            table.getDefaultCell().setBorderWidth(spacing);
            // Establecer texto de celda al centro
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

            table.getDefaultCell().setBackgroundColor(BaseColor.ORANGE);

            table.addCell(new Paragraph("Nombre Matricula"));
            table.addCell(new Paragraph("Descripción Matricula"));
            table.addCell(new Paragraph("Nombre Alumno"));
            table.addCell(new Paragraph("Nombre Materia"));
            table.addCell(new Paragraph("Fecha de creación"));

            table.setHeaderRows(1); // El final de la configuración del encabezado de la tabla indica que la primera fila pertenece al encabezado de la tabla
            table.getDefaultCell().setBorderWidth(2);

            for (Matricula mat : listaMatriculas) {

                // Establecer el color de fondo
                table.getDefaultCell().setBackgroundColor(BaseColor.LIGHT_GRAY);
                table.addCell(new Paragraph(mat.getNombre_matricula()));
                table.addCell(new Paragraph(mat.getDescripcion()));
                table.addCell(new Paragraph(mat.getAlumno().getNombre_alumno() + " " +mat.getAlumno().getPrimer_apellido_alumno() + " " + mat.getAlumno().getSegundo_apellido_alumno()));
                table.addCell(new Paragraph(mat.getNombre_materia().getMateria()));
                table.addCell(new Paragraph(mat.getCreado_el()));

            }

            document.add(table);
            parrafo1 = new Paragraph("Final de la lista", fuente);
            parrafo1.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(parrafo1);

            document.close();
            emf.close();

        } catch (DocumentException ex) {
            Logger.getLogger(Pdf.class.getName()).log(Level.SEVERE, null, ex);
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
