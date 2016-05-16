using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.DAL
{
    public class OrderDetailDAL
    {
        private readonly BitcoinEntities _bitcoinEntities = new BitcoinEntities();

        /// <summary>
        /// Get all order details
        /// </summary>
        /// <returns>List order details</returns>
        public IEnumerable<OrderDetail> GetAllOrderDetail()
        {
            return _bitcoinEntities.OrderDetails.ToList();
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
    }
}
