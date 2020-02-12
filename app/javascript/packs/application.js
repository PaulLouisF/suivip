import "bootstrap";
import Chart from "chart.js"

var ctx = document.getElementById('glucoseChart');

const cleanSet  = () => {
  var values = JSON.parse(document.getElementById('essaiT').dataset.dates_enable);
  // values.forEach(function(element) {
  //   if (element.x < "2019-12-31") {
  //     console.log(element);
  //     // ecrire objet dans tableau
  //   }
  // });
  const result = values.filter(element => element.x > '2020-01-01');

  // formatage de la donnée pour scatter graph
  // const resultfilt = result.forEach((element) => {mappage(element)});

  // const mappage = (element) => {};


  const date1 = new Date(1996, 6, 4, 12, 30, 0, 0);
  console.log(date1);
  var dateformatee = formattagedesdate(date1);
  console.log(dateformatee);


function formattagedesdate(a) {
  a.setFullYear(1997);
  a.setMonth(11);
  a.setDate(31);
  return a
};


  console.log(values);
    console.log(result);
    // console.log(resultfilt);

  return result
};



if (ctx) {

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

}
