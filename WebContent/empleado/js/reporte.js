Swal.fire('Espere por favor');
Swal.showLoading();

$.get("/Cinema/empleado/EmpleadoController",function(response){
	let empleadosEncontrados = response;
	empleadosEncontrados.forEach(empleado =>{
		$("#selectEmpleado").append(
			"<option value='"+empleado.id+"'>"+empleado.nombre+"</option>"	
		);
	});
	Swal.close();
});

document.getElementById("btnBuscar").addEventListener("click",()=>{
	Swal.fire('Espere por favor');
	Swal.showLoading();
	let idEmpleado = document.getElementById("selectEmpleado").value;
	$.get("/Cinema/empleado/ReporteController?idEmpleado="+idEmpleado,function(response){
		console.log(response);
		var arregloData = [];
		var arregloFechas = [];
		for(var i =5;i>=0;i--){
			arregloData.push(response[i].numeroVentas);
			arregloFechas.push(response[i].fecha);
		}
		/*response.forEach(info=>{
			arregloData.push(info.numeroVentas);
			arregloFechas.push(info.fecha);
		});*/
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: arregloFechas,
		        datasets: [{
		            label: 'Numero de ventas ',
		            //data: [12, 25, 3, 5, 2, 3],
		            data: arregloData,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero: true
		                }
		            }]
		        }
		    }
		});
		Swal.close();
	});
});

