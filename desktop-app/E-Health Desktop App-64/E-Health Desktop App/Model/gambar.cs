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
    
    public partial class gambar
    {
        public long id { get; set; }
        public string file { get; set; }
        public string deskripsi { get; set; }
        public long id_penyakit { get; set; }
    
        public virtual penyakit penyakit { get; set; }
    }
}
