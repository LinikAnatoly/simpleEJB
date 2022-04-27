
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.generated.FINExecutorDAOGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.FINExecutorLogic;
import com.ksoe.energynet.logic.mDaxLogic;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.FINExecutor;
import com.ksoe.energynet.valueobject.brief.FINExecutorShort;
import com.ksoe.energynet.valueobject.filter.FINExecutorFilter;
import com.ksoe.energynet.valueobject.lists.FINExecutorShortList;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for FINExecutor;
  *
  */

public class FINExecutorDAO extends FINExecutorDAOGen {

	public FINExecutorDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public FINExecutorDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

	/*private*/public static Vector<FINExecutorCache> finExecutorCacheHash = new Vector<>();

	/*private*/public class FINExecutorCache {
		public FINExecutorShort finExecutor;
	}


	public FINExecutorShortList getFINExecutorList(
			FINExecutorFilter aFilterObject, int fromPosition, int quantity)
			throws PersistenceException {

		return getFINExecutorList(aFilterObject, fromPosition, quantity, false);
	}

	public Vector<String> getByParent(String id) throws PersistenceException {

		return this.getByParent(id, null);
	}

	/**
	 *
	 * Все вложенные подразделения по id родительского
	 *
	 * @param id родительский id
	 * @return вектор с id всех вложенных подразделений включая id родительского
	 * @throws PersistenceException
	 */
	public Vector<String> getByParent(String id, Boolean isMDAX) throws PersistenceException {
		if(id == null) {
			throw new java.lang.NullPointerException();
		}
		Set<String> out = new HashSet<>();

		if(isMDAX == null) {
			AuthLogic netAuth = new AuthLogic(getConnection(), getUserProfile());
			isMDAX = netAuth.checkUsesMDAXData();
		}
    	boolean usesMDAXData = isMDAX;
    	FINExecutorFilter filter = new FINExecutorFilter();
    	if(!usesMDAXData) {
    		filter.finCehCode = Integer.valueOf(id);
    	} else {
    		filter.axParentOrgId = id;
    	}
		FINExecutorShortList list = this.getFINExecutorList(filter, 0, -1, false);
		for(FINExecutorShort executor : list.getList()) {
			String nextId = (!usesMDAXData) ? String.valueOf(executor.finCode) : executor.axOrgId;
			out.addAll(this.getByParent(nextId, isMDAX));
		}
    	out.add(id);
    	Vector<String> vec = new Vector<>(out);
		return vec;
	}



	public FINExecutorShortList getFINExecutorList(
			FINExecutorFilter aFilterObject, int fromPosition, int quantity, boolean reloadFinExecutor)
			throws PersistenceException {

		FINExecutorCache finExecutorCache = null;


		if (reloadFinExecutor || finExecutorCacheHash.isEmpty()) {
			reloadFinExecutor();
		}


       	/** !!!!!!  DEBUG  !!!!!!! */
		boolean usesMDAXData = false;
    	AuthLogic netAuth = new AuthLogic(getConnection(), getUserProfile());
    	usesMDAXData = netAuth.checkUsesMDAXData();


		FINExecutorShortList result = new FINExecutorShortList();
		FINExecutorShort anObject;
		result.list = new Vector<>();

		if (aFilterObject != null) {
			if (! usesMDAXData) {
				if (aFilterObject.finCehCode != Integer.MIN_VALUE) {
					for(FINExecutorCache cache : finExecutorCacheHash) {
						finExecutorCache = cache;
						if (finExecutorCache.finExecutor.main_podr_id == aFilterObject.finCehCode) {
							anObject = new FINExecutorShort();
							anObject = finExecutorCache.finExecutor;
							result.list.add(anObject);
							result.setTotalCount(result.list.size());
						}
					}
				} else {
					if (aFilterObject.finCode != Integer.MIN_VALUE) {
						for(FINExecutorCache cache : finExecutorCacheHash) {
							finExecutorCache = cache;
							if (finExecutorCache.finExecutor.podr_id == aFilterObject.finCode) {
								anObject = new FINExecutorShort();
								anObject = finExecutorCache.finExecutor;
								result.list.add(anObject);
								result.setTotalCount(result.list.size());
							}
						}
					}
				}
			} else {
				// Нужно для изначального выбора всего дерева (с клиента пустые строки в фильтре
				// не передаются, поэтому приходится использовать хитрый признак)
				if (aFilterObject.finCehCode == 1) {
					if (aFilterObject.axParentOrgId == null) {
						aFilterObject.axParentOrgId = "";
					}
					if (aFilterObject.axOrgId == null) {
						aFilterObject.axOrgId = "";
					}
				}
				if (aFilterObject.axParentOrgId != null) {
					// SUPP-47459 В случае если было послано несколько родительских подразделений через запятую
					Vector<String> parents = null;
					if(aFilterObject.axParentOrgId.length() > 0) {
						parents = Tools.divideOnWords(aFilterObject.axParentOrgId, ",");
					}
					for(FINExecutorCache cache : finExecutorCacheHash) {
						finExecutorCache = cache;

						if (finExecutorCache.finExecutor.axParentOrgId == null) {
							continue;
						}

						boolean isContained = false;
						if(aFilterObject.axParentOrgId.contains(",")) {
							isContained = parents.contains(finExecutorCache.finExecutor.axParentOrgId);
						} else {
							isContained = finExecutorCache.finExecutor.axParentOrgId.equals(aFilterObject.axParentOrgId);
						}
						if (isContained) {
							anObject = new FINExecutorShort();
							anObject = finExecutorCache.finExecutor;
							result.list.add(anObject);
							result.setTotalCount(result.list.size());
						}
					}
				} else {
					if (aFilterObject.axOrgId != null) {
						for(FINExecutorCache cache : finExecutorCacheHash) {
							finExecutorCache = cache;
							if (finExecutorCache.finExecutor.axOrgId == null) {
								continue;
							}
							if (finExecutorCache.finExecutor.axOrgId.equals(aFilterObject.axOrgId)) {
								anObject = new FINExecutorShort();
								anObject = finExecutorCache.finExecutor;
								result.list.add(anObject);
								result.setTotalCount(result.list.size());
							}
						}
					}
				}

			}


		}

		// System.out.println("### finExecutor.TotalCount = " + result.getTotalCount());

		return result;
	}


	private synchronized FINExecutorCache reloadFinExecutor() throws PersistenceException {

		clearFinExecutorCache();

		FINExecutorShort anObject;
		FINExecutorCache finExecutorCache = null;
		Connection connection = getConnection();

		try {

        PreparedStatement statement = null;

        ResultSet  set = null;
        String whereStr = " ";
        String orderBy = " p.main_podr_id,  p.nazv";


        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");

       	/** !!!!!!  DEBUG  !!!!!!! */
    	AuthLogic netAuth = new AuthLogic(getConnection(), getUserProfile());
    	if (netAuth.checkUsesMDAXData()) {
    		mDaxLogic mdLogic = new mDaxLogic(getConnection(), getUserProfile());
    		return mdLogic.reloadFinExecutor();
    	}


        String selectStr = //"SELECT /*+ RULE */ "+
    " SELECT "+
    " p.Podr_Id, "+
    " p.Nazv, "+
    " p.Id, "+
    " p.Date_Start,"+
    " DECODE(p.Date_Finish, TO_DATE('01.01.3000','DD.MM.YYYY'), TO_DATE(NULL), p.Date_Finish) Date_Finish,"+
    " p.Start_Pricaz_Id, "+
    " pr1.Nomer      Start_Pricaz_Nomer,"+
    " DECODE(pr1.Data, TO_DATE('01.01.1900','DD.MM.YYYY'), TO_DATE(NULL), pr1.Data) Start_Pricaz_Data,"+
    // remover KH 2010.11.11 " pr1.Utver      Start_Pricaz_Utver, "+
    " p.Finish_Pricaz_Id, "+
    " pr2.Nomer      Finish_Pricaz_Nomer,"+
    " DECODE(pr2.Data, TO_DATE('01.01.1900','DD.MM.YYYY'), TO_DATE(NULL), pr2.Data) Finish_Pricaz_Data,"+
      // remover KH 2010.11.11 " pr2.Utver      Finish_Pricaz_Utver,"+
    " DECODE(p.Day_Date_Start, p.Date_Start, TO_DATE(NULL), p.Day_Date_Start) Podr_Day_Date_Start,"+
    " p.Pricaz_Id    Podr_Day_Pricaz_Id, "+
    " pr3.Nomer      Podr_Day_Pricaz_Nomer,"+
    " DECODE(pr3.Data, TO_DATE('01.01.1900','DD.MM.YYYY'), TO_DATE(NULL), pr3.Data) Podr_Day_Pricaz_Data,"+
    //     remover KH 2010.11.11 " pr3.Utver      Day_Pricaz_Utver, "+
    " (SELECT COUNT(*) FROM kadry.Podr_Day WHERE Podr_Id = p.Id) Day_Count,"+
    " RTRIM(p.Kod)   Kod, "+
    " p.Sokr_Nazv,"+
    " p.Main_Podr_Id,"+
    " RTRIM(pdm.Kod)  Main_Podr_Kod,"+
    " pdm.Nazv        Main_Podr_Nazv,"+
    " pdm.Sokr_Nazv   Main_Podr_Sokr_Nazv,"+
    " cehd.Podr_Id    Ceh_Id,"+
    " cehd.Kod        Ceh_Kod,"+
    " cehd.Nazv       Ceh_Nazv,"+
    " cehd.Sokr_Nazv  Ceh_Sokr_Nazv,"+
    " cehd.Pos        Ceh_Pos,"+
    "     p.Podr_Vid_Id, "+
    "     pv.Nazv           Podr_Vid_Nazv,"+
    "     pv.Sokr_Nazv      Podr_Vid_Sokr_Nazv,"+
    "     p.Prom_Id,"+
    "     prom.Nazv         Prom_Nazv,"+
    "     prom.Sokr_Nazv    Prom_Sokr_Nazv,"+
    "     p.Struct_Ed, "+
    "     DECODE (p.Struct_Ed,'1','V') Struct_Ed_Show,"+
    "     p.Pos,"+
    "     p.Vne_Shtata,"+
    "     p.For_Podr.Concat_Pos  Sum_Pos,"+
    "      p.For_Podr.Lvl         Podr_Level,"+
    " p.Prim,"+
    " '' Err_Id, '' Err_Nazv,"+
    " TO_NUMBER(NULL)   KVED_Id,"+
    " ''                KVED_Kod,"+
    " ''                KVED_Nazv "+
    " FROM "+
    " kadry.Podr_Day  pdm,"+
    " kadry.Podr_Day  cehd,        kadry.Podr_Vid     pv,"+
    " kadry.Prom         prom,"+
    " kadry.Pricaz       pr1,"+
    " kadry.Pricaz       pr2, "+
    " kadry.Pricaz       pr3,"+
        " (SELECT p0.*, "+
        "       pd0.Podr_Id,"+
        "       pd0.Date_Start Day_Date_Start,"+
        "       pd0.Main_Podr_Id,"+
        "       pd0.Podr_Vid_Id,"+
        "       pd0.Nazv, "+
        "       pd0.Sokr_Nazv,"+
        "       pd0.Kod,"+
        "       pd0.Prom_Id,"+
        "       pd0.STRUCT_ED,"+
        "       pd0.POS, "+
        "       pd0.VNE_SHTATA,"+
        "       pd0.PEREVOD_VID_ID,"+
        "       pd0.PRICAZ_ID,"+
        "       pd0.DATE_FINISH Day_Date_Finish,"+
        "       pd0.Kved_Id, "+
        "       pd0.Prim, "+
        "       kadry.Pkg_Podr_Utils.Get_For_Podr(p0.Id, GREATEST(p0.Date_Start, sysdate)) For_Podr "+
        "  FROM kadry.Podr     p0, "+
        "       kadry.Podr_Day pd0,"+
        "       kadry.v_dostup   v "+
        "  WHERE p0.Id > 0"+
        "    AND p0.Id = pd0.PODR_ID"+
        //очередной апдейт ФК ;)
        //"    AND (v.podr_list IS NULL OR INSTR(v.podr_list, '_'||p0.id||'_') <> 0)"+
        "    AND pd0.Date_Start <= GREATEST(p0.Date_Start,  sysdate )"+
        "    AND NOT EXISTS "+
        "      (SELECT NULL FROM kadry.Podr_Day pd2"+
        "         WHERE pd2.Podr_Id = pd0.Podr_Id "+
        "           AND pd2.Date_Start <= GREATEST(p0.Date_Start, sysdate  )"+
    "            AND pd2.Date_Start > pd0.Date_Start)"+
    "            ) p "+
    " WHERE (p.Start_Pricaz_Id = pr1.Id"+
    " AND p.Finish_Pricaz_Id = pr2.Id"+
    " AND p.Pricaz_Id = pr3.Id(+)"+
    " AND p.Podr_Vid_Id = pv.Id(+) "+
    " AND p.Prom_Id = prom.Id(+) "+
    " AND pdm.ROWID = p.For_Podr.Main_Podr_Day_Row_Id"+
    " AND cehd.ROWID = p.For_Podr.Ceh_Day_Row_Id "+
    //" ) AND p.Date_Start <=  sysdate   AND p.Date_Finish >= sysdate /* открытые */ ";
    " ) AND p.Date_Start <=  sysdate   AND p.Date_Finish >= sysdate ";

    // "  AND p.main_podr_id = ? ";


    /**
    *  немного не так, но не хочется ломать быт (на клиентах)
    *
    *  finCehCode == p.main_podr_id
    *  finCode == p.Podr_Id
    *
    */

            if(whereStr.length() != 0)
                selectStr = selectStr + whereStr;

            if (orderBy.length() > 0 )
                selectStr = selectStr + " ORDER BY " + orderBy;

			try {
				statement = connection.prepareStatement(selectStr);

				set = statement.executeQuery();
				while(set.next()) {

					anObject = new FINExecutorShort();

					anObject.code = Integer.MIN_VALUE;

	                anObject.finCode = set.getInt(1);
	                if ( set.wasNull() )
	                    anObject.finCode = Integer.MIN_VALUE;

	                anObject.name = set.getString(2);
	                anObject.finKindName = set.getString("PODR_VID_NAZV");

	                anObject.finKindCode = set.getInt("PODR_VID_ID");
	                if ( set.wasNull() )
	                    anObject.finKindCode = Integer.MIN_VALUE;

	                anObject.finTypeName = set.getString("PROM_NAZV");

	                anObject.finTypeCode = set.getInt("PROM_ID");
	                if ( set.wasNull() )
	                    anObject.finTypeCode = Integer.MIN_VALUE;

	                anObject.finCehName = set.getString("CEH_NAZV");

	                anObject.finCehCode = set.getInt("CEH_ID");
	                if ( set.wasNull() )
	                    anObject.finCehCode = Integer.MIN_VALUE;

	                anObject.main_podr_id = set.getInt("MAIN_PODR_ID");
	                if ( set.wasNull() )
	                    anObject.main_podr_id = Integer.MIN_VALUE;

	                anObject.podr_id = set.getInt("PODR_ID");
	                if ( set.wasNull() )
	                    anObject.podr_id = Integer.MIN_VALUE;


					finExecutorCache = new FINExecutorCache();
					finExecutorCache.finExecutor = anObject;

					finExecutorCacheHash.add(finExecutorCache);

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage() + "\nstatement - "
						+ selectStr);
				EnergyproPersistenceExceptionAnalyzer.analyser
						.throwPersistenceException(e);
			} finally {
				try {
					if (set != null)
						set.close();
				} catch (SQLException e) {
				}
				try {
					if (statement != null)
						statement.close();
				} catch (SQLException e) {
				}
				if (connection != super.getConnection()) {
					try {
						connection.close();
					} catch (SQLException e) {
					}
				}
			}
		} finally {
		}

		return finExecutorCache;
	}





  public FINExecutorShortList getFINExecutorList2(FINExecutorFilter aFilterObject, int fromPosition,int quantity) throws PersistenceException
  {
        FINExecutorShortList result = new FINExecutorShortList();

        FINExecutorShort anObject;
        result.list = new Vector<>();


        Connection connection = getConnection();
        PreparedStatement statement = null;

        ResultSet  set = null;
        String     whereStr = " ";

    String     condition = (aFilterObject.conditionSQL == null  ? "" : aFilterObject.conditionSQL);


        String     orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL );

        if(orderBy.length() == 0)
        //orderBy = "FINEXECUTOR.CODE";
            orderBy = "p.Nazv";

        if(quantity < 0)
        quantity = Integer.MAX_VALUE/2;

        if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");


        String selectStr = //"SELECT /*+ RULE */ "+
    " SELECT "+
    " p.Podr_Id, "+
    " p.Nazv, "+
    " p.Id, "+
    " p.Date_Start,"+
    " DECODE(p.Date_Finish, TO_DATE('01.01.3000','DD.MM.YYYY'), TO_DATE(NULL), p.Date_Finish) Date_Finish,"+
    " p.Start_Pricaz_Id, "+
    " pr1.Nomer      Start_Pricaz_Nomer,"+
    " DECODE(pr1.Data, TO_DATE('01.01.1900','DD.MM.YYYY'), TO_DATE(NULL), pr1.Data) Start_Pricaz_Data,"+
    // remover KH 2010.11.11 " pr1.Utver      Start_Pricaz_Utver, "+
    " p.Finish_Pricaz_Id, "+
    " pr2.Nomer      Finish_Pricaz_Nomer,"+
    " DECODE(pr2.Data, TO_DATE('01.01.1900','DD.MM.YYYY'), TO_DATE(NULL), pr2.Data) Finish_Pricaz_Data,"+
      // remover KH 2010.11.11 " pr2.Utver      Finish_Pricaz_Utver,"+
    " DECODE(p.Day_Date_Start, p.Date_Start, TO_DATE(NULL), p.Day_Date_Start) Podr_Day_Date_Start,"+
    " p.Pricaz_Id    Podr_Day_Pricaz_Id, "+
    " pr3.Nomer      Podr_Day_Pricaz_Nomer,"+
    " DECODE(pr3.Data, TO_DATE('01.01.1900','DD.MM.YYYY'), TO_DATE(NULL), pr3.Data) Podr_Day_Pricaz_Data,"+
    //     remover KH 2010.11.11 " pr3.Utver      Day_Pricaz_Utver, "+
    " (SELECT COUNT(*) FROM kadry.Podr_Day WHERE Podr_Id = p.Id) Day_Count,"+
    " RTRIM(p.Kod)   Kod, "+
    " p.Sokr_Nazv,"+
    " p.Main_Podr_Id,"+
    " RTRIM(pdm.Kod)  Main_Podr_Kod,"+
    " pdm.Nazv        Main_Podr_Nazv,"+
    " pdm.Sokr_Nazv   Main_Podr_Sokr_Nazv,"+
    " cehd.Podr_Id    Ceh_Id,"+
    " cehd.Kod        Ceh_Kod,"+
    " cehd.Nazv       Ceh_Nazv,"+
    " cehd.Sokr_Nazv  Ceh_Sokr_Nazv,"+
    " cehd.Pos        Ceh_Pos,"+
    "     p.Podr_Vid_Id, "+
    "     pv.Nazv           Podr_Vid_Nazv,"+
    "     pv.Sokr_Nazv      Podr_Vid_Sokr_Nazv,"+
    "     p.Prom_Id,"+
    "     prom.Nazv         Prom_Nazv,"+
    "     prom.Sokr_Nazv    Prom_Sokr_Nazv,"+
    "     p.Struct_Ed, "+
    "     DECODE (p.Struct_Ed,'1','V') Struct_Ed_Show,"+
    "     p.Pos,"+
    "     p.Vne_Shtata,"+
    "     p.For_Podr.Concat_Pos  Sum_Pos,"+
    "      p.For_Podr.Lvl         Podr_Level,"+
    " p.Prim,"+
    " '' Err_Id, '' Err_Nazv,"+
    " TO_NUMBER(NULL)   KVED_Id,"+
    " ''                KVED_Kod,"+
    " ''                KVED_Nazv "+
    " FROM "+
    " kadry.Podr_Day  pdm,"+
    " kadry.Podr_Day  cehd,        kadry.Podr_Vid     pv,"+
    " kadry.Prom         prom,"+
    " kadry.Pricaz       pr1,"+
    " kadry.Pricaz       pr2, "+
    " kadry.Pricaz       pr3,"+
        " (SELECT p0.*, "+
        "       pd0.Podr_Id,"+
        "       pd0.Date_Start Day_Date_Start,"+
        "       pd0.Main_Podr_Id,"+
        "       pd0.Podr_Vid_Id,"+
        "       pd0.Nazv, "+
        "       pd0.Sokr_Nazv,"+
        "       pd0.Kod,"+
        "       pd0.Prom_Id,"+
        "       pd0.STRUCT_ED,"+
        "       pd0.POS, "+
        "       pd0.VNE_SHTATA,"+
        "       pd0.PEREVOD_VID_ID,"+
        "       pd0.PRICAZ_ID,"+
        "       pd0.DATE_FINISH Day_Date_Finish,"+
        "       pd0.Kved_Id, "+
        "       pd0.Prim, "+
        "       kadry.Pkg_Podr_Utils.Get_For_Podr(p0.Id, GREATEST(p0.Date_Start, sysdate)) For_Podr "+
        "  FROM kadry.Podr     p0, "+
        "       kadry.Podr_Day pd0,"+
        "       kadry.v_dostup   v "+
        "  WHERE p0.Id > 0"+
        "    AND p0.Id = pd0.PODR_ID"+
        //очередной апдейт ФК ;)
        //"    AND (v.podr_list IS NULL OR INSTR(v.podr_list, '_'||p0.id||'_') <> 0)"+
        "    AND pd0.Date_Start <= GREATEST(p0.Date_Start,  sysdate )"+
        "    AND NOT EXISTS "+
        "      (SELECT NULL FROM kadry.Podr_Day pd2"+
        "         WHERE pd2.Podr_Id = pd0.Podr_Id "+
        "           AND pd2.Date_Start <= GREATEST(p0.Date_Start, sysdate  )"+
    "            AND pd2.Date_Start > pd0.Date_Start)"+
    "            ) p "+
    " WHERE (p.Start_Pricaz_Id = pr1.Id"+
    " AND p.Finish_Pricaz_Id = pr2.Id"+
    " AND p.Pricaz_Id = pr3.Id(+)"+
    " AND p.Podr_Vid_Id = pv.Id(+) "+
    " AND p.Prom_Id = prom.Id(+) "+
    " AND pdm.ROWID = p.For_Podr.Main_Podr_Day_Row_Id"+
    " AND cehd.ROWID = p.For_Podr.Ceh_Day_Row_Id "+
    //" ) AND p.Date_Start <=  sysdate   AND p.Date_Finish >= sysdate /* открытые */ ";
    " ) AND p.Date_Start <=  sysdate   AND p.Date_Finish >= sysdate ";

    // 26.09.15 А зачем здесь это?? Ниже при поиске по podr_Id (aFilterObject.finCode) ничего не выбирается,
    // т.к. main_podr_id не всегда же = 1!!
    //*** "  AND p.main_podr_id = 1 ";

    //"  AND p.main_podr_id = ? ";



        if(aFilterObject != null)
        {
            if(aFilterObject.finCehCode != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " p.main_podr_id = ? ";
            }
            if(aFilterObject.finCode != Integer.MIN_VALUE) {
                if(whereStr.length() != 0)
                whereStr = whereStr + " AND ";
                whereStr = whereStr + " p.Podr_Id = ? ";
            }
        }


            if(condition.length() != 0)
            {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";

                whereStr = whereStr + " (" + condition + ")";
            }



//         + " WHERE" +  сделано выше ????
            if(whereStr.length() != 0)
                selectStr = selectStr + whereStr;

            // selectStr = selectStr + ") ";
            if (orderBy.length() > 0 )
                selectStr = selectStr + " ORDER BY " + orderBy;

            try
            {
                statement = connection.prepareStatement(selectStr);

                //statement.setInt(1, aFilterObject.finCehCode);

                int number = 0;
                if(aFilterObject != null) {
                if(aFilterObject.finCehCode != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,aFilterObject.finCehCode);
                }
                if(aFilterObject.finCode != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,aFilterObject.finCode);
                }
                }

                //if(condition.length() > 0)
                //    _bindObjectsToPreparedStatement(statement, null, number);


                set = statement.executeQuery();
                int i;
                for(i = 0;set.next();i++)
                {
                if(i < fromPosition)
                continue;
                else if(i >= fromPosition + quantity)
                {
                    i++;
                    break;
                }

                anObject = new FINExecutorShort();

                anObject.code = Integer.MIN_VALUE;

                anObject.finCode = set.getInt(1);

                if ( set.wasNull() )
                    anObject.finCode = Integer.MIN_VALUE;

                anObject.name = set.getString(2);
                anObject.finKindName = set.getString("PODR_VID_NAZV");

                anObject.finKindCode = set.getInt("PODR_VID_ID");
                if ( set.wasNull() )
                    anObject.finKindCode = Integer.MIN_VALUE;

                anObject.finTypeName = set.getString("PROM_NAZV");

                anObject.finTypeCode = set.getInt("PROM_ID");
                if ( set.wasNull() )
                    anObject.finTypeCode = Integer.MIN_VALUE;



                anObject.finCehName = set.getString("CEH_NAZV");

                anObject.finCehCode = set.getInt("MAIN_PODR_ID");
                if ( set.wasNull() )
                    anObject.finCehCode = Integer.MIN_VALUE;


                result.list.add(anObject);
                }

                result.setTotalCount(i);
                return result;
            }
            catch(SQLException e)
            {
            System.out.println(e.getMessage()+"\nstatement - "+selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return null;
            }
            finally
            {
            try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
            if(connection != super.getConnection())
            {
                try{connection.close();} catch(SQLException e){}
            }
            }
        //return result;
  }


  public String getPodrIdFromKadryByDepartmentCodeNVZ_E(int departmentCode , String dateSrez) throws PersistenceException
  {
        String result = "";




        Connection connection = getConnection();
        PreparedStatement statement = null;

        ResultSet  set = null;

    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");


        String selectStr = " select  podr_id  from ( " +
            " SELECT p.podr_nazv , p.podr_id , p.main_podr_id " +
            " , nvl((select pp.podr_nazv from kadry.v_Podr_All_Rab pp where pp.podr_id = p.main_podr_id and pp.podr_vid_id = 10),' ') podr_nazv_main " +
            " FROM " +
            " kadry.v_Podr_All_Rab p " +
            " WHERE  " +
            " ((p.podr_vid_id = 10 ) or  ( p.main_podr_id in ( select p.podr_id from kadry.v_Podr_All_Rab p where p.ceh_id = " + departmentCode +
            "                          and p.podr_vid_id = 10 ) " +
                                        " )" +
            " ) " +
            " and p.ceh_id = " + departmentCode  +
            " UNION " +
            " /*юнион того где выбраное подразд в свою очередь тоже с признаком НВЗ и у него есть подчиненные */ " +
            " select podr_nazv , podr_id , main_podr_id , podr_nazv_main from " +
            " ( " +
            " SELECT p.podr_nazv , p.podr_id , p.main_podr_id " +
            "   , nvl((select pp.podr_nazv from kadry.v_Podr_All_Rab pp where pp.podr_id = p.main_podr_id and pp.podr_vid_id = 10 ),' ') podr_nazv_main " +
            "   FROM   kadry.v_Podr_All_Rab p " +
            "   Where " +
            "   ((p.podr_vid_id = 10 ) and   ( p.podr_id = " + departmentCode + " )  ) " +
            "   UNION " +
            "   SELECT p.podr_nazv , p.podr_id , p.main_podr_id " +
            "   , nvl((select pp.podr_nazv from kadry.v_Podr_All_Rab pp where pp.podr_id = p.main_podr_id and pp.podr_vid_id = 10 ),' ') podr_nazv_main " +
            "   FROM   kadry.v_Podr_All_Rab p " +
            "   Where " +
            "   ((p.podr_vid_id = 10 ) and   ( p.main_podr_id = "+ departmentCode +" )  ) " +
            " )  " +
            "    )" +
            "       ORDER BY kadry.pkg_Podr_Utils.Concat_Pos(Podr_Id, last_day(to_date( '"+dateSrez.toString()+"','dd.mm.yyyy') )   ) " ;



            try
            {
                statement = connection.prepareStatement(selectStr);

                set = statement.executeQuery();

                String podr_str = "";

                while(set.next()) {
	                if (podr_str.equals("")){
	                    podr_str = set.getString("podr_id");
	                }
	                else
	                    podr_str = podr_str + "," + set.getString("podr_id");
                }

                result = podr_str;
                return result;
            }
            catch(SQLException e)
            {
            System.out.println(e.getMessage()+"\nstatement - "+selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return null;
            }
            finally
            {
            try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
            if(connection != super.getConnection())
            {
                try{connection.close();} catch(SQLException e){}
            }
            }

  }


  public String getPodrIdFromKadryByDepartmentCodeNVZ(int departmentCode , String dateSrez) throws PersistenceException
  {
        String result = "";



        Connection connection = getConnection();
        PreparedStatement statement = null;

        ResultSet  set = null;

    if(getUserProfile() == null)
        throw new PersistenceException("Internal Error (User Profile Is Undefined)");


        String selectStr = " select  podr_id  from ( " +
            " SELECT p.podr_nazv , p.podr_id , p.main_podr_id " +
            " , nvl((select pp.podr_nazv from kadry.v_Podr_All_Rab pp where pp.podr_id = p.main_podr_id and pp.podr_vid_id = 9),' ') podr_nazv_main " +
            " FROM " +
            " kadry.v_Podr_All_Rab p " +
            " WHERE  " +
            " ((p.podr_vid_id = 9 ) or  ( p.main_podr_id in ( select p.podr_id from kadry.v_Podr_All_Rab p where p.ceh_id = " + departmentCode +
            "                          and p.podr_vid_id = 9 ) " +
                                        " )" +
            " ) " +
            " and p.ceh_id = " + departmentCode  +
            " UNION " +
            " /*юнион того где выбраное подразд в свою очередь тоже с признаком НВЗ и у него есть подчиненные */ " +
            " select podr_nazv , podr_id , main_podr_id , podr_nazv_main from " +
            " ( " +
            " SELECT p.podr_nazv , p.podr_id , p.main_podr_id " +
            "   , nvl((select pp.podr_nazv from kadry.v_Podr_All_Rab pp where pp.podr_id = p.main_podr_id and pp.podr_vid_id = 9 ),' ') podr_nazv_main " +
            "   FROM   kadry.v_Podr_All_Rab p " +
            "   Where " +
            "   ((p.podr_vid_id = 9 ) and   ( p.podr_id = " + departmentCode + " )  ) " +
            "   UNION " +
            "   SELECT p.podr_nazv , p.podr_id , p.main_podr_id " +
            "   , nvl((select pp.podr_nazv from kadry.v_Podr_All_Rab pp where pp.podr_id = p.main_podr_id and pp.podr_vid_id = 9 ),' ') podr_nazv_main " +
            "   FROM   kadry.v_Podr_All_Rab p " +
            "   Where " +
            "   ((p.podr_vid_id = 9 ) and   ( p.main_podr_id = "+ departmentCode +" )  ) " +
            " )  " +
            "    )" +
            "       ORDER BY kadry.pkg_Podr_Utils.Concat_Pos(Podr_Id, last_day(to_date( '"+dateSrez.toString()+"','dd.mm.yyyy') )   ) " ;



            try
            {
                statement = connection.prepareStatement(selectStr);

                set = statement.executeQuery();
                String podr_str = "";

                while(set.next()) {
	                if (podr_str.equals("")){
	                    podr_str = set.getString("podr_id");
	                }
	                else
	                    podr_str = podr_str + "," + set.getString("podr_id");
                }

                result = podr_str;
                return result;
            }
            catch(SQLException e)
            {
            System.out.println(e.getMessage()+"\nstatement - "+selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
            return null;
            }
            finally
            {
            try {if (set != null) set.close();}             catch (SQLException e) {}
            try {if (statement != null) statement.close();} catch (SQLException e) {}
            if(connection != super.getConnection())
            {
                try{connection.close();} catch(SQLException e){}
            }
            }

  }


    public Vector<InfoFinExecutor> getCFList()
            throws PersistenceException, DatasourceConnectException {

        Vector<InfoFinExecutor> list = new Vector<>();
        String selectStr = null;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        try {
            selectStr = "select distinct fincode from finexecutor";

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                InfoFinExecutor info = new InfoFinExecutor();
                info.finCode = resultSet.getInt(1);

                list.add(info);
            }
            resultSet.close();
            System.out
                    .println("select InfoFinExecutor is done ! Total count = "
                            + list.size());

            return list;
        } catch (SQLException e) {
            throw new PersistenceException("Can't InfoFinExecutor codes", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }
    }


    public class InfoFinExecutor {
        public int finCode = Integer.MIN_VALUE;
        public InfoFinExecutor() {
        }
    }

    public class InfoUpdFinExecutor {
        public int minCode;
        public String codes;
        public InfoUpdFinExecutor() {
        }
    }


    public Vector<InfoUpdFinExecutor> getUpdFinExecutor(int finCode)
            throws PersistenceException, DatasourceConnectException {

        Vector<InfoUpdFinExecutor> list = new Vector<>();
        String selectStr = null;
        Connection connection = getConnection();
        PreparedStatement statement = null;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        try {
            selectStr = "select min(code), group_concat(code::text,',') from finexecutor " +
                    " where fincode = " + finCode +
                    " group by name, fintypename, fintypecode, finkindname, finkindcode, fincehname, fincehcode, " +
                    "          axorgid, axparentorgid, axparentorgname, axorgtypeid, axorgtypename " +
                    " having count(code) > 1";

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                InfoUpdFinExecutor info = new InfoUpdFinExecutor();
                info.minCode = resultSet.getInt(1);
                info.codes = resultSet.getString(2);

                list.add(info);
            }
            resultSet.close();

            return list;
        } catch (SQLException e) {
            throw new PersistenceException("Can't updFinExecutor codes", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
        }
    }


    public void updFinexecutor2Plan(int minCode, String codes)
            throws PersistenceException, DatasourceConnectException {
        String sqlStr = null;
        PreparedStatement statement = null;
        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        try {
            sqlStr = " update finexecutor2plan set finexecutorcode = " + minCode + " where finexecutorcode in (" + codes + ")";

            statement = connection.prepareStatement(sqlStr);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't perform fast updFinexecutor2Plan status update", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public void updEnPlanWorkItem(int minCode, String codes)
            throws PersistenceException, DatasourceConnectException {
        String sqlStr = null;
        PreparedStatement statement = null;
        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        try {
            sqlStr = " update enplanworkitem set executorcode = " + minCode + " where executorcode in (" + codes + ")";

            statement = connection.prepareStatement(sqlStr);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't perform fast updEnPlanWorkItem status update", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public void updEnPlanWork(int minCode, String codes)
            throws PersistenceException, DatasourceConnectException {
        String sqlStr = null;
        PreparedStatement statement = null;
        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        try {
            sqlStr = " update enplanwork set finexecutorcode = " + minCode + " where finexecutorcode in (" + codes + ")";

            statement = connection.prepareStatement(sqlStr);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't perform fast updEnPlanWork status update", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public void deleteFinExecutor() {
        try {
            deleteFinExecutor(Integer.MIN_VALUE, null);
        } catch (PersistenceException e) {
            e.printStackTrace();
        } catch (DatasourceConnectException e) {
            e.printStackTrace();
        }
    }

    public void deleteFinExecutor(int minCode, String codes)
            throws PersistenceException, DatasourceConnectException {
        String sqlStr = null;
        PreparedStatement statement = null;

        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

        try {
            sqlStr = " delete from finexecutor where code in (" + codes + ") and code <> " + minCode;


            //FINExecutorFilter eFilter = new FINExecutorFilter();
            //eFilter.conditionSQL = " code in (" + codes + ") and code <> " + minCode;

            //eFilter.conditionSQL = " code in (" +
            //        " select f.code from finexecutor f " +
            //        " except " +
            //        " select pl.finexecutorcode from enplanwork pl " +
            //        " except select pi.executorcode from enplanworkitem pi " +
            //        " except select f2p.finexecutorcode from finexecutor2plan f2p) ";


            //int eArr[] = this.getFilteredCodeArray(eFilter, eFilter.conditionSQL, null, 0, -1, null);

            //for (int i = 0; i < eArr.length; i++) {
            //    super.remove(eArr[i]);

            //    System.out.println("### delete FinExecutor: code = " + eArr[i] + " : totalCount = " + eArr.length);
            //}

            statement = connection.prepareStatement(sqlStr);
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new PersistenceException(
                    "Can't perform delete finexecutor ", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }


    private transient java.sql.Connection connection = null;

    protected java.sql.Connection getConnection(String dataSourceName)
            throws DatasourceConnectException {
        try {
            InitialContext initialContext = new InitialContext();
            DataSource dataSource = (DataSource) initialContext
                    .lookup(dataSourceName);
            connection = dataSource.getConnection();
            return connection;
        } catch (NamingException e) {
            throw new DatasourceConnectException(dataSourceName, e);
        } catch (SQLException e) {
            throw new DatasourceConnectException(dataSourceName, e);
        }
    }



    public class DomainInfo {
        public String domainName;
        public int minCodeValue;
        public int maxCodeValue;
    }

    public DomainInfo getDomainInfo(String userName)
            throws PersistenceException, DatasourceConnectException {
        Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
        PreparedStatement statement = null;
        DomainInfo info = null;

        try {
            String selectStr = "select d.name, d.dinfmincodevalue, d.dinfmaxcodevalue"
                    + " from auth_domain d"
                    + " where d.name = (select user_domain"
                    + " from auth_user"
                    + " where user_name = " + "'" + userName + "')";

            statement = connection.prepareStatement(selectStr);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                info = new DomainInfo();
                info.domainName = resultSet.getString(1);
                info.minCodeValue = resultSet.getInt(2);
                info.maxCodeValue = resultSet.getInt(3);
            }
            resultSet.close();

            return info;
        } catch (SQLException e) {
            throw new PersistenceException("Can't get DomainInfo", e);
        } finally {
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    @Override
	public int add(FINExecutor finExecutor) throws PersistenceException {

        UserProfile userProfile = getUserProfile();
        Connection connection = getConnection();

        try {

        	FINExecutorLogic finExecutorLogic = new FINExecutorLogic(connection, userProfile);


        	/**
        	 *	31.05.2018... +++ проверим наличие подразделения...
        	 */
        	if (finExecutor.axOrgId != null && finExecutor.axOrgId.length() > 0) {

        		FINExecutorFilter finExecutorFilter = new FINExecutorFilter();
        		finExecutorFilter.axOrgId = finExecutor.axOrgId;

        		FINExecutorShortList finExecutorShortList = getFINExecutorList(finExecutorFilter, 0, -1);
        		if (finExecutorShortList.totalCount > 0) {

        			finExecutor.axOrgId = finExecutorShortList.get(0).axOrgId;
        			finExecutor.axParentOrgId = finExecutorShortList.get(0).axParentOrgId;
        			finExecutor.axParentOrgName = finExecutorShortList.get(0).axParentOrgName;
        			finExecutor.axOrgTypeId = finExecutorShortList.get(0).axOrgTypeId;
        			finExecutor.axOrgTypeName = finExecutorShortList.get(0).axOrgTypeName;

        		} else {
        			throw new SystemException("\n\n"
            				+ "Підрозділ " + finExecutor.name + " не знайдено в структурі підприємства! \n"
            				+ "Оберіть виконавця на плані ще раз.");
        		}

        	} else {
        		throw new SystemException("\n\n"
        				+ "Підрозділ " + finExecutor.name + " не знайдено в структурі підприємства! \n"
        				+ "Оберіть виконавця на плані ще раз.");
        	}

        	/**
        	 *	31.05.2018... +++ дополним полным наименованием подразделения...
        	 */
        	String fullAxExecutorName = finExecutorLogic.getFullAxExecutorName(finExecutor);
        	finExecutor.name = fullAxExecutorName;


            /**
             *  проверка уникальности по полям....
             *  name, fincode, fintypename, fintypecode,
             *  finkindname, finkindcode, fincehname, fincehcode
             *
             */

            finExecutor.code = Integer.MIN_VALUE;

            FINExecutor distFinExecutor = finExecutorLogic.checkUnicFinExecutor(finExecutor);


            /* если есть такая запись - используем её */
            if (distFinExecutor.code != Integer.MIN_VALUE) {

                return distFinExecutor.code;

            } else {
            /* если изменилось одно из полей - добавляем */

            	// На случай, если вернемся после AX назад на ФК, сохраним код подразделения из ФК, соответствующий коду из AX
            	/* 28.08.2018... +++ зачем менять finCode, если выше была проверка на уникальность...
            	if (finExecutor.axOrgId != null)
            	{
            		if (! finExecutor.axOrgId.equals(""))
            		{
                    	AXOrgId2FKOrgIdDAO ax2fkDAO = new AXOrgId2FKOrgIdDAO(connection, userProfile);

                    	AXOrgId2FKOrgIdFilter ax2fkFilter = new AXOrgId2FKOrgIdFilter();
                    	ax2fkFilter.axOrgId = finExecutor.axOrgId;

                    	AXOrgId2FKOrgIdShortList ax2fkList = ax2fkDAO.getScrollableFilteredList(ax2fkFilter, 0, -1);

                    	if (ax2fkList.totalCount > 0)
                    	{
                    		if (ax2fkList.get(0).fkOrgId != null)
                    		{
                    			if (! ax2fkList.get(0).fkOrgId.equals(""))
                    			{
                    				finExecutor.finCode = Integer.parseInt(ax2fkList.get(0).fkOrgId);
                    			}
                    		}
                    	}
            		}
            	}
            	*/

                return super.add(finExecutor);
            }


        } finally {
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public int[] getUnicFilteredCodeArray(FINExecutorFilter aFilterObject,
            int fromPosition, int quantity) throws PersistenceException {
        return getUnicFilteredCodeArray(
                aFilterObject,
                (aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
                (aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
                fromPosition, quantity, null);
    }

    public int[] getUnicFilteredCodeArray(FINExecutor aFilterObject,
            String anCondition, String anOrderBy, int fromPosition,
            int quantity, Vector<Object> aBindObjects) throws PersistenceException {
        Vector<Integer> result = new Vector<>();

        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet set = null;
        String selectStr = "SELECT MAX(FINEXECUTOR.CODE) FROM FINEXECUTOR";
        String whereStr = "";
        String condition = processCondition(anCondition);
        String orderBy = processCondition(anOrderBy);

        /* !!! group By !!! */
        if (orderBy.length() == 0)
            orderBy = " name, fincode, fintypename, fintypecode, " +
                    " finkindname, finkindcode, fincehname, fincehcode, " +
            		" axorgid, axparentorgid, axparentorgname, axorgtypeid, axorgtypename";

        if (quantity < 0)
            quantity = Integer.MAX_VALUE / 2;

        if (getUserProfile() == null)
            throw new PersistenceException(
                    "Internal Error (User Profile Is Undefined)");

        if (aFilterObject != null) {
            if (aFilterObject.code != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR.CODE = ?";
            }
            if (aFilterObject.name != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.name.indexOf('*', 0) < 0
                        && aFilterObject.name.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.NAME = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.NAME LIKE ?";
            }
            if (aFilterObject.finCode != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR.FINCODE = ?";
            }
            if (aFilterObject.finTypeName != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.finTypeName.indexOf('*', 0) < 0
                        && aFilterObject.finTypeName.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.FINTYPENAME = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.FINTYPENAME LIKE ?";
            }
            if (aFilterObject.finTypeCode != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR.FINTYPECODE = ?";
            }
            if (aFilterObject.finKindName != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.finKindName.indexOf('*', 0) < 0
                        && aFilterObject.finKindName.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.FINKINDNAME = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.FINKINDNAME LIKE ?";
            }
            if (aFilterObject.finKindCode != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR.FINKINDCODE = ?";
            }
            if (aFilterObject.finCehName != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.finCehName.indexOf('*', 0) < 0
                        && aFilterObject.finCehName.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.FINCEHNAME = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.FINCEHNAME LIKE ?";
            }
            if (aFilterObject.finCehCode != Integer.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR.FINCEHCODE = ?";
            }

            if (aFilterObject.axOrgId != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.AXORGID = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.AXORGID LIKE ?";
            }
            if (aFilterObject.axParentOrgId != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.axParentOrgId.indexOf('*',0) < 0 && aFilterObject.axParentOrgId.indexOf('?',0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGID = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGID LIKE ?";
            }
            if (aFilterObject.axParentOrgName != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.axParentOrgName.indexOf('*',0) < 0 && aFilterObject.axParentOrgName.indexOf('?',0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGNAME = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.AXPARENTORGNAME LIKE ?";
            }
           if(aFilterObject.axOrgTypeId != Integer.MIN_VALUE) {
               if(whereStr.length() != 0)
                  whereStr = whereStr + " AND ";
               whereStr = whereStr + "  FINEXECUTOR.AXORGTYPEID = ?";
           }
            if (aFilterObject.axOrgTypeName != null) {
                if(whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.axOrgTypeName.indexOf('*',0) < 0 && aFilterObject.axOrgTypeName.indexOf('?',0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.AXORGTYPENAME = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.AXORGTYPENAME LIKE ?";
            }

            /* 28.02.2014 В сад сегрегацию!!!!!
            if (aFilterObject.domain_info != null) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                if (aFilterObject.domain_info.indexOf('*', 0) < 0
                        && aFilterObject.domain_info.indexOf('?', 0) < 0)
                    whereStr = whereStr + "  FINEXECUTOR.DOMAIN_INFO = ?";
                else
                    whereStr = whereStr + "  FINEXECUTOR.DOMAIN_INFO LIKE ?";
            }
            */
            if (aFilterObject.modify_time != Long.MIN_VALUE) {
                if (whereStr.length() != 0)
                    whereStr = whereStr + " AND ";
                whereStr = whereStr + "  FINEXECUTOR.MODIFY_TIME = ?";
            }

        }

        if (condition.length() != 0) {
            if (whereStr.length() != 0)
                whereStr = whereStr + " AND ";
            whereStr = whereStr + " (" + condition + ")";
        }

        if (whereStr.length() != 0)
            selectStr = selectStr + " WHERE" + whereStr;

        selectStr = selectStr + " GROUP BY " + orderBy;

        try {

        	statement = connection.prepareStatement(selectStr);

            int number = 0;
            if (aFilterObject != null) {
                if (aFilterObject.code != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.code);
                }
                if (aFilterObject.name != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.name.indexOf('*', 0) < 0
                            && aFilterObject.name.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.NAME = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.NAME LIKE ?";

                    if (aFilterObject.name != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.name);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.finCode != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.finCode);
                }
                if (aFilterObject.finTypeName != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.finTypeName.indexOf('*', 0) < 0
                            && aFilterObject.finTypeName.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.FINTYPENAME = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.FINTYPENAME LIKE ?";

                    if (aFilterObject.finTypeName != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.finTypeName);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.finTypeCode != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.finTypeCode);
                }
                if (aFilterObject.finKindName != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.finKindName.indexOf('*', 0) < 0
                            && aFilterObject.finKindName.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.FINKINDNAME = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.FINKINDNAME LIKE ?";

                    if (aFilterObject.finKindName != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.finKindName);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.finKindCode != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.finKindCode);
                }
                if (aFilterObject.finCehName != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.finCehName.indexOf('*', 0) < 0
                            && aFilterObject.finCehName.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.FINCEHNAME = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.FINCEHNAME LIKE ?";

                    if (aFilterObject.finCehName != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.finCehName);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                if (aFilterObject.finCehCode != Integer.MIN_VALUE) {
                    number++;
                    statement.setInt(number, aFilterObject.finCehCode);
                }

                if (aFilterObject.axOrgId != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.axOrgId.indexOf('*',0) < 0 && aFilterObject.axOrgId.indexOf('?',0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.AXORGID = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.AXORGID LIKE ?";

                  if(aFilterObject.axOrgId != null){
                      number++;
                      StringBuffer likeStr = new StringBuffer();
                      likeStr.append(aFilterObject.axOrgId);
                      for(int i = 0;i < likeStr.length();i++){
                           if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                           if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                      }
                      statement.setString(number,likeStr.toString());
                  }
                }
                if (aFilterObject.axParentOrgId != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.axParentOrgId.indexOf('*',0) < 0 && aFilterObject.axParentOrgId.indexOf('?',0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.AXPARENTORGID = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.AXPARENTORGID LIKE ?";

                  if(aFilterObject.axParentOrgId != null){
                      number++;
                      StringBuffer likeStr = new StringBuffer();
                      likeStr.append(aFilterObject.axParentOrgId);
                      for(int i = 0;i < likeStr.length();i++){
                           if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                           if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                      }
                      statement.setString(number,likeStr.toString());
                  }
                }
                if (aFilterObject.axParentOrgName != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.axParentOrgName.indexOf('*',0) < 0 && aFilterObject.axParentOrgName.indexOf('?',0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.AXPARENTORGNAME = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.AXPARENTORGNAME LIKE ?";

                  if(aFilterObject.axParentOrgName != null){
                      number++;
                      StringBuffer likeStr = new StringBuffer();
                      likeStr.append(aFilterObject.axParentOrgName);
                      for(int i = 0;i < likeStr.length();i++){
                           if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                           if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                      }
                      statement.setString(number,likeStr.toString());
                  }
                }
                if(aFilterObject.axOrgTypeId != Integer.MIN_VALUE){
                    number++;
                    statement.setInt(number,aFilterObject.axOrgTypeId);
                }
                if (aFilterObject.axOrgTypeName != null) {
                    if(whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.axOrgTypeName.indexOf('*',0) < 0 && aFilterObject.axOrgTypeName.indexOf('?',0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.AXORGTYPENAME = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.AXORGTYPENAME LIKE ?";

                  if(aFilterObject.axOrgTypeName != null){
                      number++;
                      StringBuffer likeStr = new StringBuffer();
                      likeStr.append(aFilterObject.axOrgTypeName);
                      for(int i = 0;i < likeStr.length();i++){
                           if(likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i,'%');
                           if(likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i,'_');
                      }
                      statement.setString(number,likeStr.toString());
                  }
                }

                /* 28.02.2014 В сад сегрегацию!!!!!
                if (aFilterObject.domain_info != null) {
                    if (whereStr.length() != 0)
                        whereStr = whereStr + " AND";
                    if (aFilterObject.domain_info.indexOf('*', 0) < 0
                            && aFilterObject.domain_info.indexOf('?', 0) < 0)
                        whereStr = whereStr + " FINEXECUTOR.DOMAIN_INFO = ?";
                    else
                        whereStr = whereStr + " FINEXECUTOR.DOMAIN_INFO LIKE ?";

                    if (aFilterObject.domain_info != null) {
                        number++;
                        StringBuffer likeStr = new StringBuffer();
                        likeStr.append(aFilterObject.domain_info);
                        for (int i = 0; i < likeStr.length(); i++) {
                            if (likeStr.charAt(i) == '*')
                                likeStr.setCharAt(i, '%');
                            if (likeStr.charAt(i) == '?')
                                likeStr.setCharAt(i, '_');
                        }
                        statement.setString(number, likeStr.toString());
                    }
                }
                */
                if (aFilterObject.modify_time != Long.MIN_VALUE) {
                    number++;
                    if (aFilterObject.modify_time == Long.MIN_VALUE)
                        statement.setBigDecimal(number, null);
                    else
                        statement.setBigDecimal(number,
                                new java.math.BigDecimal(
                                        aFilterObject.modify_time));
                }
            }

            if (condition.length() > 0 && aBindObjects != null)
                _bindObjectsToPreparedStatement(statement, aBindObjects, number);

            set = statement.executeQuery();
            int i;
            for (i = 0; set.next(); i++) {
                if (i < fromPosition)
                    continue;
                else if (i >= fromPosition + quantity) {
                    i++;
                    break;
                }

                result.add(new Integer(set.getInt(1)));
            }

            int[] array;

            array = new int[result.size()];
            for (int j = 0; j < result.size(); j++)
                array[j] = ((Integer) result.get(j)).intValue();


            return array;

        } catch (SQLException e) {
            System.out.println(e.getMessage() + "\nstatement - " + selectStr);
            EnergyproPersistenceExceptionAnalyzer.analyser
                    .throwPersistenceException(e);
            return null;
        } finally {
            try {
                if (set != null)
                    set.close();
            } catch (SQLException e) {
            }
            try {
                if (statement != null)
                    statement.close();
            } catch (SQLException e) {
            }
            if (connection != super.getConnection()) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }

    } // end of getFilteredCodeArray

    public Vector<String> getAllCodesDown(String parentCode, boolean isReload) throws PersistenceException {
    	try {
        	Vector<String> vec = new Vector<>();
        	vec.add(parentCode);
        	AuthLogic netAuth = new AuthLogic(getConnection(), getUserProfile());
        	boolean usesMDAX = netAuth.checkUsesMDAXData();
        	if(isReload) {
            	reloadFinExecutor();
        	}


        	if(parentCode != null && parentCode.length() > 0) {
            	for(FINExecutorCache cache: finExecutorCacheHash) {
            		boolean check = (usesMDAX) ? (cache != null && cache.finExecutor != null && cache.finExecutor.axParentOrgId != null && cache.finExecutor.axParentOrgId.equals(parentCode))
            				: cache.finExecutor.main_podr_id == Integer.valueOf(parentCode) ;
            		if(check) {
            			if(usesMDAX) {
            				vec.addAll(getAllCodesDown(cache.finExecutor.axOrgId, false));
            			} else {
            				vec.addAll(getAllCodesDown(String.valueOf(cache.finExecutor.finCode), false));
            			}
            		}
            	}
        	}



        	return vec;
    	} catch(NumberFormatException e) {
    		throw new SystemException(String.format("Неправильное число: %s", parentCode));
    	}

    }


	public void updEnElement(int minCode, String codes)
			throws PersistenceException, DatasourceConnectException {
		String sqlStr = null;
		PreparedStatement statement = null;
		Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

		try {
			sqlStr = " update enelement set finexecutorcode = " + minCode + " where finexecutorcode in (" + codes + ")";

			statement = connection.prepareStatement(sqlStr);
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException("Can't perform fast updEnElement  update", e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}



	public void updEpRen2FinExecutor(int minCode, String codes)
			throws PersistenceException, DatasourceConnectException {
		String sqlStr = null;
		PreparedStatement statement = null;
		Connection connection = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

		try {
			sqlStr = " update epren2finexecutor set finexecutorrefcode = " + minCode + " where finexecutorrefcode in (" + codes + ")";

			statement = connection.prepareStatement(sqlStr);
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException("Can't perform fast updEnElement  update", e);
		} finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	private synchronized void clearFinExecutorCache() {
		finExecutorCacheHash.clear();
		finExecutorCacheHash = new Vector<>();
	}

} // end of FINExecutorDAO
