using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Website
{
    class Archive
    {
        public Guid _ArchiveID { get; set; }
        public string _ArchiveName { get; set; }
        public Guid _VideoID { get; set; }
        public string _Data { get; set; }
        public string _Description { get; set; }
    }
}
