package classes;

import java.io.InputStream;


public class Evento {
    private int id;
    private String titulo;
    private String descripcion;
    private String fecha;
    private String horario;
    private String fechaPublicacion;
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
    
    public String getHorario() { return horario; }
    public void setHorario(String horario) { this.horario = horario; }
    
    public String getfechaPublicacion() { return fechaPublicacion; }
    public void setfechaPublicacion(String fechaPublicacion) { this.fechaPublicacion = fechaPublicacion; }
    
    public InputStream getFoto() { return foto; }
    public void setFoto(InputStream foto) {this.foto = foto; }
    
    public String getPath() { return path; }
    public void setPath(String path) { this.path = path; }

}
