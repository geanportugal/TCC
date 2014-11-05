using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace WebApplication1.ChartModels
{
    public class ChartData
    {
        public ChartConfig ChartConfig { get; set; }

        public List<Series> Series { get; set; }
    }

    public class Series
    {
        public string Name { get; set; }

        public string Color { get; set; }

        public string DashStyle { get; set; }
        
        public List<PointData> Points { get; set; }
    }

    public class PointData
    {
        

        public double x { get; set; }
        public double y { get; set; }
        public double z { get; set; }
        public string name { get; set; }
    }

    public class ChartConfig
    {
        public ChartConfig()
        {
            tooltipPointFormat = "";
        }

        public string chartTitle { get; set; }

        public string defaultSeriesType { get; set; }

        public int width { get; set; }

        public int height { get; set; }

        public int xAxisMinValue { get; set; }
        public int yAxisMinValue { get; set; }
        public int zAxisMinValue { get; set; }

        public int xAxisMaxValue { get; set; }
        public int yAxisMaxValue { get; set; }
        public int zAxisMaxValue { get; set; }
        

        public string tooltipPointFormat { get; set; }

        public bool pie_allowPointSelect { get; set; }

        public bool pie_dataLabelsEnabled { get; set; }

        public bool pie_showInLegend { get; set; }   
    }
}