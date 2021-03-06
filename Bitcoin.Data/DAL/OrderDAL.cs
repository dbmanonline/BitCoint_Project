﻿using Bitcoin.Data.DTO;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bitcoin.Data.DAL
{
    public class OrderDAL
    {
        private BitcoinEntities _bitCoinEntities = new BitcoinEntities();

        /// <summary>
        /// Insert Order BitCoin
        /// </summary>
        /// <param name="order"> order </param>
        public void InsertOrder(Order order)
        {
            _bitCoinEntities.Orders.Add(order);
            _bitCoinEntities.SaveChanges();
        }

        /// <summary>
        /// Delete a order with condition of status equal 0
        /// </summary>
        /// <param name="order"> order </param>
        public void DeleteOrder(Order order)
        {
            _bitCoinEntities.Orders.Remove(order);
            _bitCoinEntities.SaveChanges();
        }

        /// <summary>
        /// Get all orders
        /// </summary>
        /// <returns>list orders</returns>
        public IEnumerable<Order> GetAllOrders()
        {
            var result = _bitCoinEntities.Orders
                .Include("User")
                .ToList()
                .OrderByDescending(x => x.OrderNumber);
            return result;
        }

        /// <summary>
        /// Get a order that match order code
        /// </summary>
        /// <param name="id">id of order</param>
        /// <returns>Single order</returns>
        public Order GetOrderByCode(string orderCode)
        {
            var result = _bitCoinEntities.Orders
                .Include("User")
                .Where(b => b.OrderCode == orderCode);
            return result.FirstOrDefault();
        }

        /// <summary>
        /// Update values of Order
        /// </summary>
        /// <param name="bid"> models of order</param>
        public void UpdateOrder(Order order)
        {
            _bitCoinEntities.Orders.Attach(order);
            _bitCoinEntities.Entry(order).State = EntityState.Modified;
            _bitCoinEntities.SaveChanges();
        }
    }
}
