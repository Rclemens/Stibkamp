using System.Data.Linq.Mapping;

namespace form.entities
{
    public interface IStibContact
    {
        [Column(Storage = "_ID", DbType = "UniqueIdentifier NOT NULL", IsPrimaryKey = true)]
        System.Guid ID { get; set; }

        [Column(Storage = "_Kamptype", DbType = "VarChar(20)")]
        string Kamptype { get; set; }

        [Column(Storage = "_Voornaam", DbType = "VarChar(50)")]
        string Voornaam { get; set; }

        [Column(Storage = "_Tussenvoegsel", DbType = "VarChar(20)")]
        string Tussenvoegsel { get; set; }

        [Column(Storage = "_Achternaam", DbType = "VarChar(50)")]
        string Achternaam { get; set; }

        [Column(Storage = "_Vraag", DbType = "NText", UpdateCheck = UpdateCheck.Never)]
        string Vraag { get; set; }
    }
}