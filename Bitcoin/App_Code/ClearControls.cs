using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for ClearControls
/// </summary>
public class ClearControls
{
    public static void ClearControl(Control control)
    {
        var textbox = control as TextBox;
        if (textbox != null)
            textbox.Text = string.Empty;

        var checkbox = control as CheckBox;
        if (checkbox != null)
            checkbox.Checked = false;

        var dropDownList = control as DropDownList;
        if (dropDownList != null)
            dropDownList.SelectedIndex = 0;

        foreach (Control childControl in control.Controls)
        {
            ClearControl(childControl);
        }
    }
}