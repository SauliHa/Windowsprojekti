using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;

using MySql.Data.MySqlClient;

namespace windowsprojekti.Oliot
{
    class tuoteolio:tietokantaolio
    {
        public string Lisaatuote(string tuote, string hinta, string varasto)
        {
            string ok = "Lisäys onnistui";
            try
            {

                string lause = "insert into tuote " +
                               "(tuote,hinta,varasto) " +
                               "values (?,?,?);";
                komento = new MySqlCommand(lause, yhteys);

                komento.Parameters.Add("@tuote", MySqlDbType.VarChar, 30);
                komento.Parameters.Add("@hinta", MySqlDbType.VarChar, 80);
                komento.Parameters.Add("@varasto", MySqlDbType.VarChar, 5);


                komento.Parameters["@tuote"].Value = tuote;
                komento.Parameters["@hinta"].Value = hinta;
                komento.Parameters["@varasto"].Value = varasto;


                komento.Prepare();
                komento.ExecuteNonQuery();
            }
            catch (MySqlException e1)
            {
                ok = "Virhe:" + e1;
            }
            return ok;
        }  // LisaaAsiakas
    }
}