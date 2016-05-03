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
        private static readonly BidDAL _bidDal = new BidDAL();

        public void InsertBid(Bid bid)
        {
            // Prefix of Bid is GP
            bid.BidCode = "GP" + bid.BidCode;
            _bidDal.InsertBid(bid);
        }

        public Bid GetLatestBid(int userId)
        {
            return _bidDal.GetLatestBid(userId);
        }

        public void DeleteBid(Bid bid)
        {
            _bidDal.DeleteBid(bid);
        }

        public IEnumerable<Bid> GetAllBids()
        {
            return _bidDal.GetAllBids();
        }

        public Bid GetBidById(string bidCode)
        {
            return _bidDal.GetBidById(bidCode);
        }

        public void UpdateBid(Bid bid)
        {
            _bidDal.UpdateBid(bid);
        }
    }
}
