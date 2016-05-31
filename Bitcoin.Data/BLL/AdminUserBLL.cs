using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Bitcoin.Data.DAL;
using Bitcoin.Data.DTO;

namespace Bitcoin.Data.BLL
{
    public class AdminUserBLL
    {
        private AdminUserDAL _adminUserDal = new AdminUserDAL();

        public IEnumerable<AdminUser> GetAllAdminUsers()
        {
            return _adminUserDal.GetAllAdminUsers();
        }

        public void InsertAdminUser(AdminUser adminUser)
        {
            _adminUserDal.InsertAdminUser(adminUser);
        }

        public void UpdateAdminUser(AdminUser adminUser)
        {
            _adminUserDal.UpdateAdminUser(adminUser);
        }

        public AdminUser GetAdminUserById(int id)
        {
            return _adminUserDal.GetAdminUserById(id);
        }

        public void DeleteAdminUser(AdminUser adminUser)
        {
            if (adminUser.UserName == "admin")
            {
                throw new Exception("This account is admin of system, you can not delete");
            }
            else
            {
                _adminUserDal.DeleteAdminUser(adminUser);
            }
        }

        /// <summary>
        /// Check a username already exists
        /// </summary>
        /// <param name="userName">Username</param>
        /// <returns>True or False</returns>
        public bool CheckUserNameExists(string userName)
        {
            return _adminUserDal.GetAllAdminUsers().Any(m => m.UserName == userName);
        }

        /// <summary>
        /// Check a email already exists
        /// </summary>
        /// <param name="email">Email</param>
        /// <returns>True or False</returns>
        public bool CheckEmailExists(string email)
        {
            return _adminUserDal.GetAllAdminUsers().Any(m => m.Email == email);
        }

        /// <summary>
        /// Check username, password and status of admin user when login.
        /// </summary>
        /// <param name="userName">username</param>
        /// <param name="password">password</param>
        /// <returns></returns>
        public bool CheckAdminUserLogin(string userName, string password)
        {
            return _adminUserDal.GetAllAdminUsers()
                    .Any(m => m.UserName == userName && m.Password == password && m.Active == true);
        }

        /// <summary>
        /// Get a single admin user by username
        /// </summary>
        /// <param name="userName">username</param>
        /// <returns>signle user</returns>
        public AdminUser GetAdminUserByUsername(string userName)
        {
            return _adminUserDal.GetAllAdminUsers()
                .FirstOrDefault(m => m.UserName == userName);
        }
    }
}
