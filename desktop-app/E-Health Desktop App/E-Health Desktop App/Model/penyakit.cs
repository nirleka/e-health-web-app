//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Health_Desktop_App.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class penyakit
    {
        public penyakit()
        {
            this.gambar = new HashSet<gambar>();
            this.obat = new HashSet<obat>();
        }
    
        public long id { get; set; }
        public string nama { get; set; }
        public string penyebab { get; set; }
        public string gejala { get; set; }
        public string diagnosis { get; set; }
        public string knowledge { get; set; }
    
        public virtual ICollection<gambar> gambar { get; set; }
        public virtual ICollection<obat> obat { get; set; }
    }
}