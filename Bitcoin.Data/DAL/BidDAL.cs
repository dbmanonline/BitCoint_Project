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

        /// <summary>
        /// Insert Bid BitCoin
        /// </summary>
        /// <param name="bid"> bid< /param>
        public void InsertBid(Bid bid)
        {
            _bitCoinEntities.Bids.Add(bid);
            _bitCoinEntities.SaveChanges();
        }

        /// <summary>
        /// Get latest bid of user
        /// </summary>
        /// <param name="userId"> UserId of Bid </param>
        /// <returns> Single latest bid </returns>
        public Bid GetLatestBid(int userId)
        {
            var latestBid = _bitCoinEntities.Bids
                .Where(b => b.UserID == userId)
                .OrderByDescending(b => b.CreateDate)
                .FirstOrDefault();

            return latestBid;
        }

    }
}
