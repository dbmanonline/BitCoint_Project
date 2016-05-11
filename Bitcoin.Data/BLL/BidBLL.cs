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
            _bidDal.InsertBid(bid);
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

        public IEnumerable<Bid> GetAllUserBids(int userId)
        {
            var bids = _bidDal.GetAllBids()
                .Where(x => x.UserID == userId && x.Status == 0)
                .OrderByDescending(x => x.Order);
            return bids;
        }

        public bool CheckBidCodeIsExists(string bidCode)
        {
            var checkBidCodeExists = _bidDal.GetAllBids().Any(x => x.BidCode == bidCode);
            if (checkBidCodeExists == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
