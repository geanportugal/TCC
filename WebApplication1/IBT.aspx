<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IBT.aspx.cs" Inherits="WebApplication1._IBT" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
      <script type="text/javascript" src="Scripts/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/highcharts.js"></script>
    <script type="text/javascript" src="Scripts/highcharts-3d.js"></script>
    <script type="text/javascript" src="Scripts/modules/exporting.js"></script>

     <script type="text/javascript">


         function GeraGrafico3D() {
             $.ajax({
                 type: 'POST',
                 contentType: "application/json; charset=utf-8",
                 dataType: 'json',
                 url: 'IBT.aspx/GetData',
                 data: '{}',
                 success:
                     function (response) {
                         drawVisualization3D(response.d);
                     }
             });

             return false;
         }


         function drawVisualization3D(dataValues) {

             var customFormatPointName = function (pointName) {

                 return pointName.replace(/</gm, '&lt;').replace(/>/gm, '&gt;');
             };

             var resultObject = JSON.parse(dataValues);
             $(function () {
                 // Give the points a 3D feel by adding a radial gradient
                 Highcharts.getOptions().colors = $.map(Highcharts.getOptions().colors, function (color) {
                     return {
                         radialGradient: {
                             cx: 0.4,
                             cy: 0.3,
                             r: 0.5
                         },
                         stops: [
                 [0, color],
                 [1, Highcharts.Color(color).brighten(-0.2).get('rgb')]
                         ]
                     };
                 });

                 // Set up the chart
                 var chartIBT = new Highcharts.Chart({
                     chart: {
                         renderTo: 'container',
                         margin: 100,
                         type: 'scatter',
                         options3d: {
                             enabled: true,
                             alpha: 15,
                             beta: 30,
                             depth: 250,
                             viewDistance: 3,


                             frame: {
                                 bottom: { size: 1, color: 'rgba(0,0,0,0.02)' },
                                 back: { size: 1, color: 'rgba(0,0,0,0.04)' },
                                 side: { size: 1, color: 'rgba(0,0,0,0.06)' }
                             }
                         }
                     },
                     title: {
                         text: ''
                     },
                     subtitle: {
                         text: ''
                     },
                     plotOptions: {
                         scatter: {
                             width: 10,
                             height: 10,
                             depth: 10,
                             dataLabels: {
                                 enabled: true,
                                 formatter: function () {
                                     return customFormatPointName(this.point.name);


                                 },

                             }
                         }
                     },


                     yAxis: {
                         min: resultObject.ChartConfig.yAxisMinValue,
                         max: resultObject.ChartConfig.yAxisMaxValue,
                         title: null,
                     },
                     xAxis: {
                         min: resultObject.ChartConfig.xAxisMinValue,
                         max: resultObject.ChartConfig.xAxisMaxValue,
                         gridLineWidth: 1
                     },
                     zAxis: {
                         min: resultObject.ChartConfig.zAxisMinValue,
                         max: resultObject.ChartConfig.zAxisMaxValue
                     },
                     legend: {
                         enabled: true
                     }
                     //                    series: [{
                     //                            name: 'Reading',
                     //                            colorByPoint: true,
                     //                            dataLabels: {
                     //                                enabled: true,
                     //                                formatter:function() {
                     //                                    return this.point.name;
                     //                                },
                     //                                style:{color:"black"}
                     //                            },
                     //                            data: []
                     //                    //                    data: [[1, 6, 5], [8, 7, 9], [1, 3, 4], [4, 6, 8], [5, 7, 7], [6, 9, 6], [7, 0, 5], [2, 3, 3], [3, 9, 8], [3, 6, 5], [4, 9, 4], [2, 3, 3], [6, 9, 9], [0, 7, 0], [7, 7, 9], [7, 2, 9], [0, 6, 2], [4, 6, 7], [3, 7, 7], [0, 1, 7], [2, 8, 6], [2, 3, 7], [6, 4, 8], [3, 5, 9], [7, 9, 5], [3, 1, 7], [4, 4, 2], [3, 6, 2], [3, 1, 6], [6, 8, 5], [6, 6, 7], [4, 1, 1], [7, 2, 7], [7, 7, 0], [8, 8, 9], [9, 4, 1], [8, 3, 4], [9, 8, 9], [3, 5, 3], [0, 2, 4], [6, 0, 2], [2, 1, 3], [5, 8, 9], [2, 1, 1], [9, 7, 6], [3, 0, 2], [9, 9, 0], [3, 4, 8], [2, 6, 1], [8, 9, 2], [7, 6, 5], [6, 3, 1], [9, 3, 1], [8, 9, 3], [9, 1, 0], [3, 8, 7], [8, 0, 0], [4, 9, 7], [8, 6, 2], [4, 3, 0], [2, 3, 5], [9, 1, 4], [1, 1, 4], [6, 0, 2], [6, 1, 6], [3, 8, 8], [8, 8, 7], [5, 5, 0], [3, 9, 6], [5, 4, 3], [6, 8, 3], [0, 1, 5], [6, 7, 3], [8, 3, 2], [3, 8, 3], [2, 1, 6], [4, 6, 7], [8, 9, 9], [5, 4, 2], [6, 1, 3], [6, 9, 5], [4, 8, 2], [9, 7, 4], [5, 4, 2], [9, 6, 1], [2, 7, 3], [4, 5, 4], [6, 8, 1], [3, 4, 0], [2, 2, 6], [5, 1, 2], [9, 9, 7], [6, 9, 9], [8, 4, 3], [4, 1, 7], [6, 2, 5], [0, 4, 9], [3, 5, 9], [6, 9, 1], [1, 9, 2]]
                     //                     }]
                 });

                 //                chart.xAxis.min = resultObject.ChartConfig.xAxisMinValue;
                 //                chart.xAxis.max = resultObject.ChartConfig.xAxisMaxValue;

                 //                chart.yAxis.min = resultObject.ChartConfig.yAxisMinValue;
                 //                chart.yAxis.max = resultObject.ChartConfig.yAxisMaxValue;



                 $.each(resultObject.Series, function (index, item) {
                     chartIBT.addSeries({
                         name: item.Name,
                         dataLabels: {
                             enabled: true,
                             x: 1,
                             y: 1,

                             formatter: function () {
                                 return this.point.name;
                             }
                             //style: { color: item.Color }
                         },
                         color: item.Color,
                         data: []
                     }, false);

                     //add data points
                     $.each(item.Points, function (index, pointData) {
                         chartIBT.series[chartIBT.series.length - 1].addPoint([
                         pointData.name,
                         pointData.x,
                         pointData.y,
                         pointData.z

                         ], false);
                     });
                 });

                 chartIBT.redraw();

                 // Add mouse events for rotation
                 $(chartIBT.container).bind('mousedown.hc touchstart.hc', function (e) {
                     e = chartIBT.pointer.normalize(e);

                     var posX = e.pageX,
                     posY = e.pageY,
                     alpha = chartIBT.options.chart.options3d.alpha,
                     beta = chartIBT.options.chart.options3d.beta,
                     newAlpha,
                     newBeta,
                     sensitivity = 5; // lower is more sensitive

                     $(document).bind({
                         'mousemove.hc touchdrag.hc': function (e) {
                             // Run beta
                             newBeta = beta + (posX - e.pageX) / sensitivity;
                             newBeta = Math.min(100, Math.max(-100, newBeta));
                             chartIBT.options.chart.options3d.beta = newBeta;

                             // Run alpha
                             newAlpha = alpha + (e.pageY - posY) / sensitivity;
                             newAlpha = Math.min(100, Math.max(-100, newAlpha));
                             chartIBT.options.chart.options3d.alpha = newAlpha;

                             chartIBT.redraw(false);
                         },
                         'mouseup touchend': function () {
                             $(document).unbind('.hc');
                         }
                     });
                 });
             });
         }

        </script>
    
    <style type="text/css">
    
    #container {
	    height: 600px; 
	    min-width: 310px; 
	    max-width: 800px;
	    margin: 0 auto;
    }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to The Information Bottleneck Method!
    </h2>
    <p>
        To learn more about The IBM visit <a href="http://www.cs.huji.ac.il/labs/learning/Papers/allerton.pdf"  title="IBM Article">IBM Article</a>.
    </p>
    
    <p>
        You can also find <a href="http://www.cs.huji.ac.il/labs/learning/Papers/IBM_list.html"  title="IBT Docs">publications on IBT at here</a>.
    </p>
    
       <h1>Escolha a base dos dados:</h1>

    

    <p>
        <asp:DropDownList ID="ddlData" runat="server" AutoPostBack="true" CssClass="input-lg" onselectedindexchanged="ddlData_SelectedIndexChanged" >
            
        </asp:DropDownList>
        </p>
    <br />
        <p>
            <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Qtde de Clusters :"></asp:Label>
            
            <asp:TextBox ID="txtClusters" CssClass="input-lg"   runat="server"></asp:TextBox>
 </p><br />
    <p><asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Número do Beta :"></asp:Label>
        <asp:TextBox ID="txtBeta"  CssClass="input-lg" runat="server"></asp:TextBox>
    </p>
    <p>

    


        <asp:Button ID="Button3" runat="server" Text="Compute"  CssClass="botoes-lat-3"
            onclick="Button1_Click"  />

    </p>
    <h1>Base dos Dados</h1>
        <asp:GridView ID="dgvAnalysisSource" CssClass="table table-responsive" runat="server" AutoGenerateColumns="true">
        </asp:GridView>

    


        <h2>P(Y|T)</h2>
        <asp:GridView ID="dgvProbPYT" CssClass="table" runat="server" AutoGenerateColumns="true">
        </asp:GridView>

        <h2>P(T|X)</h2>
        <asp:GridView ID="dgvProbPTX" CssClass="table" runat="server" AutoGenerateColumns="true">
        </asp:GridView>

        <br />
        
        <h2>Resultado</h2>
        <asp:GridView ID="dgvProjectionResult" CssClass="table" runat="server" AutoGenerateColumns="true">
        </asp:GridView>


         <asp:Button ID="Button2" runat="server" CssClass="botoes-lat-3" Text="Gerar Gráfico" OnClientClick="return GeraGrafico3D();" 
            onclick="Button2_Click"  />

        
        <div id="container" style="height: 400px"></div>
    
            

    <a href="Global.asax">Global.asax</a>
    
            

</asp:Content>