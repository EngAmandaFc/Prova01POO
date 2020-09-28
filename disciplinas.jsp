<%-- 
    Document   : disciplinas
    Created on : 28 de set de 2020, 15:58:45
    Author     : mandi
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatecpg.poo.Disciplina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Disciplina> usersList = (ArrayList)application.getAttribute("disciplinasList");
    if(disciplinasList == null){
        disciplinasList = new ArrayList<>();
        disciplinasList.add(new Disciplina("Amanda Fernandez Caetano","Banco de Dados","4 ciclo","8"));
        disciplinasList.add(new Disciplina("Amanda","Engenharia de Software III","4 ciclo","8"));
        disciplinasList.add(new Disciplina("Amanda","Programação Orientada a Objetos","4 ciclo","8"));
        disciplinasList.add(new Disciplina("Amanda","Linguagem de Programação IV","4 ciclo","8"));
        disciplinasList.add(new Disciplina("Amanda","Segurança da Informação","5 ciclo","8"));
        disciplinasList.add(new Disciplina("Amanda","Inglês IV","4 ciclo","8"));
        disciplinasList.add(new Disciplina("Amanda","Inglês V","5 ciclo","8"));
        disciplinasList.add(new Disciplina("Amanda","Sistemas Operacionais II","4 ciclo","8"));
        application.setAttribute("disciplinasList", usersList);
    }
    if(request.getParameter("add")!=null){
        String name = request.getParameter("name");
        String ementa = request.getParameter("ementa");
        String ciclo = request.getParameter("ciclo");
        String nota = request.getParameter("nota");
        disciplinasList.add(new Disciplina(name, ementa, ciclo, nota));
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("remove")!=null){
        int i = Integer.parseInt(request.getParameter("i"));
        disciplinasList.remove(i);
        response.sendRedirect(request.getRequestURI());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela de Disciplinas Cursadas</title>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/menu.jspf" %>
         <h2><a href="index.jsp">Voltar</a></h2>
        <form>
            Nome: <input type="text" name="name" />
            Disciplina: <input type="text" name="disciplina" />
            Ciclo: <input type="text" name="password" />
            Nota: <input type="number" name="nota" />
            <input type="submit" value="Adicionar" name="add" />
        </form>
        <hr/>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
                <th>Disciplina</th>
                <th>Ciclo</th>
                <th>Nota</th>
            </tr>
            <%for(int i=0; i<disciplinasList.size(); i++){%>
            <tr>
                <td><%= i %></td>
                <% Disciplina u = disciplinasList.get(i); %>
                <td><%= u.getName() %></td>
                <td><%= u.getNota() %></td>
                <td>
                    <form>
                        <input type="hidden" nota="i" value="<%= i %>"/>
                        <input type="submit" nota="remove" value="Remover"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
