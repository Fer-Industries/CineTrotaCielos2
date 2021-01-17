package mx.com.cinema.entities;

public class EmpleadoBean {
	private String    idEmpleado;
	private String nombre;
	private String aPaterno;
	private String aMaterno;
	private String birthday;
	private String area;
	private float  salario;
	private int    status;
	private String contrasena;
	private String administrador;
	private int id;
	
	public EmpleadoBean(String id,String contrasena) {
		this.idEmpleado=id;
		this.contrasena=contrasena;
		
	}

	public EmpleadoBean() {
		
	}
public EmpleadoBean() {

		
	}
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIdEmpleado() {
		return idEmpleado;
	}

	public void setIdEmpleado(String idEmpleado) {
		this.idEmpleado = idEmpleado;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getaPaterno() {
		return aPaterno;
	}

	public void setaPaterno(String aPaterno) {
		this.aPaterno = aPaterno;
	}

	public String getaMaterno() {
		return aMaterno;
	}

	public void setaMaterno(String aMaterno) {
		this.aMaterno = aMaterno;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public float getSalario() {
		return salario;
	}

	public void setSalario(float salario) {
		this.salario = salario;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getAdministrador() {
		return administrador;
	}

	public void setAdministrador(String administrador) {
		this.administrador = administrador;
	}

	@Override
	public String toString() {
		return "EmpleadoBean [idEmpleado=" + idEmpleado + ", nombre=" + nombre + ", aPaterno=" + aPaterno
				+ ", aMaterno=" + aMaterno + ", birthday=" + birthday + ", area=" + area + ", salario=" + salario
				+ ", status=" + status + ", contrasena=" + contrasena + ", administrador=" + administrador + "]";
	}

	
	
	
}
