<%-- 
    Document   : usuario
    Created on : 30/10/2016, 00:58:03
    Author     : willian.carvalho
--%>

<%@page import="br.sp.senac.programeros.connection.Senhas"%>
<%@page import="java.util.List"%>
<%@page import="br.sp.senac.programeros.dao.UsuarioDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.sp.senac.programeros.connection.ConexaoBD"%>
<%@page import="br.sp.senac.programeros.model.Usuario"%>
<html>
    <head>
        <title>Usu�rios do SGF</title>    
    </head>
    <body>
        <h1>Lista de Usu�rios</h1>
        <button onclick= "window.location.href = 'adicionarUsuario.jsp'">Adicionar</button>
        <button onclick= "window.location.href = 'menu.jsp'">Sair</button>
        <hr />
        
        <%
            ConexaoBD conn = new ConexaoBD();
            Connection conexao = conn.obterConexao();
            
            UsuarioDAO dao = new UsuarioDAO(conexao);
            
            List<Usuario> usuario = dao.listarUsuarios();
            
            conn.fecharConexao();

        %>
        
        <table id="tblUsuarios" border="1" cellPadding ="5">         
            <tr>
                <th>Codigo</th>
                <th>Login</th>
                <th>Nome</th>
                <th>Senha</th>
            </tr>
            
            <% for(Usuario c:usuario){
            %>
            <tr>
                <td><%= c.getCodigo()%></td>
                <td><%= c.getLogin()%></td>
                <td><%= c.getNome() %></td>
                <td><%= "********" %></td>
                </td>
                <td> <a href="ExcluirUsuario?id=<%=c.getCodigo()%>">Excluir</a></td>
                <td> <a href="AlterarUsuario?id=<%=c.getCodigo()%>&nome=<%=c.getNome() %>
                        &login=<%= c.getLogin()%>&senha=<%= c.getSenha() %>">
                        Alterar</a></td>
            </tr>              
            <%} %>

        </table>     
    </body>
</html>
