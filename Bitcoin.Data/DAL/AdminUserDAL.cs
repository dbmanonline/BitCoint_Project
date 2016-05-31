using Bitcoin.Data.DTO;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Bitcoin.Data.DAL
{
    public class AdminUserDAL
    {
        private BitcoinEntities _bitcoinEntities = new BitcoinEntities();

        /// <summary>
        /// Get all admin users
        /// </summary>
        /// <returns>Collection admin users</returns>
        public IEnumerable<AdminUser> GetAllAdminUsers()
        {
            var adminUsers = _bitcoinEntities.AdminUsers.ToList();
            return adminUsers;
        }

        /// <summary>
        /// Get a single admin user by id is primary key
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public AdminUser GetAdminUserById(int id)
        {
            var adminUser = _bitcoinEntities.AdminUsers.FirstOrDefault(m => m.Id == id);
            return adminUser;
        }

        /// <summary>
        /// Insert a new admin user
        /// </summary>
        /// <param name="adminUser"> Properties of AdminUser class </param>
        public void InsertAdminUser(AdminUser adminUser)
        {
            _bitcoinEntities.AdminUsers.Add(adminUser);
            _bitcoinEntities.SaveChanges();
        }

        /// <summary>
        /// Update a single admin user
        /// </summary>
        /// <param name="adminUser"> Properties of AdminUser class </param>
        public void UpdateAdminUser(AdminUser adminUser)
        {
            _bitcoinEntities.AdminUsers.Attach(adminUser);
            _bitcoinEntities.Entry(adminUser).State = EntityState.Modified;
            _bitcoinEntities.SaveChanges();
        }

        /// <summary>
        /// Delete a single admin user
        /// </summary>
        /// <param name="adminUser">Properties of AdminUser class</param>
        public void DeleteAdminUser(AdminUser adminUser)
        {
            _bitcoinEntities.AdminUsers.Remove(adminUser);
            _bitcoinEntities.SaveChanges();
        }
    }
}
