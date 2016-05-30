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
    }
}
