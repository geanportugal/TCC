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
using WebApplication1.ChartModels;
using System.Drawing;
using WebApplication1.Helpers;

namespace WebApplication1
{
    public partial class _IBT : System.Web.UI.Page
    {

        string filename = "";
        public ExcelReader db;
        string[] sourceColumnNames;

        private PrincipalComponentAnalysis ibt;
        private DescriptiveAnalysis ibtDA;

        public static List<PointData> result;
        public static int[] clustersResult;
        public static int NCluster;

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
                this.ibt = (PrincipalComponentAnalysis)this.ViewState["PCA"];

            if (this.ViewState["SDA"] != null)
                this.ibtDA = (DescriptiveAnalysis)this.ViewState["SDA"];



        }

        /// <summary>
        /// Salvar ViewState
        /// </summary>
        /// <returns></returns>
        protected override object SaveViewState()
        {

            this.ViewState["ColumnNames"] = this.sourceColumnNames;
            this.ViewState["PCA"] = this.ibt;
            this.ViewState["SDA"] = this.ibtDA;

            return base.SaveViewState();
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            filename = Server.MapPath("~/examples.xls");
            db = new ExcelReader(filename, true, false);

            if (!IsPostBack)
            {
                result = (List<PointData>)Session["Result"];
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

            //data.Series.Add(new Series()
            //{
            //    Name = "Series1",
            //    Color = ColorTranslator.ToHtml(Color.Red),
            //    //Points = result
            //    Points = result
            //});

            for (int i = 0; i < NCluster; i++)
            {
                data.Series.Add(new Series()
                {
                    Name = "Grupo " + (i + 1).ToString(),
                    Color = ColorTranslator.ToHtml(setColorCluster(i)),
                    Points = new List<PointData>()
                });
            }


            //Insere cada ponto em seu respectivo cluster
            for (int i = 0; i < result.Count(); i++)
            {
                data.Series[clustersResult[i]].Points.Add(result[i]);
            }

            #endregion

            //int xAxisMinValue = -15;
            //int yAxisMinValue = -5;
            //int zAxisMinValue = -10;

            //int xAxisMaxValue = 5;
            //int yAxisMaxValue = 15;
            //int zAxisMaxValue = 3;


            data.ChartConfig.xAxisMinValue = Convert.ToInt32(HttpContext.Current.Session["xAxisMinValueS"]);
            data.ChartConfig.yAxisMinValue = Convert.ToInt32(HttpContext.Current.Session["yAxisMinValueS"]);
            data.ChartConfig.zAxisMinValue = Convert.ToInt32(HttpContext.Current.Session["zAxisMinValueS"]);

            data.ChartConfig.xAxisMaxValue = Convert.ToInt32(HttpContext.Current.Session["xAxisMaxValueS"]);
            data.ChartConfig.yAxisMaxValue = Convert.ToInt32(HttpContext.Current.Session["yAxisMaxValueS"]);
            data.ChartConfig.zAxisMaxValue = Convert.ToInt32(HttpContext.Current.Session["zAxisMaxValueS"]);


            var json = JsonHelper.ToJSON<ChartData>(data);


            return json;
        }

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

            // Cria a matriz dos dados do excel
            double[,] tab = (db.GetWorksheet(ddlData.SelectedValue) as DataTable).ToMatrix(out sourceColumnNames);


            //FAZER TUDO AQUI E SE DEUS QUISER SERÁ SUCESSO

            int Nx1, Ny1, NClus, beta;
            double s, Ntotal;
            //string strMensagem;

            Nx1 = tab.GetLength(1);
            Ny1 = tab.GetLength(0);
            NClus = Convert.ToInt32(txtClusters.Text);
            NCluster = Convert.ToInt32(txtClusters.Text);
            beta = Convert.ToInt32(txtBeta.Text);

            s = 0.00;

            //ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + Nx1 + " x" + Ny1 + "');", true);

            for (int i = 0; i < Ny1; i++)
            {

                for (int j = 0; j < Nx1; j++)
                {
                    s += tab[i, j];
                }

            }

            Ntotal = s;

            //CALCULANDO O P(x)
            double[] Px = new double[Nx1];

            for (int j = 0; j < Nx1; j++)
            {
                s = 0;
                for (int i = 0; i < Ny1; i++)
                {
                    s += tab[i, j];
                }
                Px[j] = s / Ntotal;
            }

            dgvProbPYT.DataSource = new ArrayDataView(Px, sourceColumnNames);
            dgvProbPYT.DataBind();


            //PROBABILIDADE CONDICIONAL P(x|y)
            double[,] PCond_xy = new double[tab.GetLength(1), tab.GetLength(0)];

            for (int i = 0; i < Ny1; i++)
            {
                s = 0;
                for (int j = 0; j < Nx1; j++)
                {
                    s += tab[i, j];
                }

                for (int j2 = 0; j2 < Nx1; j2++)
                {
                    PCond_xy[j2, i] = tab[i, j2] / s;
                }
            }

            //PROBABILIDADE CONDICIONAL P(y|x)
            double[,] PCond_yx = new double[tab.GetLength(0), tab.GetLength(1)];

            for (int j = 0; j < Nx1; j++)
            {
                s = 0;
                for (int i1 = 0; i1 < Ny1; i1++)
                {
                    s += tab[i1, j];
                }

                for (int i2 = 0; i2 < Ny1; i2++)
                {
                    PCond_yx[i2, j] = tab[i2, j] / s;
                }
            }

            //dgvStatisticCorrelation.DataSource = new ArrayDataView(PCond_yx, sourceColumnNames);
            //dgvStatisticCorrelation.DataBind();


            /* CRIAÇÃO DO CLUSTER INICIAL
             * NO CASO É A DIVISÃO DA SOMA DA LINHA DIVIDIDO PELO NÚMERO DE CADA POSIÇÃO
             */
            double[,] PInicial = new double[tab.GetLength(0), tab.GetLength(1)];

            for (int i = 0; i < Ny1; i++)
            {
                s = 0;
                for (int j1 = 0; j1 < Nx1; j1++)
                {
                    s += tab[i, j1];
                }

                for (int j2 = 0; j2 < Nx1; j2++)
                {
                    PInicial[i, j2] = tab[i, j2] / s + 0.1;
                }

            }


            //TESTE DE SOMA - APAGAR DEPOIS
            s = 0;
            for (int i = 0; i < NClus; i++)
            {
                for (int j = 0; j < Nx1; j++)
                {
                    s += PInicial[i, j];
                }

            }


            //PROBABILIDADE CONDICIONAL P(x|t)
            double[,] PCond_xt = new double[tab.GetLength(1), NClus];

            for (int i = 0; i < NClus; i++)
            {
                s = 0;
                for (int j1 = 0; j1 < Nx1; j1++)
                {
                    s += PInicial[i, j1];
                }

                for (int j2 = 0; j2 < Nx1; j2++)
                {
                    PCond_xt[j2, i] = PInicial[i, j2] / s;
                }
            }


            //PROBABILIDADE CONDICIONAL P(t|x)
            double[,] PCond_tx = new double[NClus, tab.GetLength(1)];

            for (int j = 0; j < Nx1; j++)
            {
                s = 0;
                for (int i1 = 0; i1 < NClus; i1++)
                {
                    s += PInicial[i1, j];
                }

                for (int i2 = 0; i2 < NClus; i2++)
                {
                    PCond_tx[i2, j] = PInicial[i2, j] / s;
                }
            }


            //P(t)
            double[] Pt = new double[NClus];

            for (int i = 0; i < NClus; i++)
            {
                s = 0;

                for (int j = 0; j < Nx1; j++)
                {
                    s += PInicial[i, j];
                }

                Pt[i] = s / Ntotal;

            }


            //PROBALIDADE CONDICIONAL P(t)
            double[,] PCond_yt = new double[tab.GetLength(0), NClus];
            double[,] Coef_xt = new double[tab.GetLength(1), NClus];
            double[] Z = new double[tab.GetLength(1)];

            for (int iter = 0; iter < 8; iter++)
            {
                for (int i = 0; i < NClus; i++)
                {
                    s = 0;
                    for (int j = 0; j < Nx1; j++)
                    {
                        s += Px[j] * PCond_tx[i, j];
                    }

                    Pt[i] = s;
                }



                //PROBABILIDADE CONDICIONAL P(y|t)
                for (int i = 0; i < Ny1; i++)
                {
                    for (int j = 0; j < NClus; j++)
                    {
                        s = 0;
                        for (int k = 0; k < Nx1; k++)
                        {
                            s += PCond_yx[i, k] * PCond_tx[j, k] * Px[k] / Pt[j];
                        }
                        PCond_yt[i, j] = s;
                    }
                }

                //Coef_yt
                for (int i = 0; i < NClus; i++)
                {
                    for (int j = 0; j < Nx1; j++)
                    {
                        s = 0;
                        for (int k = 0; k < Ny1; k++)
                        {
                            if (PCond_yx[k, j] != 0)
                            {
                                s += PCond_yx[k, j] * Math.Log(PCond_yx[k, j] / PCond_yt[k, i]);
                            }
                        }

                        Coef_xt[j, i] = s;

                    }

                }


                //FUNÇÃO DE PARTIÇÃO
                for (int i = 0; i < Nx1; i++)
                {
                    s = 0;
                    for (int j = 0; j < NClus; j++)
                    {
                        s = s + Pt[j] * Math.Exp(-beta * Coef_xt[i, j]);
                    }

                    Z[i] = s;
                }


                //P(t|x)
                for (int i = 0; i < Nx1; i++)
                {
                    for (int j = 0; j < NClus; j++)
                    {
                        PCond_tx[j, i] = Math.Round(Pt[j] * Math.Exp(-beta * Coef_xt[i, j]) / Z[i], 4);
                    }
                }

            }

            //dgvProbPYT.DataSource = new ArrayDataView(arredondaMatriz(PCond_yt), gerarCabecalho(NClus));
            PCond_yt = arredondaMatriz(PCond_yt, 15);
            dgvProbPYT.DataSource = new ArrayDataView(PCond_yt, gerarCabecalho(NClus));
            dgvProbPYT.DataBind();

            dgvProbPTX.DataSource = new ArrayDataView(PCond_tx, sourceColumnNames);
            dgvProbPTX.DataBind();

            String[] resultFinal = new String[1];
            resultFinal[0] = "Probabilidade em cada cluster";
            dgvProjectionResult.DataSource = new ArrayDataView(montaResultadoFinal(PCond_yt), resultFinal);
            dgvProjectionResult.DataBind();


            //ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('" + montaTextoVetor(Pt, null) + "');", true);

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

        private String montaTextoMatriz(double[,] mat, string[] columNames)
        {

            string strFinal;

            strFinal = "";

            if (columNames != null)
            {
                for (int i = 0; i < columNames.GetLength(0); i++)
                {
                    strFinal += columNames[i];
                    strFinal += " | ";
                }

                strFinal += System.Environment.NewLine;
            }


            if (mat != null)
            {
                for (int i = 0; i < mat.GetLength(0); i++)
                {
                    for (int j = 0; j < mat.GetLength(1); j++)
                    {
                        strFinal += mat[i, j];
                        strFinal += " | ";
                    }
                    strFinal += System.Environment.NewLine;
                }
            }

            return strFinal;
        }

        private String montaTextoVetor(double[] mat, string[] columNames)
        {

            string strFinal;

            strFinal = "";

            if (columNames != null)
            {
                for (int i = 0; i < columNames.GetLength(0); i++)
                {
                    strFinal += columNames[i];
                    strFinal += " | ";
                }

                strFinal += System.Environment.NewLine;
            }


            if (mat != null)
            {
                for (int i = 0; i < mat.GetLength(0); i++)
                {

                    strFinal += mat[i];
                    strFinal += " | ";

                    strFinal += System.Environment.NewLine;
                }
            }

            return strFinal;
        }

        private double[,] arredondaMatriz(double[,] dblMatriz, int qtdeCasas)
        {

            for (int i = 0; i < dblMatriz.GetLength(0); i++)
            {
                for (int j = 0; j < dblMatriz.GetLength(1); j++)
                {
                    dblMatriz[i, j] = Math.Round(dblMatriz[i, j], qtdeCasas);
                }
            }

            return dblMatriz;

        }

        private String[] gerarCabecalho(int qtdeCluster)
        {

            int indiceAux = 0;

            String[] strCabecalho = new String[qtdeCluster];

            for (int i = 0; i < qtdeCluster; i++)
            {
                indiceAux = i + 1;
                strCabecalho[i] = "Cluster " + indiceAux.ToString();
            }


            return strCabecalho;
        }

        private String[,] montaResultadoFinal(double[,] dblMatriz)
        {
            String[,] strResultadoFinal = new String[dblMatriz.GetLength(0), 1];
            double dblMaiorLinha;
            int maiorIndice;
            bool iguais;

            clustersResult = new int[dblMatriz.GetLength(0)];

            for (int i = 0; i < dblMatriz.GetLength(0); i++)
            {
                
                dblMaiorLinha = -1;
                maiorIndice = -1;
                iguais = false;

                for (int j = 0; j < dblMatriz.GetLength(1); j++)
                {
                    
                    if ((dblMatriz[i,j] > dblMaiorLinha) && (dblMatriz[i,j] != 0)) 
                    {
                        dblMaiorLinha = dblMatriz[i, j];
                        maiorIndice = j;
                    }
                    else
                    {
                        if (dblMatriz[i,j] == dblMaiorLinha)
                        {

                            if (iguais == false)
                            {
                                iguais = true;
                            }

                            dblMaiorLinha = dblMatriz[i, j];
                        }
                    }
                }

                if (iguais == false)
                {
                    strResultadoFinal[i, 0] = "Linha: " + (i + 1).ToString() + " - Pertence ao cluster: " + (maiorIndice + 1).ToString() + " - Valor: " + dblMaiorLinha.ToString();
                    clustersResult[i] = maiorIndice;
                }
                else
                {
                    strResultadoFinal[i, 0] = retornaRepetidos(dblMatriz, i, dblMaiorLinha);
                    clustersResult[i] = -1;
                }

            }

            return strResultadoFinal;

        }

        private String retornaRepetidos(double[,] dblMatriz, int intLinha, double valorRepetido)
        {
            String repetidos = "Linha: " + (intLinha + 1).ToString() + " - Repetição nos clusters: ";

            for (int i = 0; i < dblMatriz.GetLength(1); i++)
            {
                if (dblMatriz[intLinha, i] == valorRepetido)
                {
                    repetidos += (i + 1).ToString() + ", ";    
                }

            }

            repetidos = repetidos.Substring(0, repetidos.Length - 2) + ".";

            return repetidos;
        }

        public static Color setColorCluster(int nroCluster)
        {
            Color corCluster = Color.White;
            switch (nroCluster)
            {
                case 0:
                    {
                        corCluster = Color.Red;
                    }
                    break;
                case 1:
                    {
                        corCluster = Color.Blue;
                    }
                    break;
                case 2:
                    {
                        corCluster = Color.Green;
                    }
                    break;
                case 3:
                    {
                        corCluster = Color.Yellow;
                    }
                    break;
                case 4:
                    {
                        corCluster = Color.Black;
                    }
                    break;
                case 5:
                    {
                        corCluster = Color.Magenta;
                    }
                    break;
                case 6:
                    {
                        corCluster = Color.Orange;
                    }
                    break;
                case 7:
                    {
                        corCluster = Color.LightBlue;
                    }
                    break;
                case 8:
                    {
                        corCluster = Color.Silver;
                    }
                    break;
                case 9:
                    {
                        corCluster = Color.MediumAquamarine;
                    }
                    break;
                case 10:
                    {
                        corCluster = Color.Maroon;
                    }
                    break;
                case 11:
                    {
                        corCluster = Color.Purple;
                    }
                    break;
                case 12:
                    {
                        corCluster = Color.Plum;
                    }
                    break;
                case 13:
                    {
                        corCluster = Color.Orchid;
                    }
                    break;
                case 14:
                    {
                        corCluster = Color.Gold;
                    }
                    break;
                case 15:
                    {
                        corCluster = Color.Firebrick;
                    }
                    break;
            }

            return corCluster;
        }


    }
}
