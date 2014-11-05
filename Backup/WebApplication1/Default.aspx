<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>
    <script type="text/javascript">



        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Default.aspx/GetData',
                data: '{}',
                success:
                    function (response) {
                        drawVisualization(response.d);
                    }

            });
        })

        function drawVisualization(dataValues) {
            //var data = new google.visualization.arrayToDataTable();

            var data = google.visualization.arrayToDataTable([
          ['Age', 'Weight'],
          [8, 12],
          [4, 5.5],
          [11, 14],
          [4, 5],
          [3, 3.5],
          [6.5, 7]
        ]);


            var options = {
                title: 'Age vs. Weight comparison',
                hAxis: { title: 'Age', minValue: 0, maxValue: 15 },
                vAxis: { title: 'Weight', minValue: 0, maxValue: 15 },
                legend: 'none'
            };

            //data.addColumn('string', 'Column Name');
            //data.addColumn('number', 'Column Value');

//            for (var i = 0; i < dataValues.length; i++) {
//                data.addRow([dataValues[i].ColumnName, dataValues[i].Value]);
//            }

            new google.visualization.ScatterChart(document.getElementById('visualization')).
                draw(data, options);
        } 
         
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="visualization" style="width: 600px; height: 350px;">
    </div>
    </form>
</body>
</html>
