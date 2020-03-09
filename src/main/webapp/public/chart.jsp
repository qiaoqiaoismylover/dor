<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
</head>
<body>
<div id="container1" style="width: 550px; height: 50px; margin: 0 auto"></div>

    <div style="height:300px;width:50%;">
        <canvas id="chartjs-pie-chart"></canvas>
    </div>

    <script src="../js/Chart.min.js"></script>

    <script>
     
        window.chartColors = {
            red: 'rgb(255, 99, 132)',
            orange: 'rgb(255, 159, 64)',
            yellow: 'rgb(255, 205, 86)',
            green: 'rgb(75, 192, 192)',
            blue: 'rgb(54, 162, 235)',
            purple: 'rgb(153, 102, 255)',
            grey: 'rgb(201, 203, 207)'
        };

        window.randomScalingFactor = function () {
            return (Math.random() > 0.5 ? 1.0 : -1.0) * Math.round(Math.random() * 100);
        };

         
      

        var pieConfig = {
            type: 'pie',
            data: {
                datasets: [{
                    data: [
                        400, 300, 100, 800, 600
                    ],
                    backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.blue,
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    "Red",
                    "Orange",
                    "Yellow",
                    "Green",
                    "Blue"
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                title: {
                    display: true,
                    text: 'Pie Chart'
                }
            }
        };
          
        var pieCtx = document.getElementById("chartjs-pie-chart").getContext("2d");
        window.myPie = new Chart(pieCtx, pieConfig);
         
    </script>

 

</body>
</html>