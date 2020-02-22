import "bootstrap";
import Chart from "chart.js"

var ctx = document.getElementById('glucoseChart');

const cleanSet  = () => {
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
  const reloadGraph = () => {
    var glucoseChart = new Chart(ctx, {
        type: 'scatter',
        data: {
            datasets: [{
                label: 'Glycémies',
                data: cleanSet(),
                pointRadius: 4,
                pointBackgroundColor: 'red',
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    type: 'time',
                    time: {
                       unit: 'hour',
                       displayFormats: {
                            quarter: 'h:mm a'
                        }
                    },
                    position: 'bottom'
                }]
            }
        }
    });

    // console.log(glucoseChart.data.datasets);

    // var datat = {x: new Date ('2020-2-29 8:00'), y: 700};
    // console.log(datat);

    // const updateGraph = () => {
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

  }
  reloadGraph();







  // window.MyLib = {};
  // MyLib.reloadGraph = reloadGraph;
}

