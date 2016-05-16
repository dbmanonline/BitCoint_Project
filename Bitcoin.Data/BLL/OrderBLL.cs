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
        private static readonly OrderDAL _orderDal = new OrderDAL();

        public void InsertOrder(Order order)
        {
            _orderDal.InsertOrder(order);
        }

        public void DeleteOrder(Order order)
        {
            _orderDal.DeleteOrder(order);
        }

        public IEnumerable<Order> GetAllOrders()
        {
            return _orderDal.GetAllOrders();
        }

        public Order GetByOrderCode(string orderCode)
        {
            return _orderDal.GetOrderByCode(orderCode);
        }

        public void UpdateOrder(Order order)
        {
            _orderDal.UpdateOrder(order);
        }

        public IEnumerable<Order> GetAllUserPH(int userId)
        {
            var orders = _orderDal.GetAllOrders()
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
            var checkBidCodeExists = _orderDal.GetAllOrders().Any(x => x.OrderCode == orderCode);
            return checkBidCodeExists == true;
        }

        public Order GetEarlyGH()
        {
            return _orderDal.GetAllOrders()
                .Where(x => x.Type == "GH" && x.Status == 0)
                .OrderBy(x => x.OrderNumber)
                .FirstOrDefault();
        } 
    }
}
