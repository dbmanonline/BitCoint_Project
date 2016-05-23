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

        /// <summary>
        /// Get a oldest order get help
        /// </summary>
        /// <returns></returns>
        public Order GetOldestOrderGetHelp()
        {
            var orderGH = _orderDal.GetAllOrders()
                .OrderByDescending(m => m.OrderNumber)
                .FirstOrDefault(m => m.Type == "GH" && (m.Status == 0 || m.Status == 1));
            return orderGH;
        }

        /// <summary>
        /// Get a oldest order provide help
        /// </summary>
        /// <returns></returns>
        public Order GetOldestOrderProvideHelp(int userId)
        {
            var orderGH = _orderDal.GetAllOrders()
                .OrderBy(m => m.OrderNumber)
                .FirstOrDefault(m => m.UserID == userId && m.Type == "PH" && (m.Status == 0 || m.Status == 1));
            return orderGH;
        }

        public IEnumerable<Order> GetAllUserPH(int userId)
        {
            var orders = _orderDal.GetAllOrders()
                .Where(x => x.UserID == userId && (x.Status == 0 || x.Status == 1))
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

        //public Order GetLatestGhOrder()
        //{
        //    return _orderDal.GetAllOrders()
        //        .Where(x => x.Type == "GH" && (x.Status == 0 || x.Status == 1))
        //        .OrderBy(x => x.OrderNumber)
        //        .FirstOrDefault();
        //} 
    }
}
