using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BK_VPDKDatDai
{
    public class TraCuuController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public DM_TIEU_DE GetNoiDung(int id)
        {
            QUAN_LY_DAT_DAIEntities v_ett = new QUAN_LY_DAT_DAIEntities();
            return v_ett.DM_TIEU_DE.Where(x => x.ID == id).First();
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}