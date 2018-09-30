window.onload = function() {
    var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        theme: "light2", // "light1", "light2", "dark1", "dark2"
        title: {
            text: "TOTAL DEPOSIT AND WIDTHDRAW",
            fontSize:16
        },
        axisY: {
            suffix: "ETE",
            includeZero: true,
            // gridDashType: "grid"
        },
        axisX: {
            title: "",
            labelFontSize:13
        },
        dataPointMaxWidth: 35,
        data: [{
            color: '#4F81BC',
            type: "column",
            name:"deposit",
            // yValueFormatString: "#,##0.0#\"00\"",
            dataPoints: [
                { label: "01/09", y: 400 },
                { label: "02/09", y: 700 },
                { label: "03/09", y: 500 },
                { label: "04/09", y: 2500 },
                { label: "05/09", y: 5200 },
                { label: "06/09", y: 440 },
                { label: "07/09", y: 700 },
                { label: "08/09", y: 420 },

            ]
        },
        {
            color: '#C0504E',
            type: "column",
            name:"widthdraw",
            // yValueFormatString: "#,##0.0#\"00\"",
            dataPoints: [
                { label: "01/09", y: 400 },
                { label: "02/09", y: 700 },
                { label: "03/09", y: 500 },
                { label: "04/09", y: 2500 },
                { label: "05/09", y: 5200 },
                { label: "06/09", y: 440 },
                { label: "07/09", y: 700 },
                { label: "08/09", y: 420 },
            ]
        }
        ]
 
    });
    

    chart.render();

}