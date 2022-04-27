package com.ksoe.energynet.logic;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.valueobject.Config;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.services.inventoryonhandksservice.InventoryOnHandFinder;
import com.ksoe.mdax.util.WebServicesConsts;
import com.microsoft.schemas.dynamics._2008._01.services.InventoryOnhandKSService;
import com.microsoft.schemas.dynamics._2008._01.services.InventoryOnhandKSService_Service;

public class FinMaterialsLogic extends LogicModule {

	public FinMaterialsLogic(Connection connection, UserProfile userProfile) {
		super(connection, userProfile);
	}


	public Date getOpenPeriodDate() throws PersistenceException {
		Date out = new Date();
		String selectStr;
		PreparedStatement statement = null;
		ResultSet set = null;
		selectStr = "select to_date(s.val,'dd.MM.yyyy') from umc_dba.umc_settings s where upper(s.name) = 'VALID_DATE_TO'";

		try {
			statement = connection.prepareStatement(selectStr);
			set = statement.executeQuery();
			if (set.next()) {
				out = set.getDate(1);
			}

			set.close();
			statement.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			EnergyproPersistenceExceptionAnalyzer.analyser
					.throwPersistenceException(e);
		}

		finally {
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
		}

		return out;
	}


	public FINMaterialsList getMaterialsList(FINMaterialsFilter aFilterObject,
			String balansNumberCondition, String molCode,
			String materialCondition, Date date, int finDocCode)
			throws PersistenceException {

		FINMaterialsList result = new FINMaterialsList();
		result = this.getMaterialsList(aFilterObject, balansNumberCondition,
				molCode, materialCondition, date, finDocCode,
				ENConsts.SOURCE_SELECTION_RESTS_AUTO);

		return result;
	}



	  /**
	   *
	   * Выборка остатков
	   *
	   * @param aFilterObject фильтр остатков
	   * @param balansNumberCondition условие по счетам
	   * @param molCode МОЛ, если <b>null</b>, то МОЛ не учитывается
	   * @param materialCondition условие по материалам
	   * @param date дата остатков
	   * @param finDocCode документ для которого выбираются остатки
	   * @return список остатков
	   * @throws PersistenceException
	   */
		public FINMaterialsList getMaterialsList(FINMaterialsFilter aFilterObject,
				String balansNumberCondition, String molCode,
				String materialCondition, Date date, int finDocCode,
				String sourceSelectRests) throws PersistenceException {

			FINMaterialsList result = new FINMaterialsList();
			FINMaterials anObject;
			result.list = new Vector();

			////////////////////////////////////////////////////////////////////////////////////////////////

			AuthLogic netAuth = new AuthLogic(connection, userProfile);

			if (netAuth.checkUsesMDAXData(Config.CONFIG_USES_MDAX_INVENTORYONHAND)
					&& (sourceSelectRests.equals(ENConsts.SOURCE_SELECTION_RESTS_AX) // или принудительно с аксапты или без разницы откуда
	                  || sourceSelectRests.equals(ENConsts.SOURCE_SELECTION_RESTS_AUTO) // или принудительно с аксапты или без разницы откуда
	   				)
					) {

				if (aFilterObject != null) {

					InventoryOnhandKSService_Service inventoryOnHandService = new InventoryOnhandKSService_Service();
					InventoryOnhandKSService inventoryOnHandProxy = inventoryOnHandService.getBasicHttpBindingInventoryOnhandKSService();
					((BindingProvider) inventoryOnHandProxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, WebServicesConsts.userName);
					((BindingProvider) inventoryOnHandProxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, WebServicesConsts.userPass);

					InventoryOnHandFinder inventoryOnHandFinder = new InventoryOnHandFinder(inventoryOnHandProxy);


			        /*
		            String divCode = "";
		   			if (aFilterObject.div_code != null) {

		   				divCode = aFilterObject.div_code;

		   				StringBuffer likeStr = new StringBuffer();
		   				likeStr.append(divCode);
		   				for (int i = 0; i < likeStr.length(); i++) {
		   					if (likeStr.charAt(i) == '*')
		   						likeStr.setCharAt(i, '*');
		   				}

		   				divCode = likeStr.toString();
		   				inventoryOnHandFinder.parmCriteriaDivCode(divCode);
		   			}
					*/

		   			if (molCode != null) {
		   				inventoryOnHandFinder.parmCriteriaDivCode(molCode);
		   			}

		   			if (aFilterObject.nn != null) {
		   				inventoryOnHandFinder.parmCriteriaNN(aFilterObject.nn);
		   			}

		   			if (aFilterObject.mat_name != null) {
		   				inventoryOnHandFinder.parmCriteriaMatName(aFilterObject.mat_name);
		   			}

		   			if (aFilterObject.div_name != null) {
		   				inventoryOnHandFinder.parmCriteriaDivName(aFilterObject.div_name);
		   			}

		   			if(aFilterObject.ax_party_id != null) {
		   				inventoryOnHandFinder.parmCriteriaPartyId(aFilterObject.ax_party_id);
		   			}

		   			if (aFilterObject.bal_sch != null) {
		   				inventoryOnHandFinder.parmCriteriaBalSch(aFilterObject.bal_sch);
		   			}

		            return inventoryOnHandFinder.getAXInventoryOnHandList();
				}

				return result;
			}
			////////////////////////////////////////////////////////////////////////////////////////////////

			String selectStr;
			PreparedStatement statement = null;
			ResultSet set = null;

			String condition = (aFilterObject.conditionSQL == null ? "" : aFilterObject.conditionSQL);
			String orderBy = (aFilterObject.orderBySQL == null ? "" : aFilterObject.orderBySQL);
			String whereStr = " ";

			//String     orderBy = processCondition(anOrderBy);
			// !!!!!!!!!!!!!!
			// только 20-е счетААААААААА
			// + 22 - малоценка и быстроизнашивающиеся ...
			// ВСЕ с клиента ... для списания надо брать все подряд ..
			//
			// 17.12.10 Пока можно не обрубать эти условия,
			// потому что с клиента пока все равно для списаний заезжает условие только по 20-м счетам
			// все едет с клиента !!! уже есть СПИСАНИЯ ОЗ и МБП  String balansNumberCondition_1 = " and substr(rpsc.bal_sch,1,2) in ('20', '22') ";
			// String balansNumberCondition_2 = " and substr(rst.bal_sch,1,2) in ('20', '22')";

			String balansNumberCondition_1 = "";
			String balansNumberCondition_2 = "";

			// Для переезда центрального склада откроем технику склада доступ к оперативному запасу
			/*String strUser = "";
		   	if(this.getUserProfile().userName.toUpperCase().equals(new String("ShpitkoNV").toUpperCase()))
		       strUser = "'" + new String("ShpitkoNV").toUpperCase() + "'";
		   	else
		       strUser = "user"; */

			selectStr =
				"    select " + //dat.* " +
				"    mat_id, nn, mat_name, mu_id, mu_name, div_code, div_name, party_id, doc_num, partner, partner_name, doc_date, " +
				"    party_description, rest_purpose_id, rest_purpose_name, rest_purpose_type_id, budget_core_id, frc_code, frc_name, " +
				"    nvl(calc_price, price) as calc_price, quantity, price, cost, bal_sch, selectable "+

				", isCN "+ // участие в присоединениях ... если не НАЛЛ то присоединения ...

				", wear_date " +

				" from ( "+
				"    select rest.* "+

				" , (select count(1) "+
				"  from dual "+
				"  where exists (select 1 "+
				"                  from umc_dba.user_rest_purpose urp, "+
				"                       umc_dba.rest_purpose_sch_control rpsc, "+
				"                       umc_dba.rest_purpose_doc_control rpdc, "+
				"                       umc_dba.thead h "+
				"                  where rest.rest_purpose_type_id <> 3 "+ // все ДОСТПНЫЕ (правами ФК) кроме резерва ................ брать ТОЛЬКО оперативный ЗАПАС !!!
				"                    and rest.rest_purpose_type_id = rpsc.rest_purpose_type_id "+
				"                    and rest.rest_purpose_type_id = rpdc.rest_purpose_type_id "+
				"                    and rest.rest_purpose_id = urp.rest_purpose_id "+
				"                    and rpdc.op_kind_id = h.op_kind_id "+
				"                    " + balansNumberCondition_1 +
				"                    and h.id = ? "+ // -- docCode !!! <------------------------------------------ "+
				"                    and bitand(urp.access_level, 1) <> 0 "+
				"                    and urp.user_name = user) "+
				" ) selectable "+

				"    from (select rst.mat_id, "+
				"                 rst.nn,"+
				"                 rst.mat_name,"+
				"                 rst.mu_id,"+
				"                 rst.mu_name,"+
				"                 rst.div_code,"+
				"                 rst.div_name,"+
				"                 rst.party_id,"+
				"                 rst.rest_purpose_agree_id as isCN," + // priConnection

				 // "                 decode(h.op_kind_id,"+
				 // "                        null, dh.doc_num,"+
				 // "                           0, 'МАКЕТ',"+
				 // "                          -4, 'ПЕРЕДАЧА',"+
				 // "                          -5, 'ПЕРЕДАЧА',"+
				 // "                        h.doc_num"+
				 // "                 ) doc_num,"+

				  "                 h.doc_num  doc_num, " +

				 // "                 decode(h.op_kind_id,"+
				 // "                        null, dh.sender_id,"+
				 // "                        h.sender_id"+
				 // "                 ) partner,"+

				  " 				h.sender_id partner, " +

				 // "                 decode(h.id,"+
				 // "                        null, decode(dh.partner_type,"+
				 // "                                     null, 'Документ был удален или перемещен в другое подразделение!',"+
				 // "                                     0, umc_dba.GetDivName(dh.sender_id),"+
				 // "                                     umc_dba.get_partner_name(dh.partner_id) "+
				 // "                              ),"+
				 // "                        decode(h.partner_type,"+
				 // "                               null, 'Документ был удален или перемещен в другое подразделение!',"+
				 // "                                  0, umc_dba.GetDivName(h.sender_id),"+
				 // "                               umc_dba.get_partner_name(h.partner_id)"+
				 // "                        )"+
				 // "                 ) partner_name,"+

				  "					decode(h.partner_type, " +
				  "                               null, 'Документ был удален или перемещен в другое подразделение!', " +
				  "                               0, umc_dba.GetDivName(h.sender_id), " +
				  "                               umc_dba.get_partner_name(h.partner_id) " +
				  "					) partner_name, " +

				  "                 rst.party_date doc_date,"+
				  "                 rst.party_desc party_description,"+
				  "                 decode(sa.rest_purpose,     1, rst.rest_purpose_id,     null) rest_purpose_id,"+
				  "                 decode(sa.rest_purpose,     1, rst.rest_purpose_name,   null) rest_purpose_name,"+
				  "                 decode(sa.rest_purpose,     1, rst.rest_purpose_type_id,null) rest_purpose_type_id,"+
				  "                 decode(sa.budget_core,      1, rst.budget_core_id,      null) budget_core_id,"+
				  "                 decode(sa.budget_core,      1, rst.frc_code,            null) frc_code,"+
				  "                 decode(sa.budget_core,      1, rst.frc_name,            null) frc_name,"+

				  "                 decode(sa.wear_date, 1, rst.wear_date, null) as wear_date, " +

				  "                 p.calc_price,"+
				  "                 sum(rst.quantity) quantity,"+
				  "                 decode(sum(rst.quantity),"+
				  "                        0, 0,"+
				  "                        round(sum(rst.cost)/sum(rst.quantity), 2)"+
				  "                 ) price,"+
				  "                 sum(rst.cost) cost"+
				  "                    ,rst.bal_sch " +
				  "            from umc_dba.v_calc_rest_detail rst,"+
				  "                 (select decode(bitand(a.analitics, umc_dba.Pkg_Const.sa_weardate), 0, 0, 1) wear_date, "+
				  "            decode(bitand(a.analitics, umc_dba.Pkg_Const.sa_rest_purpose), 0, 0, 1) rest_purpose, "+
				  "            decode(bitand(a.analitics, umc_dba.Pkg_Const.sa_budget_core), 0, 0, 1) budget_core "+
				  //типа шоб выбрать дату ввода в экспл... wear_date "           from (select 12352 analitics from dual) a "+
				  "           from (select 12608 analitics from dual) a "+
				  "    ) sa,"+
				  "                 umc_dba.party p,"+
				  // "                 umc_dba.drafthead dh,"+
				  "                 umc_dba.thead h "+
				  "where rst.party_id = p.id "+
				  "              and p.doc_id = h.id (+) "+
				  // "              and p.draft_id = dh.id (+) "+
				  ((molCode != null) ? "              and rst.div_code = ? " : "") + // molCode
				  "              "+ materialCondition + // materialCondition //and rst.mat_id in ("+ materialCondition +")
				  "              " + balansNumberCondition_2 + //

				  	// чтобы не брали 10 в\о - полуприход .. непроведенный бухами приход
				  //-----------------------------------------------------------------
				  // $)) на клиенте где надо ;)) " and h.op_kind_id not in('10','310','300')" +
				  //------------------------------------------------------
				  "              and nvl(decode(0, "+
				  "                             0, p.doc_id, "+
				  "                             1, p.draft_id, "+
				  "                             2, null), "+
				  "                      -9999999999) <> ? "+ // docCode
				  "having  "+
				  "(sum(rst.quantity) <> 0 or sum(rst.cost) <> 0) "+
				           "   group by rst.mat_id, "+
				           "            rst.nn, "+
				           "            rst.mat_name, "+
				           "            rst.mu_id, "+
				           "            rst.mu_name,  "+
				           "            rst.div_code, "+
				           "            rst.div_name, "+
				           "            rst.party_id, "+
				           "            h.op_kind_id, "+
				           // "            dh.doc_num, "+
				           "            h.doc_num, "+
				           // "            dh.sender_id, "+
				           "            h.sender_id, "+
				           "            h.id, "+
				           // "            dh.partner_type, "+
				           // "            dh.partner_id, "+
				           "            h.partner_type, "+
				           "            h.partner_id, "+
				           "            rst.party_date, "+
				           "            rst.party_desc, "+
				           "            decode(sa.wear_date, 1, rst.wear_date, null), "+
				           "            decode(sa.rest_purpose,     1, rst.rest_purpose_id,      null), "+
				           "            decode(sa.rest_purpose,     1, rst.rest_purpose_name,    null), "+
				           "            decode(sa.rest_purpose,     1, rst.rest_purpose_type_id, null), "+
				           "            decode(sa.budget_core,      1, rst.budget_core_id,       null), "+
				           "            decode(sa.budget_core,      1, rst.frc_code,             null), "+
				           "            decode(sa.budget_core,      1, rst.frc_name,             null), "+
				           "            p.calc_price"+
				           "            ,rst.bal_sch "+

				           ",rst.rest_purpose_agree_id " + // for priConnection

				           ") rest   "+
				   " ) dat where dat.selectable = 1";


			if (aFilterObject != null) {

				if (aFilterObject.mat_id != Integer.MIN_VALUE) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.MAT_ID = ?";
				}
				if (aFilterObject.nn != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.nn.indexOf('*', 0) < 0
							&& aFilterObject.nn.indexOf('?', 0) < 0)
						whereStr = whereStr + "  UPPER(dat.NN) = UPPER(?)";
					else
						whereStr = whereStr + " UPPER(dat.NN) LIKE UPPER(?)";
				}
				if (aFilterObject.mat_name != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.mat_name.indexOf('*', 0) < 0
							&& aFilterObject.mat_name.indexOf('?', 0) < 0)
						whereStr = whereStr + "  UPPER(dat.MAT_NAME) = UPPER(?)";
					else
						whereStr = whereStr + " UPPER(dat.MAT_NAME) LIKE UPPER(?)";
				}
				if (aFilterObject.mu_id != Integer.MIN_VALUE) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.MU_ID = ?";
				}
				if (aFilterObject.mu_name != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.mu_name.indexOf('*', 0) < 0
							&& aFilterObject.mu_name.indexOf('?', 0) < 0)
						whereStr = whereStr + "  UPPER(dat.MU_NAME) = UPPER(?)";
					else
						whereStr = whereStr + " UPPER(dat.MU_NAME) LIKE UPPER(?)";
				}
				if (aFilterObject.div_code != null) {
					throw new EnergyproSystemException(
							"Код МОЛа в фильтре использовать нельзя ...");
		          /*
			        if(whereStr.length() != 0)
			              whereStr = whereStr + " AND ";
			          if (aFilterObject.div_code.indexOf('*',0) < 0 && aFilterObject.div_code.indexOf('?',0) < 0)
			              whereStr = whereStr + "  UPPER(dat.DIV_CODE) = UPPER(?)";
			          else
			              whereStr = whereStr + " UPPER(dat.DIV_CODE) LIKE UPPER(?)";
			      */
				}
				if (aFilterObject.div_name != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.div_name.indexOf('*', 0) < 0
							&& aFilterObject.div_name.indexOf('?', 0) < 0)
						whereStr = whereStr + "  UPPER(dat.DIV_NAME) = UPPER(?)";
					else
						whereStr = whereStr + " UPPER(dat.DIV_NAME) LIKE UPPER(?)";
				}
				if (aFilterObject.party_id != Integer.MIN_VALUE) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.PARTY_ID = ?";
				}
				if (aFilterObject.doc_num != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.doc_num.indexOf('*', 0) < 0
							&& aFilterObject.doc_num.indexOf('?', 0) < 0)
						whereStr = whereStr + "  UPPER(dat.DOC_NUM) = UPPER(?)";
					else
						whereStr = whereStr + " UPPER(dat.DOC_NUM) LIKE UPPER(?)";
				}

		     //if(aFilterObject.partner != Integer.MIN_VALUE) {
		     //    if(whereStr.length() != 0)
		     //       whereStr = whereStr + " AND ";
		     //    whereStr = whereStr + "  dat.PARTNER = ?";
		     // }

				if (aFilterObject.partner != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.partner.indexOf('*', 0) < 0
							&& aFilterObject.partner.indexOf('?', 0) < 0)
						whereStr = whereStr + "  UPPER(dat.PARTNER) = UPPER(?)";
					else
						whereStr = whereStr + " UPPER(dat.PARTNER) LIKE UPPER(?)";
				}

				if (aFilterObject.partner_name != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.partner_name.indexOf('*', 0) < 0
							&& aFilterObject.partner_name.indexOf('?', 0) < 0)
						whereStr = whereStr
								+ "  UPPER(dat.PARTNER_NAME) = UPPER(?)";
					else
						whereStr = whereStr
								+ " UPPER(dat.PARTNER_NAME) LIKE UPPER(?)";
				}
				if (aFilterObject.doc_date != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.DOC_DATE = ?";
				}
				if (aFilterObject.party_discription != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.party_discription.indexOf('*', 0) < 0
							&& aFilterObject.party_discription.indexOf('?', 0) < 0)
						whereStr = whereStr
								+ "  UPPER(dat.PARTY_DESCRIPTION) = UPPER(?)";
					else
						whereStr = whereStr
								+ " UPPER(dat.PARTY_DESCRIPTION) LIKE UPPER(?)";
				}
				if (aFilterObject.rest_purpose_id != Integer.MIN_VALUE) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.REST_PURPOSE_ID = ?";
				}
				if (aFilterObject.rest_purpose_name != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.rest_purpose_name.indexOf('*', 0) < 0
							&& aFilterObject.rest_purpose_name.indexOf('?', 0) < 0)
						whereStr = whereStr
								+ "  UPPER(dat.REST_PURPOSE_NAME) = UPPER(?)";
					else
						whereStr = whereStr
								+ " UPPER(dat.REST_PURPOSE_NAME) LIKE UPPER(?)";
				}
				if (aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.REST_PURPOSE_TYPE_ID = ?";
				}
				if (aFilterObject.budget_core_id != Integer.MIN_VALUE) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.BUDGET_CORE_ID = ?";
				}
				if (aFilterObject.frc_code != Integer.MIN_VALUE) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.FRC_CODE = ?";
				}
				if (aFilterObject.frc_name != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.frc_name.indexOf('*', 0) < 0
							&& aFilterObject.frc_name.indexOf('?', 0) < 0)
						whereStr = whereStr + "  UPPER(dat.FRC_NAME) = UPPER(?)";
					else
						whereStr = whereStr + " UPPER(dat.FRC_NAME) LIKE UPPER(?)";
				}
				if (aFilterObject.calc_price != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.CALC_PRICE = ?";
				}
				if (aFilterObject.quantity != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.QUANTITY = ?";
				}
				if (aFilterObject.price != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.PRICE = ?";
				}
				if (aFilterObject.cost != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.COST = ?";
				}
				if (aFilterObject.bal_sch != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					if (aFilterObject.bal_sch.indexOf('*', 0) < 0
							&& aFilterObject.bal_sch.indexOf('?', 0) < 0)
						whereStr = whereStr + "  UPPER(dat.BAL_SCH) = UPPER(?)";
					else
						whereStr = whereStr + " UPPER(dat.BAL_SCH) LIKE UPPER(?)";
				}

				if (aFilterObject.wear_date != null) {
					if (whereStr.length() != 0)
						whereStr = whereStr + " AND ";
					whereStr = whereStr + "  dat.WEAR_DATE = ?";
				}

			}


			if (condition.length() != 0) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";

				whereStr = whereStr + " (" + condition + ")";
			}

			if (whereStr.length() != 0)
				selectStr = selectStr + whereStr;

			if (orderBy.length() > 0)
				selectStr = selectStr + " ORDER BY " + orderBy;

			String initSQL = null;
			CallableStatement callStmt = null;
			try {

				try {

					initSQL = "begin umc_dba.pkg_rest.init_dates_for_calc_rest(?, 1); end;";
					callStmt = connection.prepareCall(initSQL);
					callStmt.setDate(1, new java.sql.Date(date.getTime()));

					callStmt.execute();
				} catch (SQLException e) {
					System.out.println(e.getMessage() + "\nstatement - " + initSQL);
					EnergyproPersistenceExceptionAnalyzer.analyser
							.throwPersistenceException(e);
				} finally {
					try {
						if (callStmt != null)
							callStmt.close();
					} catch (SQLException e) {
					}
				}

				set = null;

				int number = 0;

				statement = connection.prepareStatement(selectStr);

				statement.setInt(1, finDocCode);
				if (molCode != null) {
					statement.setString(2, molCode);
					statement.setInt(3, finDocCode);
					number = 3;
				} else {
					statement.setInt(2, finDocCode);
					number = 2;
				}


				if (aFilterObject != null) {

					if (aFilterObject.mat_id != Integer.MIN_VALUE) {
						number++;
						statement.setInt(number, aFilterObject.mat_id);
					}

					if (aFilterObject.nn != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.nn);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}

					if (aFilterObject.mat_name != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.mat_name);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
					if (aFilterObject.mu_id != Integer.MIN_VALUE) {
						number++;
						statement.setInt(number, aFilterObject.mu_id);
					}

					if (aFilterObject.mu_name != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.mu_name);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}

					if (aFilterObject.div_code != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.div_code);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}

					if (aFilterObject.div_name != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.div_name);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
					if (aFilterObject.party_id != Integer.MIN_VALUE) {
						number++;
						statement.setInt(number, aFilterObject.party_id);
					}

					if (aFilterObject.doc_num != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.doc_num);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
					if (aFilterObject.partner != null) {
						number++;
						statement.setString(number, aFilterObject.partner);
					}

					if (aFilterObject.partner_name != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.partner_name);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
					if (aFilterObject.doc_date != null) {
						number++;
						statement.setDate(number, new java.sql.Date(
								aFilterObject.doc_date.getTime()));
					}

					if (aFilterObject.party_discription != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.party_discription);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
					if (aFilterObject.rest_purpose_id != Integer.MIN_VALUE) {
						number++;
						statement.setInt(number, aFilterObject.rest_purpose_id);
					}

					if (aFilterObject.rest_purpose_name != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.rest_purpose_name);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
					if (aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE) {
						number++;
						statement
								.setInt(number, aFilterObject.rest_purpose_type_id);
					}
					if (aFilterObject.budget_core_id != Integer.MIN_VALUE) {
						number++;
						statement.setInt(number, aFilterObject.budget_core_id);
					}
					if (aFilterObject.frc_code != Integer.MIN_VALUE) {
						number++;
						statement.setInt(number, aFilterObject.frc_code);
					}

					if (aFilterObject.frc_name != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.frc_name);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}
					if (aFilterObject.calc_price != null) {
						number++;
						aFilterObject.calc_price = aFilterObject.calc_price
								.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
						statement.setBigDecimal(number, aFilterObject.calc_price);
					}
					if (aFilterObject.quantity != null) {
						number++;
						aFilterObject.quantity = aFilterObject.quantity.setScale(6,
								java.math.BigDecimal.ROUND_HALF_UP);
						statement.setBigDecimal(number, aFilterObject.quantity);
					}
					if (aFilterObject.price != null) {
						number++;
						aFilterObject.price = aFilterObject.price.setScale(3,
								java.math.BigDecimal.ROUND_HALF_UP);
						statement.setBigDecimal(number, aFilterObject.price);
					}
					if (aFilterObject.cost != null) {
						number++;
						aFilterObject.cost = aFilterObject.cost.setScale(2,
								java.math.BigDecimal.ROUND_HALF_UP);
						statement.setBigDecimal(number, aFilterObject.cost);
					}

					if (aFilterObject.bal_sch != null) {
						number++;
						StringBuffer likeStr = new StringBuffer();
						likeStr.append(aFilterObject.bal_sch);
						for (int i = 0; i < likeStr.length(); i++) {
							if (likeStr.charAt(i) == '*')
								likeStr.setCharAt(i, '%');
							if (likeStr.charAt(i) == '?')
								likeStr.setCharAt(i, '_');
						}
						statement.setString(number, likeStr.toString());
					}

					if (aFilterObject.wear_date != null) {
						number++;
						statement.setDate(number, new java.sql.Date(
								aFilterObject.wear_date.getTime()));
					}

				}



				set = statement.executeQuery();
				int i = 0;
				for (i = 0; set.next(); i++) {

					anObject = new FINMaterials();
					anObject.mat_id = set.getInt(1);
					anObject.nn = set.getString(2);
					anObject.mat_name = set.getString(3);
					anObject.mu_id = set.getInt(4);
					anObject.mu_name = set.getString(5);
					anObject.div_code = set.getString(6);
					anObject.div_name = set.getString(7);
					anObject.party_id = set.getInt(8);
					anObject.doc_num = set.getString(9);
					anObject.partner = set.getString(10);
					anObject.partner_name = set.getString(11);
					anObject.doc_date = set.getDate(12);
					anObject.party_discription = set.getString(13);
					anObject.rest_purpose_id = set.getInt(14);
					anObject.rest_purpose_name = set.getString(15);
					anObject.rest_purpose_type_id = set.getInt(16);
					anObject.budget_core_id = set.getInt(17);
					anObject.frc_code = set.getInt(18);
					anObject.frc_name = set.getString(19);

					anObject.calc_price = set.getBigDecimal(20);
					if (anObject.calc_price != null)
						anObject.calc_price = anObject.calc_price.setScale(3,
								java.math.BigDecimal.ROUND_HALF_UP);

					anObject.quantity = set.getBigDecimal(21);
					if (anObject.quantity != null)
						anObject.quantity = anObject.quantity.setScale(6,
								java.math.BigDecimal.ROUND_HALF_UP);

					anObject.price = set.getBigDecimal(22);
					if (anObject.price != null)
						anObject.price = anObject.price.setScale(3,
								java.math.BigDecimal.ROUND_HALF_UP);

					anObject.cost = set.getBigDecimal(23);
					if (anObject.cost != null)
						anObject.cost = anObject.cost.setScale(2,
								java.math.BigDecimal.ROUND_HALF_UP);

					anObject.bal_sch = set.getString(24);

					// там еще 2 поля ... которые НЕ СЕТЯТСЯ !!!
					anObject.wear_date = set.getDate(27);

					result.list.add(anObject);

	        	}

	        	result.setTotalCount(i);

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
			}

			return result;
		}




	public FINMaterialsList getMaterialsListND(
			FINMaterialsFilter aFilterObject, String balansNumberCondition,
			String molCode, String materialCondition, Date date, int finDocCode)
			throws PersistenceException {

		FINMaterialsList result = new FINMaterialsList();
		FINMaterials anObject;
		result.list = new Vector();

		String selectStr;
		PreparedStatement statement = null;
		ResultSet set = null;

		String condition = (aFilterObject.conditionSQL == null ? ""
				: aFilterObject.conditionSQL);

		String orderBy = (aFilterObject.orderBySQL == null ? ""
				: aFilterObject.orderBySQL);

		String whereStr = " ";

		   //String     orderBy = processCondition(anOrderBy);
		   // !!!!!!!!!!!!!!
		   // только 20-е счетААААААААА
		   // + 22 - малоценка и быстроизнашивающиеся ...
		   // ВСЕ с клиента ... для списания надо брать все подряд ..
		   //
		   // 17.12.10 Пока можно не обрубать эти условия,
		   // потому что с клиента пока все равно для списаний заезжает условие только по 20-м счетам
		   // все едет с клиента !!! уже есть СПИСАНИЯ ОЗ и МБП  String balansNumberCondition_1 = " and substr(rpsc.bal_sch,1,2) in ('20', '22') ";
		  // String balansNumberCondition_2 = " and substr(rst.bal_sch,1,2) in ('20', '22')";

		   String balansNumberCondition_1 = "";
		   String balansNumberCondition_2 = "";

		   selectStr =
		"       select " + //dat.* " +
		"  mat_id,nn,mat_name,mu_id,mu_name,div_code,div_name,party_id,doc_num,partner,partner_name,doc_date, "+
		" party_description,rest_purpose_id,rest_purpose_name,rest_purpose_type_id,budget_core_id, frc_code,frc_name,nvl(calc_price, price) as calc_price ,quantity,price,cost,bal_sch,selectable "+

		", isCN "+ // участие в присоединениях ... если не НАЛЛ то присоединения ...

		", wear_date " +

		"from ( "+
		"    select rest.* "+

		 " , (select count(1) "+
		 "  from dual "+
		 "  where exists (select 1 "+
		 "                  from umc_dba.user_rest_purpose urp, "+
		 "                       umc_dba.rest_purpose_sch_control rpsc, "+
		 "                       umc_dba.rest_purpose_doc_control rpdc, "+
		 "                       umc_dba.thead h "+
		 "                  where rest.rest_purpose_type_id <> 3 "+ // все ДОСТПНЫЕ (правами ФК) кроме резерва ................ брать ТОЛЬКО оперативный ЗАПАС !!!
		 "                    and rest.rest_purpose_type_id = rpsc.rest_purpose_type_id "+
		 "                    and rest.rest_purpose_type_id = rpdc.rest_purpose_type_id "+
		 "                    and rest.rest_purpose_id = urp.rest_purpose_id "+
		 "                    and rpdc.op_kind_id = h.op_kind_id "+
		 "                    " + balansNumberCondition_1 +
		 "                    and h.id >= ? "+ // -- docCode !!! <------------------------------------------ "+
		 "                    and bitand(urp.access_level, 1) <> 0 "+
		 "                    and urp.user_name = user) "+
		") selectable "+

		  "    from (select rst.mat_id, "+
		  "                 rst.nn,"+
		  "                 rst.mat_name,"+
		  "                 rst.mu_id,"+
		  "                 rst.mu_name,"+
		  "                 rst.div_code,"+
		  "                 rst.div_name,"+
		  "                 rst.party_id,"+
		  " rst.rest_purpose_agree_id as isCN," + // priConnection
		  "                 decode(h.op_kind_id,"+
		  "                        null, dh.doc_num,"+
		  "                           0, 'МАКЕТ',"+
		  "                          -4, 'ПЕРЕДАЧА',"+
		  "                          -5, 'ПЕРЕДАЧА',"+
		  "                        h.doc_num"+
		  "                 ) doc_num,"+
		  "                 decode(h.op_kind_id,"+
		  "                        null, dh.sender_id,"+
		  "                        h.sender_id"+
		  "                 ) partner,"+
		  "                 decode(h.id,"+
		  "                        null, decode(dh.partner_type,"+
		  "                                     null, 'Документ был удален или перемещен в другое подразделение!',"+
		  "                                     0, umc_dba.GetDivName(dh.sender_id),"+
		  "                                     umc_dba.get_partner_name(dh.partner_id) "+
		  "                              ),"+
		  "                        decode(h.partner_type,"+
		  "                               null, 'Документ был удален или перемещен в другое подразделение!',"+
		  "                                  0, umc_dba.GetDivName(h.sender_id),"+
		  "                               umc_dba.get_partner_name(h.partner_id)"+
		  "                        )"+
		  "                 ) partner_name,"+
		  "                 rst.party_date doc_date,"+
		  "                 rst.party_desc party_description,"+
		  "                 decode(sa.rest_purpose,     1, rst.rest_purpose_id,     null) rest_purpose_id,"+
		  "                 decode(sa.rest_purpose,     1, rst.rest_purpose_name,   null) rest_purpose_name,"+
		  "                 decode(sa.rest_purpose,     1, rst.rest_purpose_type_id,null) rest_purpose_type_id,"+
		  "                 decode(sa.budget_core,      1, rst.budget_core_id,      null) budget_core_id,"+
		  "                 decode(sa.budget_core,      1, rst.frc_code,            null) frc_code,"+
		  "                 decode(sa.budget_core,      1, rst.frc_name,            null) frc_name,"+

		  "                    decode(sa.wear_date, 1, rst.wear_date, null) as wear_date, " +

		  "                 p.calc_price,"+
		  "                 sum(rst.quantity) quantity,"+
		  "                 decode(sum(rst.quantity),"+
		  "                        0, 0,"+
		  "                        round(sum(rst.cost)/sum(rst.quantity), 2)"+
		  "                 ) price,"+
		  "                 sum(rst.cost) cost"+
		  "                    ,rst.bal_sch " +
		  "            from umc_dba.v_calc_rest_detail rst,"+
		  "                 (select decode(bitand(a.analitics, umc_dba.Pkg_Const.sa_weardate), 0, 0, 1) wear_date, "+
		  "            decode(bitand(a.analitics, umc_dba.Pkg_Const.sa_rest_purpose), 0, 0, 1) rest_purpose, "+
		  "            decode(bitand(a.analitics, umc_dba.Pkg_Const.sa_budget_core), 0, 0, 1) budget_core "+
		  //типа шоб выбрать дату ввода в экспл... wear_date "           from (select 12352 analitics from dual) a "+
		  "           from (select 12608 analitics from dual) a "+
		  "    ) sa,"+
		  "                 umc_dba.party p,"+
		  "                 umc_dba.drafthead dh,"+
		  "                 umc_dba.thead h "+
		  "where rst.party_id = p.id "+
		  "              and p.doc_id = h.id (+) "+
		  "              and p.draft_id = dh.id (+) "+
		  "              and rst.div_code = ? "+ // molCode
		  "              "+ materialCondition + // materialCondition //and rst.mat_id in ("+ materialCondition +")
		  "              " + balansNumberCondition_2 + //

		  // чтобы не брали 10 в\о - полуприход .. непроведенный бухами приход
		  //-----------------------------------------------------------------
		  // $)) на клиенте где надо ;)) " and h.op_kind_id not in('10','310','300')" +
		  //------------------------------------------------------
		  "              and nvl(decode(0, "+
		  "                             0, p.doc_id, "+
		  "                             1, p.draft_id, "+
		  "                             2, null), "+
		  "                      -9999999999) <> ? "+ // docCode
		  "having  "+
		  "(sum(rst.quantity) <> 0 or sum(rst.cost) <> 0) "+
		           "   group by rst.mat_id, "+
		           "            rst.nn, "+
		           "            rst.mat_name, "+
		           "            rst.mu_id, "+
		           "            rst.mu_name,  "+
		           "            rst.div_code, "+
		           "            rst.div_name, "+
		           "            rst.party_id, "+
		           "            h.op_kind_id, "+
		           "            dh.doc_num, "+
		           "            h.doc_num, "+
		           "            dh.sender_id, "+
		           "            h.sender_id, "+
		           "            h.id, "+
		           "            dh.partner_type, "+
		           "            dh.partner_id, "+
		           "            h.partner_type, "+
		           "            h.partner_id, "+
		           "            rst.party_date, "+
		           "            rst.party_desc, "+
		           "            decode(sa.wear_date, 1, rst.wear_date, null), "+
		           "            decode(sa.rest_purpose,     1, rst.rest_purpose_id,      null), "+
		           "            decode(sa.rest_purpose,     1, rst.rest_purpose_name,    null), "+
		           "            decode(sa.rest_purpose,     1, rst.rest_purpose_type_id, null), "+
		           "            decode(sa.budget_core,      1, rst.budget_core_id,       null), "+
		           "            decode(sa.budget_core,      1, rst.frc_code,             null), "+
		           "            decode(sa.budget_core,      1, rst.frc_name,             null), "+
		           "            p.calc_price"+
		           "            ,rst.bal_sch "+

		           ",rst.rest_purpose_agree_id " + // for priConnection

		           ") rest   "+
		   " ) dat where dat.selectable = 1";


		   if(aFilterObject != null)
		   {

		     if(aFilterObject.mat_id != Integer.MIN_VALUE) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.MAT_ID = ?";
		     }
		      if (aFilterObject.nn != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.nn.indexOf('*',0) < 0 && aFilterObject.nn.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.NN) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.NN) LIKE UPPER(?)";
		      }
		      if (aFilterObject.mat_name != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.mat_name.indexOf('*',0) < 0 && aFilterObject.mat_name.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.MAT_NAME) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.MAT_NAME) LIKE UPPER(?)";
		      }
		     if(aFilterObject.mu_id != Integer.MIN_VALUE) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.MU_ID = ?";
		     }
		      if (aFilterObject.mu_name != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.mu_name.indexOf('*',0) < 0 && aFilterObject.mu_name.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.MU_NAME) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.MU_NAME) LIKE UPPER(?)";
		      }
		      if (aFilterObject.div_code != null) {
		        throw new EnergyproSystemException("Код МОЛа в фильтре использовать нельзя ...");
		          /*
		        if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.div_code.indexOf('*',0) < 0 && aFilterObject.div_code.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.DIV_CODE) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.DIV_CODE) LIKE UPPER(?)";
		          */
		      }
		      if (aFilterObject.div_name != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.div_name.indexOf('*',0) < 0 && aFilterObject.div_name.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.DIV_NAME) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.DIV_NAME) LIKE UPPER(?)";
		      }
		     if(aFilterObject.party_id != Integer.MIN_VALUE) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.PARTY_ID = ?";
		     }
		      if (aFilterObject.doc_num != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.doc_num.indexOf('*',0) < 0 && aFilterObject.doc_num.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.DOC_NUM) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.DOC_NUM) LIKE UPPER(?)";
		      }

		     //if(aFilterObject.partner != Integer.MIN_VALUE) {
		     //    if(whereStr.length() != 0)
		     //       whereStr = whereStr + " AND ";
		     //    whereStr = whereStr + "  dat.PARTNER = ?";
		    // }

		     if (aFilterObject.partner != null) {
		         if(whereStr.length() != 0)
		             whereStr = whereStr + " AND ";
		         if (aFilterObject.partner.indexOf('*',0) < 0 && aFilterObject.partner.indexOf('?',0) < 0)
		             whereStr = whereStr + "  UPPER(dat.PARTNER) = UPPER(?)";
		         else
		             whereStr = whereStr + " UPPER(dat.PARTNER) LIKE UPPER(?)";
		     }

		      if (aFilterObject.partner_name != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.partner_name.indexOf('*',0) < 0 && aFilterObject.partner_name.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.PARTNER_NAME) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.PARTNER_NAME) LIKE UPPER(?)";
		      }
		     if(aFilterObject.doc_date != null) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.DOC_DATE = ?";
		     }
		      if (aFilterObject.party_discription != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.party_discription.indexOf('*',0) < 0 && aFilterObject.party_discription.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.PARTY_DESCRIPTION) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.PARTY_DESCRIPTION) LIKE UPPER(?)";
		      }
		     if(aFilterObject.rest_purpose_id != Integer.MIN_VALUE) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.REST_PURPOSE_ID = ?";
		     }
		      if (aFilterObject.rest_purpose_name != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.rest_purpose_name.indexOf('*',0) < 0 && aFilterObject.rest_purpose_name.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.REST_PURPOSE_NAME) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.REST_PURPOSE_NAME) LIKE UPPER(?)";
		      }
		     if(aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.REST_PURPOSE_TYPE_ID = ?";
		     }
		     if(aFilterObject.budget_core_id != Integer.MIN_VALUE) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.BUDGET_CORE_ID = ?";
		     }
		     if(aFilterObject.frc_code != Integer.MIN_VALUE) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.FRC_CODE = ?";
		     }
		      if (aFilterObject.frc_name != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.frc_name.indexOf('*',0) < 0 && aFilterObject.frc_name.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.FRC_NAME) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.FRC_NAME) LIKE UPPER(?)";
		      }
		     if(aFilterObject.calc_price != null) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.CALC_PRICE = ?";
		     }
		     if(aFilterObject.quantity != null) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.QUANTITY = ?";
		     }
		     if(aFilterObject.price != null) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.PRICE = ?";
		     }
		     if(aFilterObject.cost != null) {
		         if(whereStr.length() != 0)
		            whereStr = whereStr + " AND ";
		         whereStr = whereStr + "  dat.COST = ?";
		     }
		      if (aFilterObject.bal_sch != null) {
		          if(whereStr.length() != 0)
		              whereStr = whereStr + " AND ";
		          if (aFilterObject.bal_sch.indexOf('*',0) < 0 && aFilterObject.bal_sch.indexOf('?',0) < 0)
		              whereStr = whereStr + "  UPPER(dat.BAL_SCH) = UPPER(?)";
		          else
		              whereStr = whereStr + " UPPER(dat.BAL_SCH) LIKE UPPER(?)";
		      }

		      if(aFilterObject.wear_date != null) {
		          if(whereStr.length() != 0)
		             whereStr = whereStr + " AND ";
		          whereStr = whereStr + "  dat.WEAR_DATE = ?";
		      }

		   }


		   if(condition.length() != 0)
		   {
		      if(whereStr.length() != 0)
		         whereStr = whereStr + " AND ";

		      whereStr = whereStr + " (" + condition + ")";
		   }
		//+ " WHERE" +  сделано выше ????
		  if(whereStr.length() != 0)
		      selectStr = selectStr + whereStr;

		 // selectStr = selectStr + ") ";
		 if (orderBy.length() > 0 )
		    selectStr = selectStr + " ORDER BY " + orderBy;

		   String initSQL = null;
		   CallableStatement callStmt = null;
		   try
		   {
		        //ResultSet set = null;
		        try
		        {

		            initSQL = "begin umc_dba.pkg_rest.init_dates_for_calc_rest(?, 1); end;";
		            callStmt = connection.prepareCall(initSQL);
		            callStmt.setDate(1,new java.sql.Date(date.getTime()));
		            callStmt.execute();
		        }
		        catch(SQLException e)
		        {
		            System.out.println(e.getMessage()+"\nstatement - "+ initSQL);
		            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
		        }
		        finally
		        {
		            try {if (callStmt != null) callStmt.close();}             catch (SQLException e) {}
		            //try {if (statement != null) statement.close();} catch (SQLException e) {}
		            //statement = null;
		        }


		        set = null;

		        statement = connection.prepareStatement(selectStr);
		        statement.setInt(1, finDocCode);
		        statement.setString(2,molCode);
		        statement.setInt(3, finDocCode);


		        int number = 3;
		        if(aFilterObject != null){

		            if(aFilterObject.mat_id != Integer.MIN_VALUE){
		                number++;
		                statement.setInt(number,aFilterObject.mat_id);
		            }

		            if(aFilterObject.nn != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.nn);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }

		            if(aFilterObject.mat_name != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.mat_name);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }
		            if(aFilterObject.mu_id != Integer.MIN_VALUE){
		                number++;
		                statement.setInt(number,aFilterObject.mu_id);
		            }

		            if(aFilterObject.mu_name != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.mu_name);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }

		            if(aFilterObject.div_code != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.div_code);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }

		            if(aFilterObject.div_name != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.div_name);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }
		            if(aFilterObject.party_id != Integer.MIN_VALUE){
		                number++;
		                statement.setInt(number,aFilterObject.party_id);
		            }

		            if(aFilterObject.doc_num != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.doc_num);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }
		            if(aFilterObject.partner != null){
		                number++;
		                statement.setString(number,aFilterObject.partner);
		            }

		            if(aFilterObject.partner_name != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.partner_name);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }
		            if(aFilterObject.doc_date != null){
		                number++;
		                statement.setDate(number,new java.sql.Date(aFilterObject.doc_date.getTime()));
		            }

		            if(aFilterObject.party_discription != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.party_discription);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }
		            if(aFilterObject.rest_purpose_id != Integer.MIN_VALUE){
		                number++;
		                statement.setInt(number,aFilterObject.rest_purpose_id);
		            }

		            if(aFilterObject.rest_purpose_name != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.rest_purpose_name);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }
		            if(aFilterObject.rest_purpose_type_id != Integer.MIN_VALUE){
		                number++;
		                statement.setInt(number,aFilterObject.rest_purpose_type_id);
		            }
		            if(aFilterObject.budget_core_id != Integer.MIN_VALUE){
		                number++;
		                statement.setInt(number,aFilterObject.budget_core_id);
		            }
		            if(aFilterObject.frc_code != Integer.MIN_VALUE){
		                number++;
		                statement.setInt(number,aFilterObject.frc_code);
		            }

		            if(aFilterObject.frc_name != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.frc_name);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }
		            if(aFilterObject.calc_price != null){
		                number++;
		                aFilterObject.calc_price = aFilterObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
		                statement.setBigDecimal(number,aFilterObject.calc_price);
		            }
		            if(aFilterObject.quantity != null){
		                number++;
		                aFilterObject.quantity = aFilterObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
		                statement.setBigDecimal(number,aFilterObject.quantity);
		            }
		            if(aFilterObject.price != null){
		                number++;
		                aFilterObject.price = aFilterObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
		                statement.setBigDecimal(number,aFilterObject.price);
		            }
		            if(aFilterObject.cost != null){
		                number++;
		                aFilterObject.cost = aFilterObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
		                statement.setBigDecimal(number,aFilterObject.cost);
		            }

		            if(aFilterObject.bal_sch != null){
		                number++;
		                StringBuffer likeStr = new StringBuffer();
		                likeStr.append(aFilterObject.bal_sch);
		                for(int i = 0;i < likeStr.length();i++){
		                        if(likeStr.charAt(i) == '*')
		                            likeStr.setCharAt(i,'%');
		                        if(likeStr.charAt(i) == '?')
		                            likeStr.setCharAt(i,'_');
		                }
		                statement.setString(number,likeStr.toString());
		            }

		                if(aFilterObject.wear_date != null){
		                    number++;
		                    statement.setDate(number,new java.sql.Date(aFilterObject.wear_date.getTime()));
		                }

		        }

		        set = statement.executeQuery();
		        int i = 0;
		        for(i = 0;set.next();i++)
		        {
		            //if(i < fromPosition)
		            // continue;
		            //else if(i >= fromPosition + quantity)
		            // {
		            //  i++;
		            //  break;
		            // }
		            anObject = new FINMaterials();
		            anObject.mat_id = set.getInt(1);
		            anObject.nn = set.getString(2);
		            anObject.mat_name = set.getString(3);
		            anObject.mu_id = set.getInt(4);
		            anObject.mu_name = set.getString(5);
		            anObject.div_code = set.getString(6);
		            anObject.div_name = set.getString(7);
		            anObject.party_id = set.getInt(8);
		            anObject.doc_num = set.getString(9);
		            anObject.partner = set.getString(10);
		            anObject.partner_name = set.getString(11);
		            anObject.doc_date = set.getDate(12);
		            anObject.party_discription = set.getString(13);
		            anObject.rest_purpose_id = set.getInt(14);
		            anObject.rest_purpose_name = set.getString(15);
		            anObject.rest_purpose_type_id = set.getInt(16);
		            anObject.budget_core_id = set.getInt(17);
		            anObject.frc_code = set.getInt(18);
		            anObject.frc_name = set.getString(19);


		            anObject.calc_price = set.getBigDecimal(20);
		            if(anObject.calc_price != null)
		                anObject.calc_price = anObject.calc_price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

		            anObject.quantity = set.getBigDecimal(21);
		            if(anObject.quantity != null)
		                anObject.quantity = anObject.quantity.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);

		            anObject.price = set.getBigDecimal(22);
		            if(anObject.price != null)
		                anObject.price = anObject.price.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

		            anObject.cost = set.getBigDecimal(23);
		            if(anObject.cost != null)
		                anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);

		            anObject.bal_sch = set.getString(24);

		            // там еще 2 поля ... которые НЕ СЕТЯТСЯ !!!
		            anObject.wear_date = set.getDate(27);

				result.list.add(anObject);
			}

			result.setTotalCount(i);

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
		}

		return result;
	}

}
