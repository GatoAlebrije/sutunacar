package classes;

import java.io.InputStream;

public class Noticia {
    private int id;
    private String titulo;
    private String descripcion;
    private String fecha;
    private InputStream foto;
    private String path;
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    
    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }
    
    public InputStream getFoto() { return foto; }
    public void setFoto(InputStream foto) {this.foto = foto; }
    
    public String getPath() { return path; }
    public void setPath(String path) {this.path = path; }

}
