<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" EnableViewState="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
                url: 'Default.aspx/GetData',
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
                var chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'plotter',
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
                        enabled: false
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
                    chart.addSeries({
                        name: 'Reading',
                        colorByPoint: true,
                        dataLabels: {

                            x: 1,
                            y: 1,
                            
                            formatter:function() {
                            return this.point.name;
                            },
                            style:{color:"black"}
                        },
                        data: []
                    }, false);

                    //add data points
                    $.each(item.Points, function (index, pointData) {
                        chart.series[chart.series.length - 1].addPoint([
                        pointData.name, 
                        pointData.x,
                        pointData.y,
                        pointData.z
                                              
                    ], false);
                    });
                });

                chart.redraw();

                // Add mouse events for rotation
                $(chart.container).bind('mousedown.hc touchstart.hc', function (e) {
                    e = chart.pointer.normalize(e);

                    var posX = e.pageX,
                    posY = e.pageY,
                    alpha = chart.options.chart.options3d.alpha,
                    beta = chart.options.chart.options3d.beta,
                    newAlpha,
                    newBeta,
                    sensitivity = 5; // lower is more sensitive

                    $(document).bind({
                        'mousemove.hc touchdrag.hc': function (e) {
                            // Run beta
                            newBeta = beta + (posX - e.pageX) / sensitivity;
                            newBeta = Math.min(100, Math.max(-100, newBeta));
                            chart.options.chart.options3d.beta = newBeta;

                            // Run alpha
                            newAlpha = alpha + (e.pageY - posY) / sensitivity;
                            newAlpha = Math.min(100, Math.max(-100, newAlpha));
                            chart.options.chart.options3d.alpha = newAlpha;

                            chart.redraw(false);
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
    
    #plotter {
	    height: 600px; 
	    min-width: 310px; 
	    max-width: 800px;
	    margin: 0 auto;
    }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        MÉTODO PCA
    </h2>
    


    
        <asp:DropDownList ID="ddlData" runat="server" CssClass="input-lg" AutoPostBack="true" onselectedindexchanged="ddlData_SelectedIndexChanged" >
            
        </asp:DropDownList>
        <p></p>
        <asp:GridView ID="dgvAnalysisSource" CssClass="table" runat="server" AutoGenerateColumns="true">
        </asp:GridView>

    


        <asp:Button ID="Button1" CssClass="botoes-lat-3" runat="server" Text="Compute" 
            onclick="Button1_Click"  />

        <br />
        <br />
        <h2>Covariância</h2>
        <asp:GridView ID="dgvStatisticCovariance" CssClass="table" style="overflow:auto; width:900px;" runat="server" AutoGenerateColumns="true">
        </asp:GridView>

        <br />
        <h2>Correlação</h2>
        <asp:GridView ID="dgvStatisticCorrelation"  CssClass="table" style="overflow:auto; width:900px;" runat="server" AutoGenerateColumns="true">
        </asp:GridView>
    
        <br />
        <h2>Vetores Unitários</h2>
        <asp:GridView ID="dgvFeatureVectors" CssClass="table"  style="overflow:auto; width:900px;" runat="server" AutoGenerateColumns="true">
        </asp:GridView>
    
        <br />
       <h2>Componentes Principais</h2>
        <asp:GridView ID="dgvPrincipalComponents"  CssClass="table" style="overflow:auto; width:900px;" runat="server" AutoGenerateColumns="true">
        </asp:GridView>
    
        <br />
        <h2>Projeção dos Componentes</h2>
        <asp:GridView ID="dgvProjectionComponents"  CssClass="table"  style="overflow:auto; width:900px;" runat="server" AutoGenerateColumns="true">
        </asp:GridView>
    
        <br />
        <h2>Projeção dos Resultados</h2>
        <asp:GridView ID="dgvProjectionResult" CssClass="table" style="overflow:auto; width:900px;" runat="server" AutoGenerateColumns="true">
        </asp:GridView>


        <asp:Button ID="Button2" runat="server" CssClass="botoes-lat-3" Text="Gerar Gráfico" OnClientClick="return GeraGrafico3D();" 
            onclick="Button2_Click"  />

        
        <div id="plotter" style="height: 400px"></div>
        <%--<div id="visualization" style="width: 600px; height: 350px;">
        </div>--%>
    
    <%--<script type="text/javascript">

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
            var chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container',
                    margin: 100,
                    type: 'scatter',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 30,
                        depth: 250,
                        viewDistance: 5,

                        frame: {
                            bottom: { size: 1, color: 'rgba(0,0,0,0.02)' },
                            back: { size: 1, color: 'rgba(0,0,0,0.04)' },
                            side: { size: 1, color: 'rgba(0,0,0,0.06)' }
                        }
                    }
                },
                title: {
                    text: 'Draggable box'
                },
                subtitle: {
                    text: 'Click and drag the plot area to rotate in space'
                },
                plotOptions: {
                    scatter: {
                        width: 10,
                        height: 10,
                        depth: 10
                    }
                },
                yAxis: {
                    min: 0,
                    max: 10,
                    title: null
                },
                xAxis: {
                    min: 0,
                    max: 10,
                    gridLineWidth: 1
                },
                zAxis: {
                    min: 0,
                    max: 10
                },
                legend: {
                    enabled: false
                },
                series: [{
                    name: 'Reading',
                    colorByPoint: true,
                    data: [[1, 6, 5], [8, 7, 9], [1, 3, 4], [4, 6, 8], [5, 7, 7], [6, 9, 6], [7, 0, 5], [2, 3, 3], [3, 9, 8], [3, 6, 5], [4, 9, 4], [2, 3, 3], [6, 9, 9], [0, 7, 0], [7, 7, 9], [7, 2, 9], [0, 6, 2], [4, 6, 7], [3, 7, 7], [0, 1, 7], [2, 8, 6], [2, 3, 7], [6, 4, 8], [3, 5, 9], [7, 9, 5], [3, 1, 7], [4, 4, 2], [3, 6, 2], [3, 1, 6], [6, 8, 5], [6, 6, 7], [4, 1, 1], [7, 2, 7], [7, 7, 0], [8, 8, 9], [9, 4, 1], [8, 3, 4], [9, 8, 9], [3, 5, 3], [0, 2, 4], [6, 0, 2], [2, 1, 3], [5, 8, 9], [2, 1, 1], [9, 7, 6], [3, 0, 2], [9, 9, 0], [3, 4, 8], [2, 6, 1], [8, 9, 2], [7, 6, 5], [6, 3, 1], [9, 3, 1], [8, 9, 3], [9, 1, 0], [3, 8, 7], [8, 0, 0], [4, 9, 7], [8, 6, 2], [4, 3, 0], [2, 3, 5], [9, 1, 4], [1, 1, 4], [6, 0, 2], [6, 1, 6], [3, 8, 8], [8, 8, 7], [5, 5, 0], [3, 9, 6], [5, 4, 3], [6, 8, 3], [0, 1, 5], [6, 7, 3], [8, 3, 2], [3, 8, 3], [2, 1, 6], [4, 6, 7], [8, 9, 9], [5, 4, 2], [6, 1, 3], [6, 9, 5], [4, 8, 2], [9, 7, 4], [5, 4, 2], [9, 6, 1], [2, 7, 3], [4, 5, 4], [6, 8, 1], [3, 4, 0], [2, 2, 6], [5, 1, 2], [9, 9, 7], [6, 9, 9], [8, 4, 3], [4, 1, 7], [6, 2, 5], [0, 4, 9], [3, 5, 9], [6, 9, 1], [1, 9, 2]]
                }]
            });


            // Add mouse events for rotation
            $(chart.container).bind('mousedown.hc touchstart.hc', function (e) {
                e = chart.pointer.normalize(e);

                var posX = e.pageX,
            posY = e.pageY,
            alpha = chart.options.chart.options3d.alpha,
            beta = chart.options.chart.options3d.beta,
            newAlpha,
            newBeta,
            sensitivity = 5; // lower is more sensitive

                $(document).bind({
                    'mousemove.hc touchdrag.hc': function (e) {
                        // Run beta
                        newBeta = beta + (posX - e.pageX) / sensitivity;
                        newBeta = Math.min(100, Math.max(-100, newBeta));
                        chart.options.chart.options3d.beta = newBeta;

                        // Run alpha
                        newAlpha = alpha + (e.pageY - posY) / sensitivity;
                        newAlpha = Math.min(100, Math.max(-100, newAlpha));
                        chart.options.chart.options3d.alpha = newAlpha;

                        chart.redraw(false);
                    },
                    'mouseup touchend': function () {
                        $(document).unbind('.hc');
                    }
                });
            });

        });

//$(function () {

//// Give the points a 3D feel by adding a radial gradient
//Highcharts.getOptions().colors = $.map(Highcharts.getOptions().colors, function (color) {
//return {
//radialGradient: {
//cx: 0.4,
//cy: 0.3,
//r: 0.5
//},
//stops: [
//[0, color],
//[1, Highcharts.Color(color).brighten(-0.2).get('rgb')]
//]
//};
//});

//// Set up the chart
//var chart = new Highcharts.Chart({
//chart: {
//renderTo: 'container',
//margin: 100,
//type: 'scatter',
//options3d: {
//enabled: true,
//alpha: 10,
//beta: 30,
//depth: 250,
//viewDistance: 5,

//frame: {
//bottom: { size: 1, color: 'rgba(0,0,0,0.02)' },
//back: { size: 1, color: 'rgba(0,0,0,0.04)' },
//side: { size: 1, color: 'rgba(0,0,0,0.06)' }
//}
//}
//},
//title: {
//text: 'Draggable box'
//},
//dataLabels: {
//enabled: true
//},
//subtitle: {
//text: 'Click and drag the plot area to rotate in space'
//},
//plotOptions: {
//scatter: {
//width: 20,
//height: 20,
//depth: 20,
//dataLabels: {
//enabled: true
//}, 
//},
//},
//yAxis: {
//min: 0,
//max: 10,
//title: null
//},
//xAxis: {
//min: 0,
//max: 10,
//gridLineWidth: 1
//},
//zAxis: {
//min: 0,
//max: 10
//},
//legend: {
//enabled: false
//},
//series: [{
//name: 'Reading',
//colorByPoint: true,
//data: [[1, 6, 5], [8, 7, 9], [1, 3, 4], [4, 6, 8], [5, 7, 7], [6, 9, 6], [7, 0, 5], [2, 3, 3], [3, 9, 8], [3, 6, 5], [4, 9, 4], [2, 3, 3], [6, 9, 9], [0, 7, 0], [7, 7, 9], [7, 2, 9], [0, 6, 2], [4, 6, 7], [3, 7, 7], [0, 1, 7], [2, 8, 6], [2, 3, 7], [6, 4, 8], [3, 5, 9], [7, 9, 5], [3, 1, 7], [4, 4, 2], [3, 6, 2], [3, 1, 6], [6, 8, 5], [6, 6, 7], [4, 1, 1], [7, 2, 7], [7, 7, 0], [8, 8, 9], [9, 4, 1], [8, 3, 4], [9, 8, 9], [3, 5, 3], [0, 2, 4], [6, 0, 2], [2, 1, 3], [5, 8, 9], [2, 1, 1], [9, 7, 6], [3, 0, 2], [9, 9, 0], [3, 4, 8], [2, 6, 1], [8, 9, 2], [7, 6, 5], [6, 3, 1], [9, 3, 1], [8, 9, 3], [9, 1, 0], [3, 8, 7], [8, 0, 0], [4, 9, 7], [8, 6, 2], [4, 3, 0], [2, 3, 5], [9, 1, 4], [1, 1, 4], [6, 0, 2], [6, 1, 6], [3, 8, 8], [8, 8, 7], [5, 5, 0], [3, 9, 6], [5, 4, 3], [6, 8, 3], [0, 1, 5], [6, 7, 3], [8, 3, 2], [3, 8, 3], [2, 1, 6], [4, 6, 7], [8, 9, 9], [5, 4, 2], [6, 1, 3], [6, 9, 5], [4, 8, 2], [9, 7, 4], [5, 4, 2], [9, 6, 1], [2, 7, 3], [4, 5, 4], [6, 8, 1], [3, 4, 0], [2, 2, 6], [5, 1, 2], [9, 9, 7], [6, 9, 9], [8, 4, 3], [4, 1, 7], [6, 2, 5], [0, 4, 9], [3, 5, 9], [6, 9, 1], [1, 9, 2]]
//}]
//});


//// Add mouse events for rotation
//$(chart.container).bind('mousedown.hc touchstart.hc', function (e) {
//e = chart.pointer.normalize(e);

//var posX = e.pageX,
//posY = e.pageY,
//alpha = chart.options.chart.options3d.alpha,
//beta = chart.options.chart.options3d.beta,
//newAlpha,
//newBeta,
//sensitivity = 5; // lower is more sensitive

//$(document).bind({
//'mousemove.hc touchdrag.hc': function (e) {
//// Run beta
//newBeta = beta + (posX - e.pageX) / sensitivity;
//newBeta = Math.min(100, Math.max(-100, newBeta));
//chart.options.chart.options3d.beta = newBeta;

//// Run alpha
//newAlpha = alpha + (e.pageY - posY) / sensitivity;
//newAlpha = Math.min(100, Math.max(-100, newAlpha));
//chart.options.chart.options3d.alpha = newAlpha;

//chart.redraw(false);
//},
//'mouseup touchend': function () {
//$(document).unbind('.hc');
//}
//});
//});

//});
    </script>--%>
            

</asp:Content>
