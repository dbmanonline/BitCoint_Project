using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class BankBLL
    {
        private BankDAL _bankDAL = new BankDAL();

        /// <summary>
        /// Insert bank
        /// </summary>
        /// <param name="bank">Bank</param>
        public void InsertBank(Bank bank)
        {
            _bankDAL.InsertBank(bank);
        }

        /// <summary>
        /// Gets all banks
        /// </summary>
        /// <returns>Bank collection</returns>
        public IEnumerable<Bank> GetAllBanks()
        {
            return _bankDAL.GetAllBanks();
        }

        /// <summary>
        /// Gets all user banks
        /// </summary>
        /// <returns>User bank collection</returns>
        public IEnumerable<Bank> GetAllUserBanks(int userID)
        {
            return _bankDAL.GetAllBanks().Where(m => m.UserID == userID).ToList();
        }
    }
}
