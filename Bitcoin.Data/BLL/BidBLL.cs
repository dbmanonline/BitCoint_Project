using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class BidBLL
    {
        private static readonly BidDAL BidDal = new BidDAL();

        public void InsertBid(Bid bid)
        {
            BidDal.InsertBid(bid);
        }

        public Bid GetLatestBid(int userId)
        {
            return BidDal.GetLatestBid(userId);
        }

    }
}
