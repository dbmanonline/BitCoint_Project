using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class OrderDetailBLL
    {
        private readonly OrderDetailDAL _orderDetailDal = new OrderDetailDAL();

        public IEnumerable<OrderDetail> GetAllGHforUser(string orderCode)
        {
            return _orderDetailDal.GetAllOrderDetail()
                .Where(x => x.OrderCode == orderCode);
        } 
    }
}
