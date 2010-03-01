﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4927
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace form.entities
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[System.Data.Linq.Mapping.DatabaseAttribute(Name="Stibkamp")]
	public partial class StibContactDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertStibContact(StibContact instance);
    partial void UpdateStibContact(StibContact instance);
    partial void DeleteStibContact(StibContact instance);
    #endregion
		
		public StibContactDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["StibkampConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public StibContactDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public StibContactDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public StibContactDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public StibContactDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<StibContact> StibContacts
		{
			get
			{
				return this.GetTable<StibContact>();
			}
		}
	}
	
	[Table(Name="dbo.StibContact")]
	public partial class StibContact : INotifyPropertyChanging, INotifyPropertyChanged, IStibContact
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private System.Guid _ID;
		
		private string _Kamptype;
		
		private string _Voornaam;
		
		private string _Tussenvoegsel;
		
		private string _Achternaam;
		
		private string _Vraag;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIDChanging(System.Guid value);
    partial void OnIDChanged();
    partial void OnKamptypeChanging(string value);
    partial void OnKamptypeChanged();
    partial void OnVoornaamChanging(string value);
    partial void OnVoornaamChanged();
    partial void OnTussenvoegselChanging(string value);
    partial void OnTussenvoegselChanged();
    partial void OnAchternaamChanging(string value);
    partial void OnAchternaamChanged();
    partial void OnVraagChanging(string value);
    partial void OnVraagChanged();
    #endregion
		
		public StibContact()
		{
			OnCreated();
		}
		
		[Column(Storage="_ID", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
		public System.Guid ID
		{
			get
			{
				return this._ID;
			}
			set
			{
				if ((this._ID != value))
				{
					this.OnIDChanging(value);
					this.SendPropertyChanging();
					this._ID = value;
					this.SendPropertyChanged("ID");
					this.OnIDChanged();
				}
			}
		}
		
		[Column(Storage="_Kamptype", DbType="VarChar(20)")]
		public string Kamptype
		{
			get
			{
				return this._Kamptype;
			}
			set
			{
				if ((this._Kamptype != value))
				{
					this.OnKamptypeChanging(value);
					this.SendPropertyChanging();
					this._Kamptype = value;
					this.SendPropertyChanged("Kamptype");
					this.OnKamptypeChanged();
				}
			}
		}
		
		[Column(Storage="_Voornaam", DbType="VarChar(50)")]
		public string Voornaam
		{
			get
			{
				return this._Voornaam;
			}
			set
			{
				if ((this._Voornaam != value))
				{
					this.OnVoornaamChanging(value);
					this.SendPropertyChanging();
					this._Voornaam = value;
					this.SendPropertyChanged("Voornaam");
					this.OnVoornaamChanged();
				}
			}
		}
		
		[Column(Storage="_Tussenvoegsel", DbType="VarChar(20)")]
		public string Tussenvoegsel
		{
			get
			{
				return this._Tussenvoegsel;
			}
			set
			{
				if ((this._Tussenvoegsel != value))
				{
					this.OnTussenvoegselChanging(value);
					this.SendPropertyChanging();
					this._Tussenvoegsel = value;
					this.SendPropertyChanged("Tussenvoegsel");
					this.OnTussenvoegselChanged();
				}
			}
		}
		
		[Column(Storage="_Achternaam", DbType="VarChar(50)")]
		public string Achternaam
		{
			get
			{
				return this._Achternaam;
			}
			set
			{
				if ((this._Achternaam != value))
				{
					this.OnAchternaamChanging(value);
					this.SendPropertyChanging();
					this._Achternaam = value;
					this.SendPropertyChanged("Achternaam");
					this.OnAchternaamChanged();
				}
			}
		}
		
		[Column(Storage="_Vraag", DbType="NText", UpdateCheck=UpdateCheck.Never)]
		public string Vraag
		{
			get
			{
				return this._Vraag;
			}
			set
			{
				if ((this._Vraag != value))
				{
					this.OnVraagChanging(value);
					this.SendPropertyChanging();
					this._Vraag = value;
					this.SendPropertyChanged("Vraag");
					this.OnVraagChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
