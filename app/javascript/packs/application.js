import "bootstrap";
import Chart from "chart.js"

var ctx = document.getElementById('glucoseChart');

const cleanSet  = (newPoint) => {
  var values = JSON.parse(document.getElementById('essaiT').dataset.dates_enable);
  console.log(values);


  const minDate = "2020-01-01";
  const maxDate = "2020-02-14";
  const result = filterByDates(values, minDate, maxDate);
  // const result = values.filter(element => element.x > '2020-01-01' && element.x < '2020-01-04');

  function filterByDates(arrayOfGL, a, b) {
    return arrayOfGL.filter(element => element.x > a && element.x < b);
  };

  // formatage de la donnée pour scatter graph
  result.map((element) => {
    var testdate = new Date(element.x);
    element.x = formattagedesdate(testdate);
  });

  function formattagedesdate(a) {
    a.setFullYear(2020);
    a.setMonth(1);
    a.setDate(29);
    return a
  };

  console.log(result);
  return result
};


if (ctx) {
  const reloadGraph = (newPoint) => {
    var glucoseChart = new Chart(ctx, {
        type: 'scatter',
        data: {
            datasets: [{
                // label: 'Glycémies',
                data: cleanSet(3),
                pointRadius: 4,
                pointBackgroundColor: 'blue',
            }]
        },
        options: {
          legend: {position: 'bottom', display: false},
            scales: {
                xAxes: [{
                    type: 'time',
                    scaleLabel: {
                      display: true,
                      labelString: 'Heures',
                      fontSize: 16
                    },

                    time: {
                       unit: 'hour',
                       displayFormats: {
                            quarter: 'h:mm a'
                        }
                    },
                    position: 'bottom'
                }],
                yAxes: [{
                  ticks: {
                    beginAtZero: true
                  },
                  scaleLabel: {
                      display: true,
                      labelString: 'Glycémies (mg/dL)',
                      fontSize: 16
                    },
                }]
            }
        }
    });
  }

    // reloadGraph();

    // console.log(glucoseChart.data.datasets);

    // var datat = {x: new Date ('2020-2-29 23:58'), y: 700};
    // console.log(datat);

    // // const updateGraph = () => {
    //   glucoseChart.data.labels.push('hello');
    //   console.log("toto1");

    //   glucoseChart.data.datasets.forEach((dataset) => {
    //       dataset.data.push(datat);
    //   });
    //   console.log("hola");
    //   console.log(glucoseChart);
    //   glucoseChart.update();
    //   console.log("ok");
    // }

    // updateGraph();


  reloadGraph();


  window.MyLib = {};
  MyLib.reloadGraph = reloadGraph();
}





var cty = document.getElementById('glucosePieChart');


const cleanPieSet  = (newPoint) => {
  var values = JSON.parse(document.getElementById('essaiT').dataset.dates_enable);

  const result1 = values.filter(element => element.y < 70).length;
  const result2 = values.filter(element => element.y > 70 && element.y < 180).length;
  const result3 = values.filter(element => element.y > 180).length;

  var glucoseBreakDown = [result1, result2, result3];




  return glucoseBreakDown
};


if (cty) {
  const reloadPieGraph = (newPoint) => {


    var myDoughnutChart = new Chart(cty, {
        type: 'doughnut',
        data: {
          datasets: [{
            data: cleanPieSet(),
            backgroundColor: ["#0074D9", "#FF4136", "#2ECC40"]
          }],
    // These labels appear in the legend and in the tooltips when hovering different arcs
          position: 'bottom',
          labels: ['<70mg/dL', '70-180 mg/dL', '>180 mg/dL'],
        },
        options: {
          legend: {position: 'bottom'}
        }
      });
    }
  reloadPieGraph();
  // window.MyLib = {};
  // MyLib.reloadPieGraph = reloadPieGraph();
}

