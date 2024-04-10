import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js'

Chart.register(...registerables)

export default class extends Controller {
  static values = { completed: Object, signups: Object }

  initialize() {
    const data = Object.values(this.completedValue)
    const labels = Object.keys(this.completedValue)

    const ctx = document.getElementById('chart')
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: "Lessons completed",
          data: data,
          borderWidth: 3,
          fill: true,
          backgroundColor: "#fad1d5"
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false
          }
        },
        borderColor: "e23e57",
        scales: {
          x: {
            grid: {
              display: false
            }
          },
          y: {
            grid: {
              color: "e23e57"
            },
            border: {
              dash: [5, 5]
            },
            beginAtZero: true
          },
        }
      }
    })

    const data2 = Object.values(this.signupsValue)
    const labels2 = Object.keys(this.signupsValue)

    console.log("oi")
    console.log("Dados Completados:", data);
    console.log("Rótulos Completados:", labels);
    console.log("Dados de Inscrição:", data2);
    console.log("Rótulos de Inscrição:", labels2);
    

    const ctx2 = document.getElementById('sign_ups_chart')
    new Chart(ctx2, {
      type: 'line',
      data: {
        labels: labels2,
        datasets: [{
          label: "Lessons completed",
          data: data2,
          borderWidth: 3,
          fill: true,
          backgroundColor: "#fad1d5"
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false
          }
        },
        borderColor: "e23e57",
        scales: {
          x: {
            grid: {
              display: false
            }
          },
          y: {
            grid: {
              color: "e23e57"
            },
            border: {
              dash: [5, 5]
            },
            beginAtZero: true
          },
        }
      }
    })
  }
}
