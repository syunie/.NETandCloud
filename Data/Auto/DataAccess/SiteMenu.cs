using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using Arrow.Framework;

namespace TMS
{
    public partial class SiteMenu
    {
        private const string TABLE_NAME = "SiteMenu";
        private const string ALL_FIELDS = "ID,Name,StartTag,Url,ParentID,Remarks,ExtraFields";
        private const string SQL_ADD = "Insert Into SiteMenu (Name,StartTag,Url,ParentID,Remarks,ExtraFields)Values(@Name,@StartTag,@Url,@ParentID,@Remarks,@ExtraFields)";
        private const string SQL_UPDATE = "Update SiteMenu Set Name=@Name,StartTag=@StartTag,Url=@Url,ParentID=@ParentID,Remarks=@Remarks,ExtraFields=@ExtraFields Where ";
        private const string SQL_SELECT = "Select ID,Name,StartTag,Url,ParentID,Remarks,ExtraFields From SiteMenu Where ";
        private const string SQL_DELETE = "Delete From SiteMenu Where ";
        private const string SQL_TOP="Select Top {0} ID,Name,StartTag,Url,ParentID,Remarks,ExtraFields From SiteMenu Where {1} Order By {2}";
        private const string SQL_COUNT="Select Count(*) From SiteMenu Where ";
        private const string SQL_PAGE="Select {0} From(Select {0},Row_Number() Over(Order By {3}) as RowNum From {1} Where {2}) t Where RowNum>{4} and RowNum<={5} ";
        private const string PK_PARA_SET= "ID = @ID";
        private const string PK_PARA = "@ID";

        #region ˽�з���
        private DbParameter[] makeParameterForAdd(SiteMenuInfo model)
        {
            DbParameter[] paras = {
                    Db.Helper.MakeInParameter("@Name",model.Name),
                    Db.Helper.MakeInParameter("@StartTag",model.StartTag),
                    Db.Helper.MakeInParameter("@Url",model.Url),
                    Db.Helper.MakeInParameter("@ParentID",model.ParentID),
                    Db.Helper.MakeInParameter("@Remarks",model.Remarks),
                    Db.Helper.MakeInParameter("@ExtraFields",FieldsHelper.XmlSerialize(model.ExtraFields))
            };
            return paras;
        }

        private DbParameter[] makeParameterForUpdate(SiteMenuInfo model)
        {
            DbParameter[] paras = {
                    Db.Helper.MakeInParameter("@Name",model.Name),
                    Db.Helper.MakeInParameter("@StartTag",model.StartTag),
                    Db.Helper.MakeInParameter("@Url",model.Url),
                    Db.Helper.MakeInParameter("@ParentID",model.ParentID),
                    Db.Helper.MakeInParameter("@Remarks",model.Remarks),
                    Db.Helper.MakeInParameter("@ExtraFields",FieldsHelper.XmlSerialize(model.ExtraFields)),
                    Db.Helper.MakeInParameter("@ID",model.ID)
            };
            return paras;
        }

        private void fillModel(DbDataReader dr, SiteMenuInfo model)
        {
                    model.ID = dr.GetInt32(0);
                    model.Name = dr.GetString(1);
                    model.StartTag = dr.GetString(2);
                    model.Url = dr.GetString(3);
                    model.ParentID = dr.GetInt32(4);
                    model.Remarks = dr.GetString(5);
                    model.ExtraFields = FieldsHelper.XmlDeserialize(dr.GetString(6));
        }

        #endregion

        #region ��������
        public int Add(SiteMenuInfo model)
        {
            DbParameter[] paras = makeParameterForAdd(model);
            return Db.Helper.ExecuteNonQuery(SQL_ADD, paras); 
        }

        public int Update(SiteMenuInfo model)
        {
            string strSql = SQL_UPDATE + PK_PARA_SET;
            DbParameter[] paras = makeParameterForUpdate(model);
            return Db.Helper.ExecuteNonQuery(strSql, paras);
        }

        public int Delete(int iD)
        {
            string strSql = SQL_DELETE + PK_PARA_SET;
            DbParameter[] paras = { Db.Helper.MakeInParameter(PK_PARA, iD) };
            return Db.Helper.ExecuteNonQuery(strSql, paras);
        }

        public int DeleteList(string strWhere, DbParameter[] paras=null)
        {
            string strSql = SQL_DELETE + strWhere;
            return Db.Helper.ExecuteNonQuery(strSql, paras);
        }

        public int GetCount(string strWhere, DbParameter[] paras=null)
        {
            string strSql = SQL_COUNT + strWhere;
            int sum = Convert.ToInt32(Db.Helper.ExecuteScalar(strSql, paras));
            return sum;
        }

        public SiteMenuInfo Select(int iD)
        {
            string strSql = SQL_SELECT + PK_PARA_SET;
            DbParameter[] paras = { Db.Helper.MakeInParameter(PK_PARA, iD) };
            return Db.Helper.GetModel<SiteMenuInfo>(fillModel, strSql, paras);
        }

        public List<SiteMenuInfo> SelectList(string strWhere, DbParameter[] paras=null)
        {
            string strSql = SQL_SELECT + strWhere;
            return Db.Helper.GetList<SiteMenuInfo>(fillModel, strSql, paras);
        }

        public List<SiteMenuInfo> SelectList(int topNum, string strWhere, string strOrderBy, DbParameter[] paras=null)
        {
            string strSql = string.Format(SQL_TOP, topNum, strWhere, strOrderBy);
            return Db.Helper.GetList<SiteMenuInfo>(fillModel, strSql, paras);
        }

        public List<SiteMenuInfo> SelectList(string strWhere, string orderBy, int pageIndex, int pageSize, DbParameter[] paras=null)
        {
            if (pageIndex < 1) pageIndex = 1;
            if (string.IsNullOrEmpty(strWhere)) strWhere = "1=1";
            int min = pageSize * (pageIndex - 1);
            int max = pageSize * pageIndex;
            string strSql = string.Format(SQL_PAGE, ALL_FIELDS, TABLE_NAME, strWhere, orderBy, min, max);
            return Db.Helper.GetList<SiteMenuInfo>(fillModel,strSql, paras);
        }

        public DataSet SelectDataSet(string strWhere, DbParameter[] paras = null)
        {
            string strSql = SQL_SELECT + strWhere;
             return Db.Helper.ExecuteDataSet(strSql, paras);
        }
        #endregion

        #region  �������
        public int Add(SiteMenuInfo model, DbTransaction tran)
        {
            DbParameter[] para = makeParameterForAdd(model);
            return Db.Helper.ExecuteNonQuery(tran, SQL_ADD, para);
        }

        public int Update(SiteMenuInfo model, DbTransaction tran)
        {
            string strSql = SQL_UPDATE + PK_PARA_SET;
            DbParameter[] para = makeParameterForUpdate(model);
            return Db.Helper.ExecuteNonQuery(tran, strSql, para);
        }

        public int Delete(int iD, DbTransaction tran)
        {
            string strSql = SQL_DELETE + PK_PARA_SET;
            DbParameter[] paras = { Db.Helper.MakeInParameter(PK_PARA, iD) };
            return Db.Helper.ExecuteNonQuery(tran, strSql, paras);
        }

        public int DeleteList(string strWhere, DbTransaction tran, DbParameter[] paras=null)
        {
            string strSql = SQL_DELETE + strWhere;
            return Db.Helper.ExecuteNonQuery(tran, strSql, paras);
        }

        public int GetCount(string strWhere, DbTransaction tran, DbParameter[] paras=null)
        {
            string strSql = SQL_COUNT + strWhere;
            int sum = Convert.ToInt32(Db.Helper.ExecuteScalar(tran, strSql, paras));
            return sum;
        }

        public SiteMenuInfo Select(int iD, DbTransaction tran)
        {
            string strSql = SQL_SELECT + PK_PARA_SET;
            DbParameter[] paras = { Db.Helper.MakeInParameter(PK_PARA, iD) };
            return Db.Helper.GetModel<SiteMenuInfo>(fillModel, strSql, paras, true, tran);
        }

        public List<SiteMenuInfo> SelectList(string strWhere, DbTransaction tran, DbParameter[] paras=null)
        {
            string strSql = SQL_SELECT + strWhere;
            return Db.Helper.GetList<SiteMenuInfo>(fillModel, strSql, paras, true, tran);
        }

        #endregion
    }
}