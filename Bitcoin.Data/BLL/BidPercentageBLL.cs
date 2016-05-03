using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bitcoin.Data.BLL
{
    public class BidPercentageBLL
    {
        private static BidPercentageDAL _bidPercentageDAL = new BidPercentageDAL();

        public BidPercentage GetCurrentPercentage()
        {
            return _bidPercentageDAL.GetCurrentPercentage();  
        }
    }
}
