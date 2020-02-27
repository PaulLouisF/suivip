import "bootstrap";
import Chart from "chart.js"

var ctx = document.getElementById('glucoseChart');

const cleanSet  = (newPoint) => {
  var values = JSON.parse(document.getElementById('essaiT').dataset.dates_enable);
  console.log(values);

  const result = values;
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
            },
            {
            label: 'Line Dataset',
            data: [{x: new Date("2020-02-29 08:03"), y: 70}, {x: new Date("2020-02-29 20:33"), y: 70}],
            type: 'line',
            fill: 2,

            // this dataset is drawn on top
            // order: 2
        },  {
            label: 'Line Dataset',
            data: [{x: new Date("2020-02-29 08:03"), y: 180}, {x: new Date("2020-02-29 20:33"), y: 180}],
            type: 'line',
            fill: false,

            // this dataset is drawn on top
            // order: 2
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
                      fontSize: 16,
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

const cleanTest = () => {
  var formatInPercent = function(x , adjustment) {
    console.log(adjustment);
      return (x*100/26).toFixed(2);
  };
  var values = cleanPieSet();
  var values1= values.map(formatInPercent);

  console.log(values1);
  return values1
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

          labels: [`<70mg/dL ${cleanTest()[0]}%`, `70-180 mg/dL ${cleanTest()[1]}%`, `>180 mg/dL ${cleanTest()[2]}%`],
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

