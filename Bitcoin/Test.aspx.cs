using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bitcoin.Data.DTO;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BitcoinEntities db = new BitcoinEntities();

            var query = db.Bid.Count();

            Response.Write(query.ToString());
        }
    }
}