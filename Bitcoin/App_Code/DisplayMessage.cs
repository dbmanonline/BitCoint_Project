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

    /// <summary>
    /// Display a alert dialog
    /// </summary>
    /// <param name="functionName">Function name which call to modal</param>
    /// <param name="page">Current page</param>
    public static void ShowAlertModal(string functionName, Page page)
    {
        ScriptManager.RegisterStartupScript(page, typeof(Page), "AlertModal", functionName, true);
    }
}