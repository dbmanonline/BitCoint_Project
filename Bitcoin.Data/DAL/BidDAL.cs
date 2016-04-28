using Bitcoin.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bitcoin.Data.DAL
{
    public class BidDAL
    {
        readonly BitcoinEntities _bitCoinEntities = new BitcoinEntities();  

        public void InsertBid (Bid bid)
        {
            _bitCoinEntities.Bids.Add(bid);
            _bitCoinEntities.SaveChanges();
        }
    }
}
