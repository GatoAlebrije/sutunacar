package classes;

import java.sql.Date;

public class Asamblea {
    private int id;
    private String titulo;
    private String descripcion;
    private String tipo;
    private Date fecha;
    private String hora_entrada;
    private String hora_salida;
    private String lugar;
    private String observaciones;
    
    private String minutaID;
    private String path;
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
    
    public Date getFecha() { return fecha; }
    public void setFecha(Date fecha) { this.fecha = fecha; }
    
    public String getHoraEntrada() { return hora_entrada; }
    public void setHorarioEntrada(String hora) { this.hora_entrada = hora; }
    
    public String getHoraSalida() { return hora_salida; }
    public void setHorarioSalida(String hora) { this.hora_salida = hora; }
    
    public String getLugar() { return lugar; }
    public void setLugar(String lugar) { this.lugar = lugar; }
    public String getObservaciones() { return observaciones; }
    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }
    
    public String getMinutaID() { return minutaID; }
    public void setMinutaID(String id) { this.minutaID = id; }
    
    public String getPath() { return path; }
    public void setPath(String path) { this.path = path; }

}
