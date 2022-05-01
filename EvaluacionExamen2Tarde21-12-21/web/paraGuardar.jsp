
<%--

<form>
            <table class='matriz'>
                <tr>
                    <%
                        for (int i = 0; i < a.getFilas(); i++) {
                    %>
                <tr>
                    <%
                        for (int j = 0; j < a.getColumnas(); j++) {
                    %>
                    <td class='der'>

                        <input type="number" name="i-j"  size="4">
                        <input type="hidden" name="i" value="<%= i  %>">
                        <input type="hidden" name="j" value="<%= j%>">


                    </td>
                    <%
                        }
                    %>
                </tr>
                <%
                    }

                %>
                </tr>


            </table>
            <br>
            <table class='matriz'>
                <tr>
                    <%                for (int k = 0; k < b.getFilas(); k++) {
                    %>
                <tr>
                    <%
                        for (int f = 0; f < b.getColumnas(); f++) {
                    %>
                    <td class='der'>

                        <input type="number" name="k-f" size="4">
                        <input type="hidden" name="k" value="<%= k%>">
                        <input type="hidden" name="f" value="<%= f%>">


                    </td>
                    <%
                        }
                    %>
                </tr>
                <%
                    }
                    
                %>
                <%= a.multiplicar(b)%>
                  }
                <%
                    
   </tr>
            </table>
   

--%>