using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using Word = Microsoft.Office.Interop.Word;
using System.Data.SqlClient;

namespace CourseProject
{
    public enum ReportType { T1, T2, T3 };
    class ReportWord
    {
        /// <summary>
        /// створення звіту в Word
        /// </summary>
        /// <param name="a">значення із БД</param>
        /// <param name="name">запит</param>
        /// <param name="type">тип запиту</param>
        static public void repot_word(String command, bool x)
        {
            Microsoft.Office.Interop.Word.Application wordApp = new Microsoft.Office.Interop.Word.Application();
            Microsoft.Office.Interop.Word.Document wordDoc;
            Microsoft.Office.Interop.Word.Paragraph wordParag;
            Microsoft.Office.Interop.Word.Table wordTable;
            DataTable table = new DataTable();
            try
            {
                // Specify a connection string. Replace the given value with a 
                // valid connection string for a Northwind SQL Server sample
                // database accessible to your system.

                // Create a new data adapter based on the specified query.
                SqlDataAdapter dataAdapter = new SqlDataAdapter(command, "Integrated Security=SSPI;Persist Security Info=False;" +
                               "Initial Catalog=CourseProject;Data Source=localhost");

                // Create a command builder to generate SQL update, insert, and
                // delete commands based on selectCommand. These are used to
                // update the database.
                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);

                // Populate a new data table and bind it to the BindingSource.
                
                table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                dataAdapter.Fill(table);
                
                // Resize the DataGridView columns to fit the newly loaded content.
               // return table;

            }
            catch (SqlException)
            {

            }
           

            string fileName = @"C:\Test\report.docx";
            try
            {
                

                //создаём новый документ Word и задаём параметры листа
                wordDoc = wordApp.Documents.Add(Type.Missing, Type.Missing, Type.Missing, Type.Missing); //создаём документ Word
                wordApp.ActiveDocument.PageSetup.BottomMargin = 20f;//задаём верхний отступ
                wordApp.ActiveDocument.PageSetup.TopMargin = 20f;// и нижний
                wordApp.ActiveDocument.PageSetup.LeftMargin = 30f;//задаём левый отступ 
                wordApp.ActiveDocument.PageSetup.RightMargin = 20f;// и правый
                // первый параграф

                wordParag = wordDoc.Paragraphs.Add(Type.Missing);
                wordParag.Range.Font.Name = "Times New Roman";
                wordParag.Range.Font.Size = 14;
                wordParag.Range.Font.Bold = 1;
                wordParag.Range.Text = "Звіт";
                wordParag.Range.Paragraphs.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphCenter;
                
                // второй параграф, таблица из 10 строк и 2 колонок
                wordDoc.Paragraphs.Add(Type.Missing);
                wordParag.Range.Paragraphs.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphLeft;
                wordParag.Range.Tables.Add(wordParag.Range, table.Rows.Count + 1, table.Rows[0].ItemArray.Length + 1, Type.Missing, Type.Missing);
                wordTable = wordDoc.Tables[1];
                wordParag.Range.Font.Name = "Times New Roman";
                wordTable.Range.Font.Bold = 0;
                wordTable.Range.Font.Size = 12;
                wordParag.Range.Paragraphs.Alignment = Microsoft.Office.Interop.Word.WdParagraphAlignment.wdAlignParagraphLeft;
                //задаём ширину колонок и высоту строк
                wordTable.Columns.PreferredWidthType = Microsoft.Office.Interop.Word.WdPreferredWidthType.wdPreferredWidthPoints;
                wordTable.Columns[1].SetWidth(35f, Microsoft.Office.Interop.Word.WdRulerStyle.wdAdjustNone);
                wordTable.Columns[2].SetWidth(150f, Microsoft.Office.Interop.Word.WdRulerStyle.wdAdjustNone);
                wordTable.Columns[3].SetWidth(150f, Microsoft.Office.Interop.Word.WdRulerStyle.wdAdjustNone);
                wordTable.Rows.SetHeight(20f, Microsoft.Office.Interop.Word.WdRowHeightRule.wdRowHeightExactly);
                wordTable.Rows.Alignment = Microsoft.Office.Interop.Word.WdRowAlignment.wdAlignRowCenter;
                wordTable.Range.Cells.VerticalAlignment = Microsoft.Office.Interop.Word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;
                wordTable.Range.Select();

                wordTable.Cell(1, 1).Range.Text = "№";
                wordTable.Cell(1, 2).Range.Text = "Назва послуги".ToString();
                if (x)
                wordTable.Cell(1, 3).Range.Text = "Кількість клієнтів".ToString();
                else
                    wordTable.Cell(1, 3).Range.Text = "Прибуток".ToString();

                int k = 1;
                //заполняем ячейки таблицы
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    System.Data.DataRow row = table.Rows[i];
                    wordTable.Cell(i + 2, 1).Range.Text = k++.ToString();

                    for (int j = 0; j < row.ItemArray.Length; j++)
                    {

                        wordTable.Cell(i + 2, j + 2).Range.Text = row.ItemArray[j].ToString();
                    }
                }
                Word.Border[] borders = new Word.Border[6];//массив бордеров
                borders[0] = wordTable.Borders[Word.WdBorderType.wdBorderLeft];//левая граница 
                borders[1] = wordTable.Borders[Word.WdBorderType.wdBorderRight];//правая граница 
                borders[2] = wordTable.Borders[Word.WdBorderType.wdBorderTop];//нижняя граница 
                borders[3] = wordTable.Borders[Word.WdBorderType.wdBorderBottom];//верхняя граница
                borders[4] = wordTable.Borders[Word.WdBorderType.wdBorderHorizontal];//горизонтальная граница
                borders[5] = wordTable.Borders[Word.WdBorderType.wdBorderVertical];//вертикальная граница
                foreach (Word.Border border in borders)
                {
                    border.LineStyle = Word.WdLineStyle.wdLineStyleSingle;//ставим стиль границы 
                    border.Color = Word.WdColor.wdColorBlack;//задаем цвет границы
                }
                //сохраняем документ, закрываем документ, выходим из Word
                wordDoc.SaveAs(fileName);
               // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('СОХРАНЯЕМ ФАЙЛИК')</SCRIPT>");
                wordApp.ActiveDocument.Close();
                System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Файл успішно збережено: C -> Test -> report.docx')</SCRIPT>");
                wordApp.Quit();
               // System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('ВЫХОДИМ ИЗ ВОРДА')</SCRIPT>");
               // System.Diagnostics.Process.Start(fileName);
            }
            catch (Exception ex) { System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('ПРОБЛЕМА')</SCRIPT>"); }

        }
    }
}
