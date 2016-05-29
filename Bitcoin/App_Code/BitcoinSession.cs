using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BitcoinSession
/// </summary>
public class BitcoinSession
{
    public BitcoinSession()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static int LoginMemberId
    {
        get
        {
            var id = HttpContext.Current.Session["LoginMemberId"];
            if (id != null)
                return Convert.ToInt32(id);
            else
                return -1;
        }
        set
        {
            HttpContext.Current.Session["LoginMemberId"] = value;
        }
    }

    public static string LoginMemberEmailID
    {
        get
        {
            var emailID = HttpContext.Current.Session["LoginMemberEmailID"];
            if (emailID != null)
                return emailID.ToString();
            else
                return null;
        }
        set
        {
            HttpContext.Current.Session["LoginMemberEmailID"] = value;
        }
    }
}