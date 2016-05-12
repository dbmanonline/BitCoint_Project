using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class OrderBLL
    {
        private static readonly OrderDAL _bidDal = new OrderDAL();

        public void InsertBid(Order order)
        {
            _bidDal.InsertBid(order);
        }

        public void DeleteBid(Order order)
        {
            _bidDal.DeleteBid(order);
        }

        public IEnumerable<Order> GetAllBids()
        {
            return _bidDal.GetAllBids();
        }

        public Order GetBidById(string bidCode)
        {
            return _bidDal.GetBidById(bidCode);
        }

        public void UpdateBid(Order bid)
        {
            _bidDal.UpdateBid(bid);
        }

        public IEnumerable<Order> GetAllUserPH(int userId)
        {
            var orders = _bidDal.GetAllBids()
                .Where(x => x.UserID == userId && x.Status == 0 && x.Type == "PH")
                .OrderByDescending(x => x.OrderNumber);
            return orders;
        }

        public Order GetLatestUserPH(int userId)
        {
            var order = GetAllUserPH(userId)
                .FirstOrDefault(x => x.Type == "PH");
            return order;
        }

        public bool CheckBidCodeIsExists(string orderCode)
        {
            var checkBidCodeExists = _bidDal.GetAllBids().Any(x => x.OrderCode == orderCode);
            return checkBidCodeExists == true;
        }
    }
}
