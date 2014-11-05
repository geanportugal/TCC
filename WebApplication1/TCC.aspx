<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TCC.aspx.cs" Inherits="WebApplication1.TCC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
      <link rel="stylesheet" type="text/css" href="css/bookblock.css" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" />
    <script type="text/javascript" src="js/modernizr.custom.79639.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" CssClass="container" runat="server">
     <div class="menu-panel">
            <h3>Sumário</h3>
            <ul id="menu-toc" class="menu-toc">
                <li class="menu-toc-current"><a href="#item1">Resumo</a></li>
                <li><a href="#item2">Abstract</a></li>
                <li><a href="#item3">Introdução</a></li>
                <li><a href="#item4">Materiais e Métodos</a></li>
                <li><a href="#item5">Materiais e Métodos</a></li>
                <li><a href="#item6">Conclusão</a></li>
            </ul>
            
        </div>
    <div class="bb-custom-wrapper">
            <div id="bb-bookblock" class="bb-bookblock">
                <div class="bb-item" id="item1">
                    <div class="content">
                        <div class="scroller">
                            <h2>Resumo</h2>
                            <p>Este trabalho tem como objetivo simplificar a dimensionalidade de um conjunto de dados em um conjunto de dados de menor dimensão perdendo pouca ou nenhuma qualidade da informação, e através disso relacionar dados aparentemente desconexos.  Utiliza-se para tal, um banco de informações que foram extraídas do PubMed, em que há a frequência de termos específicos (doenças, sintomas, causas) de cada abstract. Vamos estudar como os abstracts estão correlacionados usando a frequência das principais palavras que nele aparecem com o objetivo de auxiliar os profissionais de saúde. Para isso, aplicaremos dois métodos estatístico-matemáticos, o PCA (Principal Component Analysis) e IBM (The Information Bottleneck Method) que nos permitirão encontrar os possíveis agrupamentos dos dados que visualmente não possuem ligações.
                            </p>

                            <p>
                                Esses agrupamentos ficarão visíveis ao término do processamento dos dados pelo PCA, uma técnica de análise multivariada, responsável por indicar os possíveis clusters ou conjuntos de dados que se relacionam. Os possíveis clusters são novamente processados através do método IBM, que analisará essas informações e iniciará o processamento dos dados, e por meio de cálculos estatísticos iterados retorna a quantidade ótima de clusters possíveis indicando quais as informações se relacionaram após as análises. Para isso, foi desenvolvido um sistema computacional que aplica os métodos acima citados para a análise dos dados e retorna de forma tabular e gráfica um resultado de saída. Vislumbrando esses métodos e aplicações nos dias atuais, encontra-se um grande potencial dos métodos aqui citados em aplicações voltadas ao Big Data e entrelaçamento de informações.
                            </p>

                 

                            
                        </div>
                    </div>
                </div>
                <div class="bb-item" id="item2">
                    <div class="content">
                        <div class="scroller">
                            <h2>Abstract</h2>
                            <p>
                                This work aims to simplify the dimensionality of a data set in a data set smaller losing little or no quality of information, and thereby correlate seemingly unrelated data. Used to such a database of information that have been extracted from PubMed, where there is the frequency of specific terms (diseases, symptoms, causes) of each abstract. Let's study how abstracts are correlated using the frequency of the main words that appear in it with the goal of helping health professionals. For this, we apply two statistical-mathematical methods, PCA (Principal Component Analysis) and IBM (The Information Bottleneck Method) that allow us to find the possible groupings of data that does not visually link. These groupings are visible at the end of processing the data by PCA, a technique of multivariate analysis, responsible for indicating the possible clusters or sets of data are related.
                            </p>

                            <p>
                                Possible clusters are again processed through the IBM method, we analyze this information and start processing data, and through statistical calculations iterated returns the optimal amount of possible clusters indicating the information is related after the analysis. Thus, a computer system that implements the aforementioned methods for analyzing the data and returns in tabular and graphical output the result was developed. Glimpsing these methods and applications today, is a big potential of the methods mentioned here in applications related to Big Data and interweaving of information.
                            </p>

                            
                        </div>
                    </div>
                </div>
                <div class="bb-item" id="item3">
                    <div class="content">
                        <div class="scroller">
                            <h2>Introdução</h2>
                            <p>Segundo dados da OMS 2013, (ORGANIZAÇÃO MUNDIAL DA SAÚDE, 2013) doenças crônicas matam aproximadamente 36 milhões de pessoas por ano, cerca de 60% das mortes, já no Brasil segundo dados do Ministério da Saúde, as mortes por condições crônicas correspondem a 72% das mortes. Doença crônica é uma doença de longa duração e, geralmente, de progressão lenta.</p>

                            <p>
                                Algumas dessas doenças são herdadas pela Epigenética (do grego “epi” significa “acima ou sobre algo”). Segundo Tang e Ho (PUBMED, 2007) a epigenética é definida pelas mudanças herdáveis na expressão do gene que não alteram a sequência do DNA pela mitose e ao longo das gerações. Já Feinberg (2004) a define como modificações no genoma que são herdadas pela divisão celular, não tendo relação com mudanças na sequência do DNA.
                            </p>

                            <p>
                                Com as mudanças ocorridas no estilo de vida da humanidade nos últimos 80 anos, o aumento do estresse, sedentarismo e a introdução de substâncias químicas no meio ambiente, a epigenética engloba a geração e a amplificação de muitas dessas doenças crônicas. Segundo estudo publicado pela revista cientifica Scientific American Brasil (SCIENTIFIC AMERICAN BRASIL, 2011) os cientistas demostraram que vários tipos de estresses induziram mudanças epigenética, mas os fatores subadjacentes envolvidos permanecem desconhecidos. Ao analisar as mutações nos genes, observaram uma desorganização na estrutura da heterocromática e metilação reduzida de proteínas histonas, o principal componente da cromatina. Outras análises mostraram que as exposições destas células ao estresse osmótico e choque de calor geraram uma desorganização da heterocromática que foi transmitida para a próxima geração de células sem alterar sua sequência de DNA, em outras analises o choque de calor provocou transmissões para duas gerações de células.
                            </p>

                            <p>
                                Em outro caso apresentado por Brona McVittie (SCIENCE SCHOOL, 2006) trata de dois irmãos gêmeos idênticos monozigóticos Jason e Gavin que geneticamente são iguais, mas não epigeneticamente. Ambos os irmãos possuíam fatores de risco para desenvolverem diabetes do tipo II, mas apenas Jason foi diagnosticado com a doença após uma infecção pancreática e teve que iniciar a auto administração de insulina. Os médicos não conseguiram estabelecer um diagnóstico preciso, mas segundo Fraga (2005) se os médicos tivessem a sua disposição melhores ferramentas de diagnósticos, como as que oferecem avanços na investigação epigenética, eles poderiam ter descoberto o que havia de errado com Jason.
                            </p>

                            <p>
                                Nesse mesmo período houve um enorme avanço da tecnologia, gerando melhor desempenho dos hardwares e softwares, resultando assim em melhores condições para o tratamento de grandes quantidades de dados. Com base nessa evolução encontra-se a possibilidade de criar aplicações computacionais que consigam conectar características semelhantes em dados desconexos através de métodos matemático-estatísticos. Toma-se como exemplo o método PCA (Principal Component Analysis), um método matemático desenvolvido em 1901 por Karl Pearson que utiliza uma transformação ortogonal para converter um conjunto de características de variáveis possivelmente correlacionadas a um conjunto de valores de variáveis linearmente descorrelacionadas chamadas componentes principais. Dessa forma é possível desenvolver computacionalmente mecanismos possam relacionar os sintomas e características de cada doença com seus respectivos diagnósticos, podendo assim facilitar na recomendação dessas informações no campo da medicina.
                            </p>

                            <p>
                                Neste estudo será abordada a epigenética através de métodos matemáticos, estatísticos e computacionais para os estudos dessas doenças crônicas e tentar estabelecer fatores de riscos em pacientes através do seu histórico médico.
                            </p>

                            <p>
                                Em um segundo caso, o processamento dos dados de prontuários médicos, buscando relacionar certas pesquisas (de termos, palavras, etc) com o assunto relatado no prontuário, podendo assim sinalizar qual a relação da busca com o prontuário e seus respectivos históricos médicos, doenças e sintomas. Para isso será utilizado o método IBM ( Information Bottleneck Method), método introduzido por Naftali Tishby (2009), baseado em Teoria de Informação, cujo objetivo é a compressão de informação sem perda de relevância.
                            </p>

                            
                        </div>
                    </div>
                </div>
                <div class="bb-item" id="item4">
                    <div class="content">
                        <div class="scroller">
                            <h2>A drawing joke</h2>
                            <p>
                                Several kings and great lords are made mention of as being particularly
                                fond of using the lancet. Peter the Great of Russia was remarkably fond of
                                witnessing dissections and surgical operations. He even used to carry a
                                case of instruments in his pocket. He often visited the hospitals to
                                witness capital operations, at times assisting in person, and was able to
                                dissect properly, to bleed a patient, and extract a tooth as well as one
                                of the faculty.
                            </p>

                            <p>
                                The pretty wife of one of the czar's valets had the following unpleasant
                                experience of his skill. The husband of the "maid" accused her of
                                flirting, and vowed revenge. The czar noticed the valet seated in the
                                ante-room, looking forlorn, and asked the cause of his dejection. The
                                wicked valet replied that his wife had a tooth which gave her great pain,
                                keeping them both awake day and night, but would not have it drawn.
                            </p>

                            <p>"Send her to me," said the czar.</p>

                            <p>
                                The woman was brought, but persisted in affirming that her teeth were
                                sound, and never ached. The valet alleged that this was always the way she
                                did when the physician was called; therefore, in spite of her cries and
                                remonstrances, the king ordered her husband to hold her head between his
                                knees, when the czar drew out his instruments and instantly extracted the
                                tooth designated by the husband, disregarding the cries of the unfortunate
                                victim.
                            </p>

                            <p>
                                In a few days the czar was informed that the thing was a put-up job by the
                                jealous husband, in order to punish, if not mar the beauty of, his gallant
                                wife, whereupon the instruments were again brought into requisition; and
                                this time the naughty valet was the sufferer, to the extent of losing a
                                sound and valuable tooth.
                            </p>

                            <p><em>From <a href="http://www.gutenberg.org/ebooks/41595" target="_blank">"The Funny Side of Physic"</a> by A. D. Crabtre</em></p>
                        </div>
                    </div>
                </div>
                <div class="bb-item" id="item5">
                    <div class="content">
                        <div class="scroller">
                            <h2>Commencing practice</h2>
                            <p>
                                From that excellent work, "Scenes in the Practice of a New York Surgeon,"
                                by Dr. E. H. Dixon, I copy, with some abbreviation, the following, which
                                the author terms "Leaves from the Log-book of an Unfledged Æsculapian:"--
                            </p>

                            <p>
                                "In the year 1830 I was sent forth, like our long-suffering and
                                much-abused prototype,--old father Noah's crow,--from the ark of safety,
                                the old St. Duane Street College. I pitched my tent, and set up my trap,
                                in what was then a fashionable up-town street.
                            </p>

                            <p>
                                "I hired a modest house, and had my arm-chair, my midnight couch, and my
                                few books in my melancholy little office, and I confess that I now and
                                then left an amputating-knife, or some other awful-looking instrument, on
                                the table, to impress the poor women who came to me for advice.
                            </p>

                            <p>
                                "These little matters, although the 'Academy' would frown upon them, I
                                considered quite pardonable. God knows I would willingly have adopted
                                their most approved method of a splendid residence, and silver-mounted
                                harnesses for my bays; but they were yet in dream-land, eating moonbeams,
                                and my vicious little nag had nearly all this time to eat his oats and
                                nurse his bad temper in his comfortable stable.
                            </p>

                            <p>
                                "In this miserable way I read over my old books, watered my
                                rose-bushes,--sometimes with tears,--drank my tea and ate my toast, and
                                occasionally listened to the complaint of an unfortunate Irish damsel,
                                with her customary account of 'a pain in me side an' a flutterin' about me
                                heart.' At rare intervals I ministered to some of her countrywomen in
                                their fulfilment of the great command when placed in the Garden of Eden.
                                (What a dirty place it would have been if inhabited by Irish women!)
                            </p>

                            <p>
                                "And thus I spent nearly a year without a single call to any person of
                                character. I think I should have left in despair if it had not been for a
                                lovely creature up the street. She was the wife of a distinguished fish
                                merchant down town.
                            </p>

                            <p>
                                "This lovely woman was Mrs. Mackerel. I will explain how it was that I
                                was summoned to her ladyship's mansion, and had the pleasure of seeing Mr.
                                Mackerel, of the firm of 'Mackerel, Haddock &amp; Dun.'
                            </p>

                            <p>
                                "One bitter cold night in January, just as I was about to retire, a
                                furious ring at the front door made me feel particularly amiable! A
                                servant announced the sudden and alarming illness of Mrs. Mackerel, with
                                the assurance that as the family physician was out of town, Mrs. M. would
                                be obliged if I would immediately visit her. Accordingly, I soon found
                                myself in the presence of the accomplished lady, having--I confess
                                it--given my hair an extra touch as I entered the beautiful chamber.
                            </p>

                            <p>
                                "Mrs. Mackerel was not a bad-tempered lady; she was only a beautiful
                                fool--nothing less, dear reader, or she would have never married old
                                Mackerel. Her charms would have procured her a husband of at least a
                                tolerable exterior. His physiognomy presented a remarkable resemblance to
                                his namesake. Besides, he chewed and smoked, and the combination of the
                                aroma of his favorite luxuries with the articles of his merchandise must
                                have been most uncongenial to the curve of such lips and such nostrils as
                                Mrs. Mackerel's.
                            </p>

                            <p>
                                "I was received by Mr. Mackerel in a manner that increased observation has
                                since taught me is sufficiently indicative of the hysterical _finale_ of a
                                domestic dialogue. He was not so obtuse as to let me directly into the
                                true cause of his wife's nervous attack and his own collectedness, and yet
                                he felt it would not answer to make too light of it before me.
                            </p>

                            <p>
                                "Mr. and Mrs. M. had just returned from a party. (The party must be the
                                'scape-goat'!) He assured me that as the lady was in the full enjoyment of
                                health previously, he felt obliged to attribute the cause of her attack
                                and speechless condition--for she spoke not one word, or gave a sign--to
                                the dancing, heated room, and the supper.
                            </p>

                            <p>
                                "I was fully prepared to realize the powers of ice-cream, cake, oranges,
                                chicken-salad, oysters, sugar-plums, punch, and champagne, and at one
                                moment almost concluded to despatch a servant for an emetic of ipecac;
                                but--I prudently avoided it. Aside from the improbability of excess of
                                appetite through the portal of such a mouth, the lovely color of the
                                cheeks and lips utterly forbade a conclusion favorable to Mr. Mackerel's
                                solution of the cause.
                            </p>

                            <p>
                                "I placed my finger on her delicate and jewelled wrist. All seemed calm as
                                the thought of an angel's breast!

                            <p>
                                "I was nonplussed. 'Could any tumultuous passion ever have agitated that
                                bosom so gently swelling in repose?'
                            </p>

                            <p>
                                "Mackerel's curious questions touching my sagacity as to his wife's
                                condition received about as satisfactory a solution as do most questions
                                put to me on the cause and treatment of diseases; and having tolerably
                                befogged him with opinions, and lulled his suspicions to rest, by the
                                apparent innocent answers to his leading questions, he arrived at the
                                conclusion most desirable to him, viz., that I was a fool--a conviction
                                quite necessary in some nervous cases....
                            </p>

                            <p>
                                "So pleased was Mr. M. with the soothing influences of my brief visit that
                                he very courteously waited on me to the outside door, instead of ordering
                                a servant to show me out, and astonished me by desiring me to call on the
                                patient again in the morning.
                            </p>

                            <p>
                                "After my usual diversion of investigating 'a pain an' a flutterin' about
                                me heart,' and an 'O, I'm kilt intirely,' I visited Mrs. Mackerel, and had
                                the extreme pleasure of finding her quite composed, and in conversation
                                with her fashionable friend, Mrs. Tiptape. The latter was the daughter of
                                a 'retired milliner,' and had formed a desirable union with Tiptape, the
                                eminent dry goods merchant. Fortunately--for she was a woman of
                                influence--I passed the critical examination of Mrs. T. unscathed by her
                                sharp black eyes, and, as the sequel will show, was considered by her
                                'quite an agreeable person.'
                            </p>

                            <p>
                                "Poor Mrs. Mackerel, notwithstanding her efforts to conceal it, had
                                evidently received some cruel and stunning communication from her husband
                                on the night of my summons; her agitated circulation during the fortnight
                                of my attendance showed to my conviction some persistent and secret cause
                                for her nervousness.
                            </p>

                            <p>
                                "One evening she assured me that she felt she should now rapidly recover,
                                as Mr. Mackerel had concluded to take her to Saratoga. I, of course,
                                acquiesced in the decision, though my previous opinion had not been asked.
                                I took a final leave of the lovely woman, and the poor child soon departed
                                for Saratoga.
                            </p>

                            <p>
                                "The ensuing week there was a sheriff's sale at Mackerel's residence. The
                                day following the Mackerels' departure, Mr. Tiptape did me the honor to
                                inquire after the health of my family; and a week later, Master Tiptape
                                having fallen and bumped his dear nose on the floor, I had the felicity of
                                soothing the anguish of his mamma in her magnificent _boudoir_, and
                                holding to her lovely nose the smelling salts, and offering such
                                consolation as her trying position required!"
                            </p>

                            <p>
                                Thus was commenced the practice of one of the first physicians of New
                                York. The facts are avouched for. The names, of course, are manufactured,
                                to cover the occupation of the parties. The doctor still lives, in the
                                enjoyment of a lucrative and respectable practice, and the love and
                                confidence of his numerous friends and patrons.
                            </p>

                            <p>
                                Quite as ludicrous scenes could be revealed by most physicians, if they
                                would but take the time to think over their earlier efforts, and the
                                various circumstances which were mainly instrumental in getting them into
                                a respectable practice.
                            </p>

                            <p><em>From <a href="http://www.gutenberg.org/ebooks/41595" target="_blank">"The Funny Side of Physic"</a> by A. D. Crabtre</em></p>
                        </div>
                    </div>
                </div>
                <div class="bb-item" id="item6">
                    <div class="content">
                        <div class="scroller">
                            <h2>Commencing practice</h2>
                            <p>
                                From that excellent work, "Scenes in the Practice of a New York Surgeon,"
                                by Dr. E. H. Dixon, I copy, with some abbreviation, the following, which
                                the author terms "Leaves from the Log-book of an Unfledged Æsculapian:"--
                            </p>

                            <p>
                                "In the year 1830 I was sent forth, like our long-suffering and
                                much-abused prototype,--old father Noah's crow,--from the ark of safety,
                                the old St. Duane Street College. I pitched my tent, and set up my trap,
                                in what was then a fashionable up-town street.
                            </p>

                            <p>
                                "I hired a modest house, and had my arm-chair, my midnight couch, and my
                                few books in my melancholy little office, and I confess that I now and
                                then left an amputating-knife, or some other awful-looking instrument, on
                                the table, to impress the poor women who came to me for advice.
                            </p>

                            <p>
                                "These little matters, although the 'Academy' would frown upon them, I
                                considered quite pardonable. God knows I would willingly have adopted
                                their most approved method of a splendid residence, and silver-mounted
                                harnesses for my bays; but they were yet in dream-land, eating moonbeams,
                                and my vicious little nag had nearly all this time to eat his oats and
                                nurse his bad temper in his comfortable stable.
                            </p>

                            <p>
                                "In this miserable way I read over my old books, watered my
                                rose-bushes,--sometimes with tears,--drank my tea and ate my toast, and
                                occasionally listened to the complaint of an unfortunate Irish damsel,
                                with her customary account of 'a pain in me side an' a flutterin' about me
                                heart.' At rare intervals I ministered to some of her countrywomen in
                                their fulfilment of the great command when placed in the Garden of Eden.
                                (What a dirty place it would have been if inhabited by Irish women!)
                            </p>

                            <p>
                                "And thus I spent nearly a year without a single call to any person of
                                character. I think I should have left in despair if it had not been for a
                                lovely creature up the street. She was the wife of a distinguished fish
                                merchant down town.
                            </p>

                            <p>
                                "This lovely woman was Mrs. Mackerel. I will explain how it was that I
                                was summoned to her ladyship's mansion, and had the pleasure of seeing Mr.
                                Mackerel, of the firm of 'Mackerel, Haddock &amp; Dun.'
                            </p>

                            <p>
                                "One bitter cold night in January, just as I was about to retire, a
                                furious ring at the front door made me feel particularly amiable! A
                                servant announced the sudden and alarming illness of Mrs. Mackerel, with
                                the assurance that as the family physician was out of town, Mrs. M. would
                                be obliged if I would immediately visit her. Accordingly, I soon found
                                myself in the presence of the accomplished lady, having--I confess
                                it--given my hair an extra touch as I entered the beautiful chamber.
                            </p>

                            <p>
                                "Mrs. Mackerel was not a bad-tempered lady; she was only a beautiful
                                fool--nothing less, dear reader, or she would have never married old
                                Mackerel. Her charms would have procured her a husband of at least a
                                tolerable exterior. His physiognomy presented a remarkable resemblance to
                                his namesake. Besides, he chewed and smoked, and the combination of the
                                aroma of his favorite luxuries with the articles of his merchandise must
                                have been most uncongenial to the curve of such lips and such nostrils as
                                Mrs. Mackerel's.
                            </p>

                            <p>
                                "I was received by Mr. Mackerel in a manner that increased observation has
                                since taught me is sufficiently indicative of the hysterical _finale_ of a
                                domestic dialogue. He was not so obtuse as to let me directly into the
                                true cause of his wife's nervous attack and his own collectedness, and yet
                                he felt it would not answer to make too light of it before me.
                            </p>

                            <p>
                                "Mr. and Mrs. M. had just returned from a party. (The party must be the
                                'scape-goat'!) He assured me that as the lady was in the full enjoyment of
                                health previously, he felt obliged to attribute the cause of her attack
                                and speechless condition--for she spoke not one word, or gave a sign--to
                                the dancing, heated room, and the supper.
                            </p>

                            <p>
                                "I was fully prepared to realize the powers of ice-cream, cake, oranges,
                                chicken-salad, oysters, sugar-plums, punch, and champagne, and at one
                                moment almost concluded to despatch a servant for an emetic of ipecac;
                                but--I prudently avoided it. Aside from the improbability of excess of
                                appetite through the portal of such a mouth, the lovely color of the
                                cheeks and lips utterly forbade a conclusion favorable to Mr. Mackerel's
                                solution of the cause.
                            </p>

                            <p>
                                "I placed my finger on her delicate and jewelled wrist. All seemed calm as
                                the thought of an angel's breast!

                            <p>
                                "I was nonplussed. 'Could any tumultuous passion ever have agitated that
                                bosom so gently swelling in repose?'
                            </p>

                            <p>
                                "Mackerel's curious questions touching my sagacity as to his wife's
                                condition received about as satisfactory a solution as do most questions
                                put to me on the cause and treatment of diseases; and having tolerably
                                befogged him with opinions, and lulled his suspicions to rest, by the
                                apparent innocent answers to his leading questions, he arrived at the
                                conclusion most desirable to him, viz., that I was a fool--a conviction
                                quite necessary in some nervous cases....
                            </p>

                            <p>
                                "So pleased was Mr. M. with the soothing influences of my brief visit that
                                he very courteously waited on me to the outside door, instead of ordering
                                a servant to show me out, and astonished me by desiring me to call on the
                                patient again in the morning.
                            </p>

                            <p>
                                "After my usual diversion of investigating 'a pain an' a flutterin' about
                                me heart,' and an 'O, I'm kilt intirely,' I visited Mrs. Mackerel, and had
                                the extreme pleasure of finding her quite composed, and in conversation
                                with her fashionable friend, Mrs. Tiptape. The latter was the daughter of
                                a 'retired milliner,' and had formed a desirable union with Tiptape, the
                                eminent dry goods merchant. Fortunately--for she was a woman of
                                influence--I passed the critical examination of Mrs. T. unscathed by her
                                sharp black eyes, and, as the sequel will show, was considered by her
                                'quite an agreeable person.'
                            </p>

                            <p>
                                "Poor Mrs. Mackerel, notwithstanding her efforts to conceal it, had
                                evidently received some cruel and stunning communication from her husband
                                on the night of my summons; her agitated circulation during the fortnight
                                of my attendance showed to my conviction some persistent and secret cause
                                for her nervousness.
                            </p>

                            <p>
                                "One evening she assured me that she felt she should now rapidly recover,
                                as Mr. Mackerel had concluded to take her to Saratoga. I, of course,
                                acquiesced in the decision, though my previous opinion had not been asked.
                                I took a final leave of the lovely woman, and the poor child soon departed
                                for Saratoga.
                            </p>

                            <p>
                                "The ensuing week there was a sheriff's sale at Mackerel's residence. The
                                day following the Mackerels' departure, Mr. Tiptape did me the honor to
                                inquire after the health of my family; and a week later, Master Tiptape
                                having fallen and bumped his dear nose on the floor, I had the felicity of
                                soothing the anguish of his mamma in her magnificent _boudoir_, and
                                holding to her lovely nose the smelling salts, and offering such
                                consolation as her trying position required!"
                            </p>

                            <p>
                                Thus was commenced the practice of one of the first physicians of New
                                York. The facts are avouched for. The names, of course, are manufactured,
                                to cover the occupation of the parties. The doctor still lives, in the
                                enjoyment of a lucrative and respectable practice, and the love and
                                confidence of his numerous friends and patrons.
                            </p>

                            <p>
                                Quite as ludicrous scenes could be revealed by most physicians, if they
                                would but take the time to think over their earlier efforts, and the
                                various circumstances which were mainly instrumental in getting them into
                                a respectable practice.
                            </p>

                            <p><em>From <a href="http://www.gutenberg.org/ebooks/41595" target="_blank">"The Funny Side of Physic"</a> by A. D. Crabtre</em></p>
                        </div>
                    </div>
                </div>
            </div>

            <nav>
                <span id="bb-nav-prev">&larr;</span>
                <span id="bb-nav-next">&rarr;</span>
            </nav>

            <span id="tblcontents" class="menu-button">Table of Contents</span>

        </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" src="js/jquerypp.custom.js"></script>
    <script type="text/javascript" src="js/jquery.bookblock.js"></script>
    <script type="text/javascript" src="js/page.js"></script>
    <script type="text/javascript">
        $(function () {

            Page.init();

        });
    </script>
    
</asp:Content>
