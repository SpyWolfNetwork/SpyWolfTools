$('.toast-success').circleProgress({
        value: 0.8,
        size: 80,
        thickness: 10,
        fill: {
            gradient: ["#FE9431"]
        }
    }).on('circle-animation-progress', function (event, progress) {
        $(this).find('.progress_count').html(Math.round(80 * progress) + '<i>%</i>');
    });