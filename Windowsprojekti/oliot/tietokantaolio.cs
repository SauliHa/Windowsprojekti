using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using MySql.Data.MySqlClient;

namespace windowsprojekti.Oliot
{
    class tietokantaolio
    {
        //ominaisuudet
        protected MySqlConnection yhteys = null;
        protected MySqlCommand komento = null;
        protected MySqlDataReader lukija = null;

        public MySqlDataReader GetLukija()
        {
            return this.lukija;
        }//datareader

        //Metodit:
        public bool avaaYhteys(string ktunnus, string sala)
        {
            try
            {
                string yhteysjono = @"server=localhost;userid=" + ktunnus +
                              ";password=" + sala + ";database=projektikanta";
                this.yhteys = new MySqlConnection(yhteysjono);
                this.yhteys.Open();
                return true;
            }
            catch (MySqlException e1)
            {
                return false;
            }
        }//avaayhteys

        public bool suljeYhteys()
        {
            try
            {
                if (this.yhteys != null)
                {
                    this.yhteys.Close();
                }

                return true;
            }
            catch (MySqlException e1)
            {
                return false;
            }
        }//avaa

    }//class
}//namespace
