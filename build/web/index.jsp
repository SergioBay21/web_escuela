<%-- 
    Document   : index
    Created on : 7/10/2022, 08:50:16 AM
    Author     : sergi
--%>
<%@page import="modelo.estudiante" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiantes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
    </head>
    <body>
        <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Carne</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Direccion</th>
                <th scope="col">Telefono</th>
                <th scope="col">Correo Eletronico</th>
                <th scope="col">Id tipo de sangre</th>
                <th scope="col">Tipo de Sangre</th>
                <th scope="col">Fecha de Nacimiento</th>
                
              </tr>
            </thead>
            <tbody id="tbl_estudiantes">
                <%
                estudiante Estudiante = new estudiante();
                DefaultTableModel tabla = new DefaultTableModel();
                tabla = Estudiante.leer();
                for (int t =0;t<tabla.getRowCount();t++){
                    out.println("<tr data-id="+ tabla.getValueAt(t, 0) +" >");
                    out.println("<td>"+ tabla.getValueAt(t, 0) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 5) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 7) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 8) +"</td>");
                    out.println("<td>"+ tabla.getValueAt(t, 9) +"</td>");
                    out.println("</tr>");
                    }
                %>
            </tbody>
          </table>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal_estudiantes">
      Ingresar Estudiantes
    </button>
        <form action="sr_estudiantes" method="post">
    <div class="modal fade" id="modal_estudiantes" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Datos del Estudiante</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <input class="form-control" name="id" type="text" value="0" aria-label="id" readonly>
            <label for="carne" class="form-label">Carne</label>
            <input class="form-control" name="carne" type="text" placeholder="E001" aria-label="Carne">
            <label for="nombres" class="form-label">Nombres</label>
            <input class="form-control" name="nombres" type="text" aria-label="nombres">
            <label for="apellidos" class="form-label">Apellidos</label>
            <input class="form-control" name="apellidos" type="text" aria-label="apellidos">
            <label for="direccion" class="form-label">Direccion</label>
            <input class="form-control" name="direccion" type="text" aria-label="direccion">
            <label for="telefono" class="form-label">Telefono</label>
            <input class="form-control" name="telefono" type="tel" aria-label="telefono">
            <label for="email" class="form-label">Correo Electronico</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="nombre@example.com">
            <label for="tipo_s" class="form-label">Tipo de Sangre</label>
            <select class="form-select form-select-lg mb-3" name="select_sangre" aria-label="tipo_sangre">
            <%
            HashMap<String,String> drop = Estudiante.drop_sangre();
            for (String i: drop.keySet()){
            out.println("<option value='"+ i +"'>" +drop.get(i)+ "</option>");
                }
            %>
            </select>
            <label for="direccion" class="form-label">Fecha Nacimiento</label>
            <input class="form-control" name="fn" type="date" aria-label="fn" placeholder="2022-01-01">
            <button class="btn btn-info" name="btn_agregar" id="btn_agregar" value="agregar">Agregar</button>
            <button class="btn btn-primary" id="btn_modificar" value="modificar">Modificar</button>
            <button class="btn btn-danger" id="btn_eliminar" value ="eliminar" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
</div>
</div>
          </div>
          <div class="modal-footer">
            
            <button type="button" class="btn btn-danger">Salir</button>
          </div>
        </div>
      </div>
            </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script type="text/javascript">
             function limpiar(){
                $("#id").val(0);
                $("#carnet").val('');
                $("#nombres").val('');
                $("#apellidos").val('');
                $("#direccion").val('');
                $("#telefono").val('');
                $("#email").val('');
                $("#select_sangre").val(1);
                $("#fn").val('');
    }
            $('#tbl_estudiantes').on('click','tr td',function(evt){
            var target,id,carnet,nombres,apellidos,direccion,telefono,email,id_sangre,fn;
            target = $(event.target);
            id = target.parent().data('id').eq(0).html();
            carnet = target.parent("tr").find("td").eq(1).html();
            nombres = target.parent("tr").find("td").eq(2).html();
            apellidos = target.parent("tr").find("td").eq(3).html();
            direccion = target.parent("tr").find("td").eq(4).html();
            telefono = target.parent("tr").find("td").eq(5).html();
            email = target.parent("tr").find("td").eq(6).html();
            id_sangre = target.parent("tr").find("td").eq(7).html();
            fn = target.parent("tr").find("td").eq(8).html();
            $("#id").val(id);
            $("#carnet").val(carnet);
            $("#nombres").val(nombres);
            $("#apellidos").val(apellidos);
            $("#direccion").val(direccion);
            $("#telefono").val(telefono);
            $("#email").val(email);
            $("#select_sangre").val(id_sangre);
            $("#fn").val(fn);
            $("#modal_estudiantes").modal('show');
        }
    </script>
    </body>
</html>
