import "chartjs-adapter-date-fns"
import "@hotwired/turbo-rails"
import "./controllers"

import Chart from 'chart.js/auto'
import Chartkick from 'chartkick'
Chartkick.use(Chart)