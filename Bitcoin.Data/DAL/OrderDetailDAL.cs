using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.DAL
{
    public class OrderDetailDAL
    {
        private BitcoinEntities _bitcoinEntities = new BitcoinEntities();

        /// <summary>
        /// Get all order details
        /// </summary>
        /// <returns>List order details</returns>
        public IEnumerable<OrderDetail> GetAllOrderDetail()
        {
            return _bitcoinEntities.OrderDetails
                .Include("User")
                .ToList();
        }

        /// <summary>
        /// Insert order detail
        /// </summary>
        /// <param name="orderDetail"> order detail </param>
        public void InsertOrderDetail(OrderDetail orderDetail)
        {
            _bitcoinEntities.OrderDetails.Add(orderDetail);
            _bitcoinEntities.SaveChanges();
        }

        /// <summary>
        /// Get a order detail code
        /// </summary>
        /// <param name="orderDetailCode">order detail code</param>
        /// <returns>signle order detail</returns>
        public OrderDetail GetOrderDetailByOrderDetailCode(string orderDetailCode)
        {
            return _bitcoinEntities.OrderDetails
                .Include("User")
                .FirstOrDefault(m => m.OrderDetailCode == orderDetailCode);
        }

        public void UpdateOrderDetail(OrderDetail orderDetail)
        {
            _bitcoinEntities.OrderDetails.Attach(orderDetail);
            _bitcoinEntities.Entry(orderDetail).State = EntityState.Modified;
            _bitcoinEntities.SaveChanges();
        }
    }
}
