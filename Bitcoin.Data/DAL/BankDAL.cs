using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.DAL
{
    public class BankDAL
    {
        private readonly BitcoinEntities _bitcoinEntities = new BitcoinEntities();

        /// <summary>
        /// Insert bank
        /// </summary>
        /// <param name="bank">Bank</param>
        public void InsertBank(Bank bank)
        {
            _bitcoinEntities.Banks.Add(bank);
            _bitcoinEntities.SaveChanges();
        }

        /// <summary>
        /// Gets all banks
        /// </summary>
        /// <returns>Bank collection</returns>
        public IEnumerable<Bank> GetAllBanks()
        {
            return _bitcoinEntities.Banks.ToList();
        }
  
    }
}
