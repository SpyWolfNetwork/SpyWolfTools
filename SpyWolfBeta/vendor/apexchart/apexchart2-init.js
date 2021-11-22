(function ($) {
    var options = {
        series: [10.4, 24.4, 0.5, 20.4, 42.4, 5.5, 5.1, 2.5],
        chart: {
            height: 300,
            type: 'pie',
        },
        tooltip: {
            enabled: true,
        },
        plotOptions: {
            radialBar: {
                offsetY: 0,
                startAngle: 0,
                endAngle: 360,
                hollow: {
                    margin: 5,
                    size: '20%',
                    background: 'transparent',
                    image: undefined,
                },
                dataLabels: {
                    name: {
                        show: false,
                    },
                    value: {
                        show: false,
                    }
                }
            }
        },
        colors: [
            'rgba(94, 55, 255,1)',
            'rgba(94, 55, 255,0.7)',
            'rgba(94, 55, 255,0.3)',
            'rgba(94, 55, 255,0.1)'
        ],
        labels: ['Baby Floki', 'KODI', 'SPY', 'Rhythm', '1Doge', 'MicroPets', 'Banana'],
        legend: {
            show: false,
            floating: true,
            fontSize: '16px',
            position: 'left',
            offsetX: 160,
            offsetY: 3,
            labels: {
                useSeriesColors: true,
            },
            markers: {
                size: 0
            },
            formatter: function (seriesName, opts) {
                return seriesName + ":  " + opts.w.globals.series[opts.seriesIndex]
            },
            itemMargin: {
                vertical: 3
            }
        },
        responsive: [{
            breakpoint: 480,
            options: {
                legend: {
                    show: false
                }
            }
        }]
    };

    var chart = new ApexCharts(document.querySelector("#wallet-chart"), options);
    chart.render();


})(jQuery);