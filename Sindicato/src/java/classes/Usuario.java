package classes;


public class Usuario {
    // Datos generales
    private String id;
    private String nombre;
    private String fecha_nacimiento;
    private String estado_civil;
    private String domicilio;
    private String tel;
    private String tel_2;
    private String email;
    private String sangre;
    private String grado;
    private String profesion;
    private String ocupacion;
    private String rfc;
    private String curp;
    private String nss;
    private String registro;
    
    // Datos laborales
    private String estatus;
    private String puesto;
    private String area;
    private String horario_1;
    private String horario_2;
    
    // Datos de referencia   
    private String ref_nombre;
    private String ref_tel;
    private String ref_domicilio;
    private String ref_parentesco;
    
    // Datos de beneficiario
    private String ben_nombre;
    private String ben_tel;
    private String ben_domicilio;
    private String ben_parentesco;
    
    
    public Usuario (){
        
    }
    
    /*
        Metodos datos personales
    */
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    
    public String getFechaNacimiento() { return fecha_nacimiento; }
    public void setFechaNacimiento(String fecha_nacimiento) { this.fecha_nacimiento = fecha_nacimiento; }
    
    public String getEstadoCivil() { return estado_civil; }
    public void setEstadoCivil(String estado_civil) { this.estado_civil = estado_civil; }
    
    public String getDomicilio() { return domicilio; }
    public void setDomicilio(String domicilio) { this.domicilio = domicilio; }
    
    public String getTel() { return tel; }
    public void setTel(String tel) { this.tel = tel; }
    
    public String getTel2() { return tel_2; }
    public void setTel2(String tel_2) { this.tel_2 = tel_2; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getSangre() { return sangre; }
    public void setSangre(String sangre) { this.sangre = sangre; }
    
    public String getGrado() { return grado; }
    public void setGrado(String grado) { this.grado = grado; }
    
    public String getProfesion() { return profesion; }
    public void setProfesion(String profesion) { this.profesion = profesion; }
    
    public String getOcupacion() { return ocupacion; }
    public void setOcupacion(String ocupacion) { this.ocupacion = ocupacion; }
    
    public String getRfc() { return rfc; }
    public void setRfc(String rfc) { this.rfc = rfc; }
    
    public String getCurp() { return curp; }
    public void setCurp(String curp) { this.curp = curp; }
    
    public String getNss() { return nss; }
    public void setNss(String nss) { this.nss = nss; }
    
    public String getRegistro() { return registro; }
    public void setRegistro(String registro) { this.registro = registro; }
    
    /*
        Metodos datos laborales
    */
    public String getEstatus() { return estatus; }
    public void setEstatus(String estatus) { this.estatus = estatus; }
    
    public String getPuesto() { return puesto; }
    public void setPuesto(String puesto) { this.puesto = puesto; }
    
    public String getArea() { return area; }
    public void setArea(String area) { this.area = area; }
    
    public String getHorario1() { return horario_1; }
    public void setHorario1(String horario_1) { this.horario_1 = horario_1; }
    
    public String getHorario2() { return horario_2; }
    public void setHorario2(String horario_2) { this.horario_2 = horario_2; }
    
    /*
        Metodos referencias familiares
    */ 
    public String getRefNombre() { return ref_nombre; }
    public void setRefNombre(String ref_nombre) { this.ref_nombre = ref_nombre; }
    
    public String getRefTel() { return ref_tel; }
    public void setRefTel(String ref_tel) { this.ref_tel = ref_tel; }
    
    public String getRefDomicilio() { return ref_domicilio; }
    public void setRefDomicilio(String ref_domicilio) { this.ref_domicilio = ref_domicilio; }
    
    public String getRefParentesco() { return ref_parentesco; }
    public void setRefParentesco(String ref_parentesco) { this.ref_parentesco = ref_parentesco; }
    
    /*
        Metodos beneficiario
    */
    public String getBenNombre() { return ben_nombre; }
    public void setBenNombre(String ben_nombre) { this.ben_nombre = ben_nombre; }
    
    public String getBenTel() { return ben_tel; }
    public void setBenTel(String ben_tel) { this.ben_tel = ben_tel; }
    
    public String getBenDomicilio() { return ben_domicilio; }
    public void setBenDomicilio(String ben_domicilio) { this.ben_domicilio = ben_domicilio; }
    
    public String getBenParentesco() { return ben_parentesco; }
    public void setBenParentesco(String ben_parentesco) { this.ben_parentesco = ben_parentesco; }
}
