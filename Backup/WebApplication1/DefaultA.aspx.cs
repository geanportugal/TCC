using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web.Services;


using Accord.Statistics.Analysis;
using Accord.Controls;
using Accord.Math;
using Accord.Math.Decompositions;
using Accord.Statistics.Formats;
using ZedGraph;
using System.Web.Script.Serialization;
using WebApplication1.ChartModels;
using System.Drawing;
using WebApplication1.Helpers;

namespace WebApplication1
{
    public partial class _DefaultA : System.Web.UI.Page
    {
        public string Series1 { get; set; }
        public string Xaxis { get; set; }

        string filename = "";
        public ExcelReader db;
        string[] sourceColumnNames;

        private PrincipalComponentAnalysis pca;
        private DescriptiveAnalysis sda;

        public static double[,] result;
        DataTable resultTable;

        #region ViewState

        /// <summary>
        /// Carregar viewstate.
        /// </summary>
        /// <param name="savedState"></param>
        protected override void LoadViewState(object savedState)
        {
            base.LoadViewState(savedState);


            if (this.ViewState["ColumnNames"] != null)
                this.sourceColumnNames = (string[])this.ViewState["ColumnNames"];

            if (this.ViewState["PCA"] != null)
                this.pca = (PrincipalComponentAnalysis)this.ViewState["PCA"];

            if (this.ViewState["SDA"] != null)
                this.sda = (DescriptiveAnalysis)this.ViewState["SDA"];



        }

        /// <summary>
        /// Salvar ViewState
        /// </summary>
        /// <returns></returns>
        protected override object SaveViewState()
        {

            this.ViewState["ColumnNames"] = this.sourceColumnNames;
            this.ViewState["PCA"] = this.pca;
            this.ViewState["SDA"] = this.sda;

            return base.SaveViewState();
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            filename = Server.MapPath("~/examples.xls");
            db = new ExcelReader(filename, true, false);
            if (!IsPostBack)
            {
                string extension = Path.GetExtension(filename);
                if (extension == ".xls" || extension == ".xlsx")
                {
                    ddlData.DataSource = db.GetWorksheetList().ToList();
                    ddlData.DataBind();
                    ddlData.Items.Insert(0, new ListItem("Selecione", "Selecione"));

                    //TableSelectDialog t = new TableSelectDialog(db.GetWorksheetList().ToList());

                    //if (t.ShowDialog(this) == DialogResult.OK)
                    //{
                    //this.dgvAnalysisSource.DataSource = db.GetWorksheet(t.Selection);
                    //this.dgvProjectionSource.DataSource = db.GetWorksheet(t.Selection);
                    //}
                }
            }
        }

        [WebMethod]
        public static string GetData()
        {
            var data = new ChartData();

            //configure chart
            data.ChartConfig = new ChartConfig()
            {
                chartTitle = "Clients",
                defaultSeriesType = "line",
                width = 800,
                height = 400,
                xAxisMinValue = 0,
                yAxisMinValue = 0,
                zAxisMinValue = 0,
                xAxisMaxValue = 1,
                yAxisMaxValue = 1,
                zAxisMaxValue = 1
            };

            #region add series
            data.Series = new List<Series>();

            data.Series.Add(new Series()
            {
                Name = "Series1",
                Color = ColorTranslator.ToHtml(Color.Navy),
                Points = new List<PointData>()
            });

            //data.Series.Add(new Series()
            //{
            //    Name = "Series2",
            //    Color = ColorTranslator.ToHtml(Color.Red),
            //    Points = new List<PointData>()
            //});

            //data.Series.Add(new Series()
            //{
            //    Name = "Series3",
            //    Points = new List<PointData>()
            //});

            #endregion

            int xAxisMinValue = 0;
            int yAxisMinValue = 0;
            int zAxisMinValue = 0;

            int xAxisMaxValue = 1;
            int yAxisMaxValue = 1;
            int zAxisMaxValue = 1;

            #region add dummy data
            var random = new Random();
            foreach (var serie in data.Series)
            {
                int index = 0;
                List<Data> dataList = new List<Data>();
                
                double valor1 = -1000;
                double valor2 = -1000;
                double valor3 = -1000;
                int count = 0;

               

                foreach (var item in result)
                {

                    if (index >= 3)
                    {
                        index = 0;
                        
                        valor1 = -1000;
                        valor2 = -1000;
                        valor3 = -1000;
                    }
                    //COMPONENTE X
                    if (index == 0)
                    {
                        valor1 = item;

                        if (item < xAxisMinValue)
                            xAxisMinValue = Convert.ToInt32(Math.Floor(item));

                        if (item > xAxisMaxValue)
                            xAxisMaxValue = Convert.ToInt32(Math.Ceiling(item));
                    }

                    if (index == 1)
                    {
                        valor2 = item;

                        if (item < yAxisMinValue)
                            yAxisMinValue = Convert.ToInt32(Math.Floor(item));

                        if (item > yAxisMaxValue)
                            yAxisMaxValue = Convert.ToInt32(Math.Ceiling(item));
                    }

                    if (index == 2)
                    {
                        count++;
                        valor3 = item;

                        if (item < zAxisMinValue)
                            zAxisMinValue = Convert.ToInt32(Math.Floor(item));

                        if (item > zAxisMaxValue)
                            zAxisMaxValue = Convert.ToInt32(Math.Ceiling(item));

                        serie.Points.Add(new PointData()
                        {
                            name = count.ToString(),
                            x = valor1,
                            y = valor2,
                            z = valor3
                        });
                    }
                    index++;
                }
                data.ChartConfig.xAxisMinValue = xAxisMinValue;
                data.ChartConfig.yAxisMinValue = yAxisMinValue;
                data.ChartConfig.zAxisMinValue = zAxisMinValue;

                data.ChartConfig.xAxisMaxValue = xAxisMaxValue;
                data.ChartConfig.yAxisMaxValue = yAxisMaxValue;
                data.ChartConfig.zAxisMaxValue = zAxisMaxValue;

            }
            #endregion

            var json = JsonHelper.ToJSON<ChartData>(data);

            return json;
        }


        //[WebMethod]
        //public static List<Data> GetData()
        //{
        //    int index = 0;
        //    List<Data> dataList = new List<Data>();

        //    double? valor1 = null;
        //    double? valor2 = null;

        //    foreach (var item in result)
        //    {
                
        //        if (index >= 2)
        //        {
        //            index = 0;
        //            valor1 = null;
        //            valor2 = null;
        //        }

        //        if (index == 0)
        //        {
        //            valor1 = item;
        //        }

        //        if (index == 1)
        //        {
        //            valor2 = item;
        //            Data data = new Data(valor1, valor2);
        //            dataList.Add(data);
        //        }



        //        index++;
        //    }




            

        //    return dataList;
        //}

        protected void ddlData_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlData.SelectedIndex != 0)
            {
                dgvAnalysisSource.DataSource = db.GetWorksheet(ddlData.SelectedValue);
                dgvAnalysisSource.DataBind();
                
            }
            //this.dgvProjectionSource.DataSource = db.GetWorksheet(t.Selection);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            // Creates a matrix from the source data table
            double[,] sourceMatrix = (db.GetWorksheet(ddlData.SelectedValue) as DataTable).ToMatrix(out sourceColumnNames);

            // Creates the Simple Descriptive Analysis of the given source
            sda = new DescriptiveAnalysis(sourceMatrix, sourceColumnNames);

            sda.Compute();


            // Populates statistics overview tab with analysis data
            //dgvStatisticCenter.DataSource = new ArrayDataView(sda.DeviationScores, sourceColumnNames);
            //dgvStatisticStandard.DataSource = new ArrayDataView(sda.StandardScores, sourceColumnNames);

            dgvStatisticCovariance.DataSource = new ArrayDataView(sda.CovarianceMatrix, sourceColumnNames);
            dgvStatisticCovariance.DataBind();

            dgvStatisticCorrelation.DataSource = new ArrayDataView(sda.CorrelationMatrix, sourceColumnNames);
            dgvStatisticCorrelation.DataBind();
            //dgvDistributionMeasures.DataSource = sda.Measures;


            // Creates the Principal Component Analysis of the given source
            pca = new PrincipalComponentAnalysis(sda.Source, AnalysisMethod.Center);
//                (AnalysisMethod)cbMethod.SelectedValue);

            var matrixDecomposion = new EigenvalueDecomposition(sda.CovarianceMatrix);

            // Compute the Principal Component Analysis
            pca.Compute();

            

            
            // Populates components overview with analysis data
            //dgvFeatureVectors.DataSource = new ArrayDataView(pca.ComponentMatrix);
            dgvFeatureVectors.DataSource = new ArrayDataView(matrixDecomposion.Eigenvectors);
            dgvFeatureVectors.DataBind();

            dgvPrincipalComponents.DataSource = pca.Components;
            dgvPrincipalComponents.DataBind();

            dgvProjectionComponents.DataSource = pca.Components;
            dgvProjectionComponents.DataBind();
            //numComponents.Maximum = pca.Components.Count;
            //numComponents.Value = 1;
            //numThreshold.Value = (decimal)pca.Components[0].CumulativeProportion * 100;

            //CreateComponentCumulativeDistributionGraph(graphCurve);
            //CreateComponentDistributionGraph(graphShare);


            string[] colNames;
            //int components = (int)numComponents.Value;
            int components = pca.Components.Count;
            double[,] projectionSource = (db.GetWorksheet(ddlData.SelectedValue) as DataTable).ToMatrix(out colNames);

            // Compute the projection
            
            //double[,] projection = pca.Transform(projectionSource, components);
            double[,] projection = sourceMatrix.Multiply(matrixDecomposion.Eigenvectors);

            resultTable = projection.ToTable();

            
            int[] componentes = {0,1,2};

            result = projection.GetColumns(componentes);

            

//            result = projection;

            dgvProjectionResult.DataSource = new ArrayDataView(projection, GenerateComponentNames(components));
            dgvProjectionResult.DataBind();
            //dgvReversionSource.DataSource = dgvProjectionResult.DataSource;
        }

        private string[] GenerateComponentNames(int number)
        {
            string[] names = new string[number];
            for (int i = 0; i < names.Length; i++)
            {
                names[i] = "Component " + (i + 1);
            }
            return names;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
        }
    }


    public class ChartEx
    {
        public string name { get; set; }
        public List<int> data { get; set; }
    }
}
