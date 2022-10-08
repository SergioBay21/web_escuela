/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author sergi
 */
public class estudiante extends persona {
    private int id_sangre;
    private String carne;
    private Conexion cn;
    public estudiante(){}
    

    public estudiante(int id_sangre, String carne) {
        this.id_sangre = id_sangre;
        this.carne = carne;
    }

    public estudiante(int id_sangre, String carne, int id, String nombres, String apellidos, String direccion, String telefono, String email, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, email, fecha_nacimiento);
        this.id_sangre = id_sangre;
        this.carne = carne;
    }
    

    public int getId_sangre() {
        return id_sangre;
    }

    public void setId_sangre(int id_sangre) {
        this.id_sangre = id_sangre;
    }

    public String getCarne() {
        return carne;
    }

    public void setCarne(String carne) {
        this.carne = carne;
    }
    public HashMap drop_sangre(){
        HashMap <String, String> drop = new HashMap();
        try {
            cn = new Conexion();
            String query = "SELECT id_tipo_sangre as id_tipo_sangre,tipo_sangre FROM tipos_sangre;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()){
                drop.put(consulta.getString("id_tipo_sangre"), consulta.getString("tipo_sangre"));
            }
            cn.cerrar_conexion();
        
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return drop;
    }
    public DefaultTableModel leer(){
    DefaultTableModel tabla = new DefaultTableModel();
    try{
        cn = new Conexion();
        cn.abrir_conexion();
        String query = "SELECT e.id_estudiantes as id,e.carnet,e.nombres,e.apellidos,e.direccion,e.telefono,e.email,e.id_tipo_sangre,p.tipo_sangre,e.fecha_nacimiento FROM estudiantes as e inner join tipos_sangre as p on e.id_tipo_sangre = p.id_tipo_sangre;";
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        String encabezado[] = {"id", "carnet","nombres","apellidos","direccion", "telefono", "email", "idtipo", "tipo","nacimiento"};
        tabla.setColumnIdentifiers(encabezado);
        String datos[]= new String[10];
        while (consulta.next()){
        datos[0]= consulta.getString("id");
        datos[1]= consulta.getString("carnet");
        datos[2]= consulta.getString("nombres");
        datos[3]= consulta.getString("apellidos");
        datos[4]= consulta.getString("direccion");
        datos[5]= consulta.getString("telefono");
        datos[6]= consulta.getString("email");
        datos[7]= consulta.getString("id_tipo_sangre");
        datos[8]= consulta.getString("tipo_sangre");
        datos[9]= consulta.getString("fecha_nacimiento");
        tabla.addRow(datos);
        }
        
        cn.cerrar_conexion();
    
    }catch(Exception ex){
        System.out.println(ex.getMessage());
    }
    return tabla;
    }
    @Override
    public int agregar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query="INSERT INTO estudiantes(carnet,nombres,apellidos,direccion,telefono,email,id_tipo_sangre,fecha_nacimiento) VALUES(?,?,?,?,?,?,?,?);";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, this.getCarne());
        parametro.setString(2, this.getNombres());
        parametro.setString(3, this.getApellidos());
        parametro.setString(4, this.getDireccion());
        parametro.setString(5, this.getTelefono());
        parametro.setString(6, this.getEmail());
        parametro.setInt(7, this.getId_sangre());
        parametro.setString(8, this.getFecha_nacimiento());
        
        retorno = parametro.executeUpdate();
        cn.cerrar_conexion();
    
    }catch(Exception ex){
    System.out.println(ex.getMessage());
    retorno = 0;
    }
    return retorno;
    }
    public int modificar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query="update estudiantes set carnet=?,nombres=?,apellidos=?,direccion=?,telefono=?,email=?,id_tipo_sangre=?,fecha_nacimiento=? where id_estudiantes = ?;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setString(1, this.getCarne());
        parametro.setString(2, this.getNombres());
        parametro.setString(3, this.getApellidos());
        parametro.setString(4, this.getDireccion());
        parametro.setString(5, this.getTelefono());
        parametro.setString(6, this.getEmail());
        parametro.setInt(7, this.getId_sangre());
        parametro.setString(8, this.getFecha_nacimiento());
        parametro.setInt(9, this.getId());
        
        retorno = parametro.executeUpdate();
        cn.cerrar_conexion();
    
    }catch(Exception ex){
    System.out.println(ex.getMessage());
    retorno = 0;
    }
    return retorno;
    }
    public int eliminar(){
        int retorno = 0;
    try{
        PreparedStatement parametro;
        cn = new Conexion();
        String query="delete from estudiantes where id_estudiantes = ?;";
        cn.abrir_conexion();
        parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
        parametro.setInt(1, this.getId());
        retorno = parametro.executeUpdate();
        cn.cerrar_conexion();
    
    }catch(Exception ex){
    System.out.println(ex.getMessage());
    retorno = 0;
    }
    return retorno;
    }
}
