<div class="container" id="chart_nest_stats"></div>
<script>
$(function () { 
    Highcharts.setOptions({
        global: {
            timezoneOffset: <?= $date_offset; ?> * 60
        }
    });
    $('#chart_nest_stats').highcharts('StockChart', {
        chart_nest_stats: {
            type: 'line',
            zoomType: 'xy',
            renderTo: chart_nest_stats
        },
        title: {
            text: 'Nest Temperature Statistics'
        },
        credits: {
        	enabled: false
        },
        xAxis: {
            type: 'datetime'
        },
	    rangeSelector: {
	    	selected: 1,
	    	buttons: [{
		    type: 'hour',
    		count: 1,
    		text: '1h'
		}, {
    		type: 'hour',
    		count: 3,
		    text: '3h'
		}, {
		    type: 'hour',
    		count: 6,
    		text: '6h'
    	}, {
    		type: 'hour',
    		count: 12,
    		text: '12h'
    	}, {
    		type: 'day',
    		count: 1,
    		text: '1d'
		}, {
			type: 'month',
			count: 1,
			text: '1m'
		}, {
    		type: 'ytd',
    		text: 'YTD'
		}, {
    		type: 'year',
    		count: 1,
    		text: '1y'
		}, {
    		type: 'all',
    		text: 'All'
		}],
	    },
        yAxis: {
            title: {
                text: 'Value'
            }
        },
        plotOptions: {
            line: {
                marker: {
                    enabled: false
                }
            }
        },

        series: [{
            name: 'Inside Temperature',
            data: [<?php echo join($data_temp, ','); ?>]
        }, {
            name: 'Outside Temperature',
            data: [<?php echo join($data_outside_temp, ','); ?>]
        }, {
            name: 'Thermostat Setpoint',
            data: [<?php echo join($data_setpoint, ','); ?>]
        }, {
            name: 'Inside Humidity',
            data: [<?php echo join($data_humidity, ','); ?>]
        }, {
        	name: 'Outside Humidity',
        	data: [<?php echo join($data_outside_humidity, ','); ?>]
        }],
        legend: {
			enabled: true,
			borderWidth: 1,
			backgroundColor: '#FFFFFF',
			shadow: true
		}
    });
});
</script>