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

        public IEnumerable<OrderDetail> GetAllOrderDetail()
        {
            return _bitcoinEntities.OrderDetails.ToList();
        }
    }
}
