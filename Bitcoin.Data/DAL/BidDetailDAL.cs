using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.DAL
{
    public class BidDetailDAL
    {
        readonly BitcoinEntities _bitcoinEntities = new BitcoinEntities();

        /// <summary>
        /// Insert bid detail of bid
        /// </summary>
        /// <param name="bidDetail">models of bid detail class</param>
        public void InsertBidDetail(BidDetail bidDetail)
        {
            _bitcoinEntities.BidDetails.Add(bidDetail);
            _bitcoinEntities.SaveChanges();
        }

        /// <summary>
        /// Get list of bid details
        /// </summary>
        /// <returns> list of bid details </returns>
        public IEnumerable<BidDetail> GetAllBidDetails()
        {
            var result = _bitcoinEntities.BidDetails
                .Include("Bid")
                .ToList();
            return result;
        }

        /// <summary>
        /// Update models of Bid Detail
        /// </summary>
        /// <param name="bidDetail"> models of Bid Details </param>
        public void UpdateBidDetail(BidDetail bidDetail)
        {
            _bitcoinEntities.BidDetails.Attach(bidDetail);
            _bitcoinEntities.Entry(bidDetail).State = EntityState.Modified;
            _bitcoinEntities.SaveChanges();
        }

        /// <summary>
        /// Get single Bid Details by GR Code
        /// </summary>
        /// <param name="grCode">GR Code of Bid Detail</param>
        /// <returns>Single Bid Detail</returns>
        public BidDetail GetBidDetailById(string grCode)
        {
            return _bitcoinEntities.BidDetails.FirstOrDefault(x => x.BidDetailCode == grCode);
        }

        /// <summary>
        /// Get single Bid Details by GP Code
        /// </summary>
        /// <param name="grCode">GP Code of Bid Detail</param>
        /// <returns>Single Bid Detail</returns>
        public BidDetail GetBidDetailByGPCode(string gpCode)
        {
            return _bitcoinEntities.BidDetails.FirstOrDefault(x => x.BidCode == gpCode);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userID"></param>
        /// <returns></returns>
        public IEnumerable<Bid> GetAllBidDetailOfUser(int userID)
        {
            var result = _bitcoinEntities.Bids
                .Include("BidDetail")
                //.Include("User")
                .ToList()
                .Where(x => x.UserID == userID);
            return result;
        }
    }
}
