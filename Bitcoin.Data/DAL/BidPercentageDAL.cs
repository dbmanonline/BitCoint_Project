using Bitcoin.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bitcoin.Data.DAL
{
    public class BidPercentageDAL
    {
        readonly BitcoinEntities _bitCoinEntities = new BitcoinEntities();

        /// <summary>
        /// Get current bid's percentage have actived
        /// </summary>
        /// <returns> Single Percentage </returns>
        public BidPercentage GetCurrentPercentage()
        {
            var bidPercentage = _bitCoinEntities.BidPercentages.First();
            return bidPercentage;
        }
    }
}
