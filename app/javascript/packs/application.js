import "bootstrap";
import Chartkick from "chartkick"
import Chart from "chart.js"

const glucoseChart = document.getElementById('glucose-chart');
// Ne lancer le graph que si la div glucoseChart existe sur la page
if (glucoseChart) {
  Chartkick.use(Chart)
  // Data contient les coordonés de chaque point.
  // Il faudra les récupérer du controlleur puis les cacher dans le HTML comme des coordonnées de map
  const data = [ [0, 300], [10, 100], [40, 200], [100, 600] ];
  new Chartkick.ScatterChart("glucose-chart", data);
}
