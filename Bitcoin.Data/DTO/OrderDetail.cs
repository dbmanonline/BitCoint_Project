//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bitcoin.Data.DTO
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderDetail
    {
        public string OrderDetailCode { get; set; }
        public string OrderCode { get; set; }
        public int SenderId { get; set; }
        public int ReceiverId { get; set; }
        public string Confirmation { get; set; }
    
        public virtual Order Order { get; set; }
    }
}