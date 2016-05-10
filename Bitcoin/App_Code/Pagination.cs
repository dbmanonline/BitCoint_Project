using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Pagination class
/// </summary>
public class Pagination
{
    static int _stt = 1;
    public static void PageIndexChanging(GridView grid, GridViewPageEventArgs e)
    {
        grid.PageIndex = e.NewPageIndex;
        int trangThu = e.NewPageIndex;
        int soDong = grid.PageSize;

        _stt = trangThu * soDong + 1;
    }
}