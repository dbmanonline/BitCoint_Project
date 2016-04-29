using System;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for DisplayMessage
/// </summary>
public class DisplayMessage
{
    /// <summary>
    /// Show a message after insert, update or delete
    /// </summary>
    /// <param name="content">message's content</param>
    /// <param name="page">current page</param>
    public static void ShowMessage(string content, Page page)
    {
        ScriptManager.RegisterStartupScript(page, typeof(Page), "MyScript", "alert('" + content + "');", true);
    }
}