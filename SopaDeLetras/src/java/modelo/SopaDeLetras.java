/*
 Bean  SopaDELEtras
 
 */
package modelo;

import java.util.Random;

/**
 *
 * @author daw44
 */
public class SopaDeLetras {

    private char[][] letras;
    private char[][] letrasColor;

    public SopaDeLetras() {
        this(10, 10);

    }

    public SopaDeLetras(int filas, int columnas) {
        letras = new char[filas][columnas];
        for (int i = 0; i < letras.length; i++) {
            for (int j = 0; j < letras[i].length; j++) {
                letras[i][j] = '?';
            }
        }
        letrasColor = new char[filas][columnas];
        for (int i = 0; i < letrasColor.length; i++) {
            for (int j = 0; j < letrasColor[i].length; j++) {
                letrasColor[i][j] = '?';
            }
        }
    }

    public void rellenarLetras() {
//        String setOfCharacters = "abcdefghxyz1234567-/@";

        Random random = new Random();
        String caracter = "abcdefghijklmnopqrstuvwxyz";

        for (int i = 0; i < letras.length; i++) {
            for (int j = 0; j < letras[i].length; j++) {
                if (letras[i][j] == '?') {
                    int randomInt = random.nextInt(caracter.length());
                    char caracterAleatorio = caracter.charAt(randomInt);
                    letras[i][j] = caracterAleatorio;
                }

            }
        }
    }

    public void rellenar() {
        for (int fila = 0; fila < letras.length; fila++) {
            for (int columna = 0; columna < letras[fila].length; columna++) {
                if (letras[fila][columna] == '?') {
                    letras[fila][columna] = (char) ('a' + (Math.random() * ('z' - 'a' + 1)));
                }

            }
        }
    }

    public boolean comprobarEspacio(String palabra, int fila, int columna, Direccion direccion) {
        switch (direccion) {
            case DERECHA:
                for (int pos = 0; pos < palabra.length(); pos++) { // comprobar que no pise la palabra y la letra
                    if (letras[fila][columna + pos] != '?' && letras[fila][columna + pos] != palabra.charAt(pos)) {
                        return false;
                    }
                }
                break;
            case IZQUIERDA:
                for (int pos = 0; pos < palabra.length(); pos++) {
                    if (letras[fila][columna - pos] != '?' && letras[fila][columna - pos] != palabra.charAt(pos)) {
                        return false;
                    }
                }
                break;
            case ABAJO:
                for (int pos = 0; pos < palabra.length(); pos++) {
                    if (letras[fila + pos][columna] != '?' && letras[fila + pos][columna] != palabra.charAt(pos)) {
                        return false;
                    }
                }
                break;
            case ARRIBA:
                for (int pos = 0; pos < palabra.length(); pos++) {
                    if (letras[fila - pos][columna] != '?' && letras[fila - pos][columna] != palabra.charAt(pos)) {
                        return false;
                    }
                }

                break;
            case DERECHA_ABAJO:
                for (int pos = 0; pos < palabra.length(); pos++) {
                    if (letras[fila + pos][columna + pos] != '?' && letras[fila + pos][columna + pos] != palabra.charAt(pos)) {
                        return false;
                    }
                }
                break;
            case DERECHA_ARRIBA:
                for (int pos = 0; pos < palabra.length(); pos++) {
                    if (letras[fila - pos][columna + pos] != '?' && letras[fila - pos][columna + pos] != palabra.charAt(pos)) {
                        return false;
                    }
                }
                break;
            case IZQUIERDA_ABAJO:
                for (int pos = 0; pos < palabra.length(); pos++) {
                    if (letras[fila + pos][columna - pos] != '?' && letras[fila + pos][columna - pos] != palabra.charAt(pos)) {
                        return false;
                    }
                }
                break;
            case IZQUIERDA_ARRIBA:
                for (int pos = 0; pos < palabra.length(); pos++) {
                    if (letras[fila - pos][columna - pos] != '?' && letras[fila - pos][columna - pos] != palabra.charAt(pos)) {
                        return false;
                    }
                }
                break;
        }

        return true;
    }

    public void insertarPalabra(String palabra, Direccion direccion) {
        int fila, columna;
        int intentos = 0;
        final int maxIntentos = 1000;
        switch (direccion) {
            case DERECHA:
                if (palabra.length() > letras[0].length) {
                    throw new IllegalArgumentException("La palabra  no cabe en la fila");
                }
                // buscamos una posicion aleatoria que no pise otra palabra
                do {
                    fila = (int) (Math.random() * letras.length);

                    columna = (int) Math.random() * (letras[fila].length - palabra.length() + 1);
                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra

                if (intentos < maxIntentos) {
                    for (int pos = 0; pos < palabra.length(); pos++) {
                        letras[fila][columna + pos] = palabra.charAt(pos);
                        letrasColor[fila][columna + pos] = palabra.charAt(pos);
                    }
                }

                break;
            case IZQUIERDA:
                if (palabra.length() > letras[0].length) {
                    throw new IllegalArgumentException("La palabra  no cabe en la fila");
                }
                do {
                    fila = (int) (Math.random() * letras.length);
                    int length = letras[fila].length;
                    columna = length - 1 - ((int) (Math.random() * palabra.length() + 1));
                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                if (intentos < maxIntentos) {
                    for (int pos = 0; pos < palabra.length(); pos++) {
                        letras[fila][columna - pos] = palabra.charAt(pos);
                        letrasColor[fila][columna - pos] = palabra.charAt(pos);
                    }
                }
                break;
            case ARRIBA:
                if (palabra.length() > letras.length) {
                    throw new IllegalArgumentException("La palabra  no cabe en la columna");
                }
                do {
                    columna = (int) (Math.random() * letras[0].length);
                    int length = letras.length;
                    fila = length - 1 - ((int) (Math.random() * (length - palabra.length() + 1)));
                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                if (intentos < maxIntentos) {
                    for (int pos = 0; pos < palabra.length(); pos++) {
                        letras[fila - pos][columna] = palabra.charAt(pos);
                        letrasColor[fila - pos][columna] = palabra.charAt(pos);
                    }
                }

                break;
            case ABAJO:
                if (palabra.length() > letras.length) {
                    throw new IllegalArgumentException("La palabra  no cabe en la columna");
                }
                // buscamos una posicion aleatoria que no pise otra palabra
                do {
                    columna = (int) (Math.random() * letras[0].length);

                    fila = (int) Math.random() * (letras.length - palabra.length() + 1);
                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra

                if (intentos < maxIntentos) {
                    for (int pos = 0; pos < palabra.length(); pos++) {
                        letras[fila + pos][columna] = palabra.charAt(pos);
                        letrasColor[fila + pos][columna] = palabra.charAt(pos);
                    }
                }

                break;
            case DERECHA_ABAJO: //
                if (palabra.length() > letras.length || palabra.length() > letras.length) {
                    throw new IllegalArgumentException("La palabra  no cabe en la columna y fila");
                }
                // buscamos una posicion aleatoria que no pise otra palabra
                System.out.println("derecha abajo");
                do {

                    fila = (int) (Math.random() * (letras.length - palabra.length() + 1));
                    columna = (int) (Math.random() * (letras[fila].length - palabra.length() + 1));

                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra
                System.out.println("intentos " + intentos);
                if (intentos < maxIntentos) {
                    for (int pos = 0; pos < palabra.length(); pos++) {
                        letras[fila + pos][columna + pos] = palabra.charAt(pos);
                        letrasColor[fila + pos][columna + pos] = palabra.charAt(pos);
                    }
                }

                break;
            case DERECHA_ARRIBA: //
                if (palabra.length() > letras.length) {
                    throw new IllegalArgumentException("La palabra  no cabe en la columna y fila");
                }
                // buscamos una posicion aleatoria que no pise otra palabra
                do {

                    int length = letras.length;
                    fila = length - 1 - ((int) (Math.random() * (length - palabra.length() + 1)));
                    columna = (int) (Math.random() * (letras[fila].length - palabra.length() + 1));

                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra

                if (intentos < maxIntentos) {
                    for (int pos = 0; pos < palabra.length(); pos++) {
                        letras[fila - pos][columna + pos] = palabra.charAt(pos);
                        letrasColor[fila - pos][columna + pos] = palabra.charAt(pos);
                    }
                }

                break;
            case IZQUIERDA_ABAJO: //
                if (palabra.length() > letras.length) {
                    throw new IllegalArgumentException("La palabra  no cabe en la columna y fila");
                }
                // buscamos una posicion aleatoria que no pise otra palabra
                System.out.println("IZQUIERDA_ABAJO");
                do {
                    fila = (int) (Math.random() * (letras.length - palabra.length() + 1));
                    int cLength = letras[0].length;
                    columna = cLength - 1 - ((int) (Math.random() * (cLength - palabra.length() + 1)));

                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra
                System.out.println("intentos " + intentos);
                if (intentos < maxIntentos) {
                    for (int pos = 0; pos < palabra.length(); pos++) {
                        letras[fila + pos][columna - pos] = palabra.charAt(pos);
                        letrasColor[fila + pos][columna - pos] = palabra.charAt(pos);
                    }
                }
                break;
            case IZQUIERDA_ARRIBA: //
                if (palabra.length() > letras.length) {
                    throw new IllegalArgumentException("La palabra  no cabe en la columna y fila");
                }
                // buscamos una posicion aleatoria que no pise otra palabra
                do {
                    int fLength = letras.length;
                    int cLength = letras[0].length;

                    columna = cLength - 1 - ((int) (Math.random() * (cLength - palabra.length() + 1)));
                    fila = fLength - 1 - ((int) (Math.random() * (fLength - palabra.length() + 1)));

                    intentos++;
                } while (!comprobarEspacio(palabra, fila, columna, direccion) && intentos < maxIntentos);
                // colocamos la palabra

                if (intentos < maxIntentos) {
                    for (int pos = 0; pos < palabra.length(); pos++) {
                        letras[fila - pos][columna - pos] = palabra.charAt(pos);
                        letrasColor[fila - pos][columna - pos] = palabra.charAt(pos);
                    }
                }

                break;

        }

    }

    public char[][] getLetras() {
        return letras;
    }
      public char[][] getLetrasColor() {
        return letrasColor;
    }

}
