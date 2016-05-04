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
    
    public partial class Bid
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bid()
        {
            this.BidDetails = new HashSet<BidDetail>();
        }
    
        public string BidCode { get; set; }
        public int UserID { get; set; }
        public double Amount { get; set; }
        public double Percentage { get; set; }
        public System.DateTime CreateDate { get; set; }
        public byte Status { get; set; }
    
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BidDetail> BidDetails { get; set; }
    }
}
