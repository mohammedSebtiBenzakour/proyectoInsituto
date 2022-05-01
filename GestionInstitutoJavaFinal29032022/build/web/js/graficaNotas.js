/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




Highcharts.chart('container', {
  chart: {
    type: 'cylinder',
    options3d: {
      enabled: true,
      alpha: 15,
      beta: 15,
      depth: 50,
      viewDistance: 25
    }
  },
  title: {
    text: 'Listado de todas las notas'
  },
    xAxis: {
    categories: etiquetas,
    labels: {
      skew3d: true,
      style: {
        fontSize: '16px'
      }
    }
  },
  plotOptions: {
    series: {
      depth: 25,
      colorByPoint: true
    }
  },
  series: [{
    data: valores,
    name: 'Notas por alumno',
    showInLegend: true
  }]
});