using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class OrderDetailBLL
    {
        private readonly OrderDetailDAL _orderDetailDal = new OrderDetailDAL();

        public IEnumerable<OrderDetail> GetAllGHforUser(int userId)
        {
            return _orderDetailDal.GetAllOrderDetail()
            .Where(x => x.SenderId == userId  || x.ReceiverId == userId)
            .OrderByDescending(x => x.OrderNumber);
        }

        public void InsertOrderDetail(OrderDetail orderDetail)
        {
            _orderDetailDal.InsertOrderDetail(orderDetail);
        }

        /// <summary>
        /// Check order code have already exists in OrderDetail
        /// </summary>
        /// <param name="orderCode">Order code</param>
        /// <returns>true or false</returns>
        public bool CheckOrderCodeExistsInOrderDetail(string orderCode)
        {
            return _orderDetailDal.GetAllOrderDetail().Any(m => m.PHOrderCode == orderCode);
        }

        public OrderDetail GetOrderDetailByOrderDetailCode(string orderDetailCode)
        {
            return _orderDetailDal.GetOrderDetailByOrderDetailCode(orderDetailCode);
        }

        public void UpdateOrderDetail(OrderDetail orderDetail)
        {
            _orderDetailDal.UpdateOrderDetail(orderDetail);
        }
    }
}
