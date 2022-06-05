/*
Servlet para subir imagenes al servidor
 */
package controlador;

import com.github.sarxos.webcam.Webcam;
import java.awt.Dimension;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.ImageIcon;
import javax.swing.JLabel;

/**
 *
 * @author daw2
 */
public class SubirImagen extends HttpServlet {

    Webcam webcam;
    boolean isRunning = false;
    JLabel imagen;

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
        int longitudMaxima = Integer.parseInt(getInitParameter("longitudMaxima"));
//Creo una variable dandole o estableciendo la longitud maxima del fichero a subir al servidor
        String error = null;
        String mensaje = null;
        Timestamp resultado = null;
        HttpSession sesion = request.getSession();

//Obtengo el fichero subir por el input file
        Part imagen = request.getPart("imagen");
//Valido el tamaño del fichero que se va a subir al servidor
        if (imagen.getSize() > longitudMaxima) {
            throw new IllegalArgumentException("Tamaño de fichero demasiado grande EL tamaño maximo es " + longitudMaxima);

        }
//Obtengo el nombre del fichero 
        String nombreFichero = imagen.getSubmittedFileName();
        InputStream datosFichero = imagen.getInputStream();
        byte[] bytes = new byte[12048];

        System.out.println("nombre fichero " + nombreFichero);

        //hacer copia del fichero a subir en el servidor
        //el path del directorio
        String path = getServletContext().getRealPath("imagenes");
        //el path del fichero
        FileOutputStream fos = new FileOutputStream(path + "/" + nombreFichero);

        while (datosFichero.available() > 0) {
            int longitud = datosFichero.read(bytes);
            fos.write(bytes, 0, longitud);
        }

        fos.close();

        datosFichero.close();
        
        if (error == null) {
            mensaje = URLEncoder.encode("Se ha cuardado la imagen subida correctamente", "latin1");
            response.sendRedirect(response.encodeRedirectURL("insertarImagenes.jsp?mensaje=" + mensaje));
            return;
        } else {

            request.setAttribute("error", error);
            getServletContext().getRequestDispatcher("insertarImagenes.jsp").forward(request, response);
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
