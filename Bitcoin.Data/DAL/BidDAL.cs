using Bitcoin.Data.DTO;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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
        /// <param name="bid"> bid </param>
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
                .FirstOrDefault(b => b.UserID == userId);
            return latestBid;
        }

        /// <summary>
        /// Delete a bid with condition of status equal 0
        /// </summary>
        /// <param name="bid"> bid </param>
        public void DeleteBid(Bid bid)
        {
            _bitCoinEntities.Bids.Remove(bid);
            _bitCoinEntities.SaveChanges();
        }

        /// <summary>
        /// Get all bids
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Bid> GetAllBids()
        {
            var listBids = _bitCoinEntities.Bids.ToList();
            var listUsers = _bitCoinEntities.User.ToList();
            var result = _bitCoinEntities.Bids
                .Include("User")
                .ToList();
            return result;
        }

        /// <summary>
        /// Get a bid that match id
        /// </summary>
        /// <param name="id">id of bid</param>
        /// <returns>Single bid</returns>
        public Bid GetBidById(string bidCode)
        {
            var result = _bitCoinEntities.Bids
                .Include("User")
                .Where(b => b.BidCode == bidCode);
                
            return result.FirstOrDefault();
        }

        /// <summary>
        /// Update values of Bid
        /// </summary>
        /// <param name="bid"> models of bid</param>
        public void UpdateBid(Bid bid)
        {
            _bitCoinEntities.Bids.Attach(bid);
            _bitCoinEntities.Entry(bid).State = EntityState.Modified;
            _bitCoinEntities.SaveChanges();
        }
    }
}
