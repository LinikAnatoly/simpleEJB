package com.ksoe.energynet.logic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.ws.BindingProvider;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.FKTrans2AXTransDAO;
import com.ksoe.energynet.dataminer.FKTrans2AXTransItemDAO;
import com.ksoe.energynet.valueobject.FINMaterials;
import com.ksoe.energynet.valueobject.FKTrans2AXTransItem;
import com.ksoe.energynet.valueobject.filter.FINMaterialsFilter;
import com.ksoe.energynet.valueobject.filter.FKTrans2AXTransItemFilter;
import com.ksoe.energynet.valueobject.lists.FINMaterialsList;
import com.ksoe.energynet.valueobject.lists.FKTrans2AXTransItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.energypro.util.EnergyproPersistenceExceptionAnalyzer;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.mdax.logic.AXPostingLogic;
import com.ksoe.mdax.logic.AXTransactionsLogic;
import com.ksoe.mdax.services.ledgertransks.LedgerTransksActions;
import com.ksoe.mdax.services.packtrans.PackTrans;
import com.ksoe.rqorder.logic.FKOrderLogic;
import com.microsoft.schemas.dynamics._2008._01.services.PackLedgerTransKSService;
import com.microsoft.schemas.dynamics._2008._01.services.PackLedgerTransKSServiceClearStagingTableAifFaultFaultFaultMessage;
import com.microsoft.schemas.dynamics._2008._01.services.PackLedgerTransKSServiceCreateAifFaultFaultFaultMessage;
import com.microsoft.schemas.dynamics._2008._01.services.PackLedgerTransKSServiceStartCreatingPackAifFaultFaultFaultMessage;
import com.microsoft.schemas.dynamics._2008._01.services.PackLedgerTransKSService_Service;


public class FKTrans2AXTransLogic  extends LogicModule {

    /**
	 *
	 */

	private java.sql.Connection mDaxConnection = null;

	private static final long serialVersionUID = 1L;

	private java.sql.Connection energyNetConnection = null;

	protected java.sql.Connection getMDAXConnection()
			throws DatasourceConnectException {
		try {
			if (mDaxConnection != null && !mDaxConnection.isClosed()) {
				return mDaxConnection;
			}

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource) initialContext.lookup(AuthorizationJNDINames.MDAX_DATASOURCE);
			mDaxConnection = dataSource.getConnection();
			return mDaxConnection;

		} catch (NamingException e) {
			throw new SystemException("Нет связи с Microsoft Dynamics...", e);
		} catch (SQLException e) {
			throw new SystemException("Нет связи с Microsoft Dynamics...", e);
		}
	}

    public FKTrans2AXTransLogic(Connection connection, UserProfile userProfile)
    {
        super(connection, userProfile);
    }

    protected java.sql.Connection getConnection_(String dataSourceName) throws DatasourceConnectException
    {
    try {
    if (energyNetConnection != null && ! energyNetConnection.isClosed()) {
        return energyNetConnection;
    }

    InitialContext initialContext = new InitialContext();
    DataSource dataSource = (DataSource) initialContext
            .lookup(dataSourceName);
    energyNetConnection = dataSource.getConnection();
    return energyNetConnection;
    } catch (NamingException e) {
    throw new DatasourceConnectException(dataSourceName, e);
    } catch (SQLException e) {
    throw new DatasourceConnectException(dataSourceName, e);
    }
    }




    private int getDOC_ID_from_doc_reg_mirror__(int headID) throws PersistenceException
    {
        PreparedStatement statement = null;
        ResultSet  set = null;
        String SQL = "select doc_id from umc_dba.doc_reg_mirror where head_id = ?";
        int docs_reestr_Code = Integer.MIN_VALUE;
        try
        {
            statement = connection.prepareStatement(SQL);
            statement.setInt(1,headID);
            set = statement.executeQuery();
            if ( ! set.next() ){
                // если нету - 28 операция ... дока НЕту
                //throw new EnergyproSystemException("Not found umc_dba.doc_reg_mirror. head_id =" + headID );
            }
                else
                {
                    docs_reestr_Code = set.getInt(1);
                }
            //saveToLog("getDOC_ID_from_doc_reg_mirror", SQL + ":" + headID);
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage()+"\nstatement - " + SQL);
            EnergyproPersistenceExceptionAnalyzer.analyser.throwPersistenceException(e);
        }
        finally
        {
        try {if (set != null) set.close();}             catch (SQLException e) {}
        try {if (statement != null) statement.close();} catch (SQLException e) {}
        statement = null;
        }

        return docs_reestr_Code;

    }




/**
 * Поиск остатка в ФК по данным из АХ и дополнение объекта  FINMaterials значениями из ФК
 *
 * */
 public FINMaterials fillFinmaterialsFromFKByMdaxData(FINMaterials finmatObj , Date date ,  int finDocCode ) {
	 FINMaterials result = null;
	 String finCondition = "";
	 Connection finConn = null;
	 Connection enConn = null;
	 try {
	    finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	    enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
	    FKOrderLogic fordLogic = new FKOrderLogic(userProfile,enConn);

	    FinMaterialsLogic finMaterialsLogic = new FinMaterialsLogic(finConn, userProfile);

	    if(finmatObj.nn == null || finmatObj.nn.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано код номенклатури! ");
	    }
	    if(finmatObj.ax_frc_code == null || finmatObj.ax_frc_code.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано код ЦФО! ");
	    }
	    if(finmatObj.bal_sch == null || finmatObj.bal_sch.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано рахунок! ");
	    }
	    if(finmatObj.ax_rest_purpose_typeid == null || finmatObj.ax_rest_purpose_typeid.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано тип залишку! ");
	    }
	    if(finmatObj.ax_party_id == null || finmatObj.ax_party_id.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано партію! ");
	    }
	    if(finmatObj.fullQuantity == null  ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано кількість залишку ! ");
	    }
	    if(finmatObj.div_code == null || finmatObj.div_code.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано МОЛ ! ");
	    }
	    if(finmatObj.ax_rest_purpose_id == null || finmatObj.ax_rest_purpose_id.equals("") ) {
	    	throw new SystemException("\n\nДля пошуку залишку з ФК не вказано призначения залишку з AX ! ");
	    }

		FINMaterialsFilter finFilterFK = new FINMaterialsFilter();

		finCondition = finCondition + " and isCN is null and ( dat.bal_sch in ('"+ finmatObj.bal_sch +"') ) ";
		finCondition = finCondition + " and dat.rest_purpose_type_id = " + Integer.parseInt(finmatObj.ax_rest_purpose_typeid.replace("30100", "")  ) ;
		finCondition = finCondition + " and dat.party_id in (" + Integer.parseInt(finmatObj.ax_party_id)  + ")";
		//finCondition = finCondition + " and dat.quantity = "+ finmatObj.fullQuantity  ; // то кол-во что взяли с АХ должно быть на остатке в ФК

		finFilterFK.nn = finmatObj.nn;
		finFilterFK.frc_code = Integer.parseInt(finmatObj.ax_frc_code); // dat.FRC_CODE // cfo
	    finFilterFK.quantity = finmatObj.fullQuantity; // то кол-во что взяли с АХ должно быть на остатке в ФК

		//<<<
		finFilterFK.rest_purpose_id = fordLogic.getRestPurposeIdFKForZoneByTypeIdMdax(  finmatObj.div_code ,
																						finmatObj.ax_rest_purpose_id,
																						finmatObj.ax_rest_purpose_typeid) ;
		//>>>

		// дата ввода в эксп если не пуцстая то тоже фильровать
		finFilterFK.conditionSQL = finCondition;
		finFilterFK.orderBySQL = "dat.quantity , dat.party_id";

		String MOLCode = finmatObj.div_code;
		String materialCondition = "  and h.op_kind_id not in ('5','10','310','15')"; // ДО проведения ПРИХОДА на МОЛ - уже видно мат-лы в подотчете .. НАХ их ...



		FINMaterialsList finListFK = finMaterialsLogic.getMaterialsList(finFilterFK,
			 ""/*balansNumberCondition*/,
			 MOLCode,
			 materialCondition,
			 date ,
			 finDocCode ,
			 ENConsts.SOURCE_SELECTION_RESTS_FK // ищем в ФК
			 );

		if (finListFK.totalCount == 0 ) {
			throw new SystemException("\n\nНе знайдено залишку з ФК! ");
		 } else // недостающие поля
		 {
			 finmatObj.mat_id = finListFK.get(0).mat_id;
			 finmatObj.party_id = finListFK.get(0).party_id;
			 finmatObj.budget_core_id = finListFK.get(0).budget_core_id;
			 finmatObj.mu_id = finListFK.get(0).mu_id;
			 finmatObj.mu_name = finListFK.get(0).mu_name;
			 finmatObj.rest_purpose_id = finListFK.get(0).rest_purpose_id;
			 finmatObj.rest_purpose_name = finListFK.get(0).rest_purpose_name;
			 finmatObj.rest_purpose_type_id = finListFK.get(0).rest_purpose_type_id;
			 finmatObj.party_discription = finListFK.get(0).party_discription;
			 finmatObj.frc_code = finListFK.get(0).frc_code;
			 finmatObj.partner = finListFK.get(0).partner;
			 finmatObj.partner_name = finListFK.get(0).partner_name;

		 }

		return finmatObj;
	 } catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Нет связи с ФинКолекцией ... прозводиться перевод месяца или еще что-то ...", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {

			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}

		}
	}

 public void addFKTrans2EN(int month , int year , String task_owner , int FKTrans2AXTransObjCode) {
	 Connection finConn = null;
	 Connection enConn = null;
	 PreparedStatement statement = null;
	 ResultSet  resultset = null;
		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			enConn = getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			FKTrans2AXTransItemDAO fkt2axtDAO = new FKTrans2AXTransItemDAO(enConn, userProfile);

			String mm = (month+"").length() == 1 ? "0"+month : month+"";

			String SQL = "  select  dt_prov, bal_ceh, bal_sch||bal_sub_sch as bal_sch , bal_kau  \n" +
			"                 , kor_ceh, kor_sch||kor_sub_sch as kor_sch , kor_kau    \n" +
			"          , sum(kredit_sum) as kredit_sum ,  part_id , is_prihod  \n" +
			"  from ( \n" +
			"  select  dt_prov, bal_ceh, bal_sch , bal_sub_sch , bal_kau  \n" +
			"         , kor_ceh, kor_sch , kor_sub_sch , kor_kau    \n" +
			"         , primechan , kredit_sum , case when is_prihod > 0 then part_id else null end as part_id  \n" +
			"         , is_prihod  \n" +
			"  from ( \n" +
			"      select  pp.dt_prov, pp.bal_ceh, pp.bal_sch , pp.bal_sub_sch , pp.bal_kau  \n" +
			"            , pp.kor_ceh, pp.kor_sch , pp.kor_sub_sch , pp.kor_kau    \n" +
			"            , pp.primechan , pp.kredit_sum , pp.part_id  \n" +
			"              , case when ( \n" +
			"         (pp.primechan  like ('%в/о 25 %'))  or (pp.primechan  like ('%в/о 26 %'))  or (pp.primechan  like ('%в/о 27 %'))  or (pp.primechan  like ('%в/о 16 %'))  or  \n" +
			" (pp.primechan  like ('%в/о 17 %')) \n" +
			"          or (pp.primechan  like ('%в/о 19 %'))   or (pp.primechan  like ('%в/о 21 %')) \n" +
			"          or (pp.primechan  like ('%UMC-П 25\"%'))  or (pp.primechan  like ('%UMC-П 26\"%')) or (pp.primechan  like ('%UMC-П 27\"%')) or (pp.primechan  like ('%UMC-П  \n" +
			" 16\"%')) or (pp.primechan  like ('%UMC-П 17\"%')) \n" +
			"          or (pp.primechan  like ('%UMC-П 19\"%'))  or (pp.primechan  like ('%UMC-П 21\"%')) \n" +
			"          or (pp.primechan  like ('%UMC-П 25 %'))  or (pp.primechan  like ('%UMC-П 26 %')) or (pp.primechan  like ('%UMC-П 27 %')) or (pp.primechan  like ('%UMC-П  \n" +
			" 16 %')) or (pp.primechan  like ('%UMC-П 17 %')) \n" +
			"             or (pp.primechan  like ('%UMC-П 19 %'))  or (pp.primechan  like ('%UMC-П 21 %')) \n" +
			"     )  then 1 else 0 end as is_prihod    \n" +
			"      \n" +
			"  from  finansy.provodki pp where pp.task_owner = '"+task_owner+"' and to_char(dt_prov,'mm.yyyy') = '"+mm+"."+year+"'  \n" +
			"  and pp.type_prov = 'K' \n" +
			"  and pp.is_prov= 'Y' \n" +
			"  --and pp.bal_sch = '63' \n" +
			"  --and pp.kor_sch <> '64' \n" +
			"  )  \n" +
			"  ) \n" +
			" group by dt_prov, bal_ceh, bal_sch , bal_sub_sch , bal_kau , kor_ceh, kor_sch , kor_sub_sch , kor_kau   , part_id , is_prihod  \n" +
			" order by dt_prov, part_id, is_prihod " ;

			statement = finConn.prepareStatement(SQL);
			resultset = statement.executeQuery();

//			while (resultset.next()) {
//				out = resultset.getBigDecimal(1);
//			}



			int i = 0;
			for (i = 0; resultset.next(); i++) {
				FKTrans2AXTransItem anObject;
				anObject = new FKTrans2AXTransItem();
				anObject.code = Integer.MIN_VALUE;
				anObject.transDate = resultset.getDate("dt_prov");
				anObject.balCeh = resultset.getString("bal_ceh");
				anObject.balSch = resultset.getString("bal_sch");
				anObject.balKau = resultset.getString("bal_kau");
				anObject.korCeh = resultset.getString("kor_ceh");
				anObject.korSch = resultset.getString("kor_sch");
				anObject.korKau = resultset.getString("kor_kau");
				anObject.amountCur = resultset.getBigDecimal("kredit_sum");
				if (anObject.amountCur != null)
					anObject.amountCur = anObject.amountCur.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				anObject.partId = resultset.getInt("part_id");
				anObject.isPrihod = resultset.getInt("is_prihod");
				anObject.status = FKTrans2AXTransItem.STATUS_NEW;
				anObject.FKTrans2AXTrans.code = FKTrans2AXTransObjCode;
				anObject.ledgerTxt = " energynet fktrans2axtrans";

				fkt2axtDAO.add(anObject);
				System.out.println("addFKTrans2EN add item   dt_prov = " + anObject.transDate + " row  = " + i );

        	}





		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (SQLException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
			}
		finally {
			try {
				if(finConn != null && !finConn.isClosed()) {
					finConn.close();
				}
				if(enConn != null && !enConn.isClosed()) {
					enConn.close();
				}
			} catch (SQLException e) {
			}
		}
 }


 public void makeDimensionAX(Integer FKTrans2AXTransObjCode , String transDate) {
	 Connection finConn = null;
	 Connection enConn = null;
	 PreparedStatement statement = null;
	 ResultSet  resultset = null;
		try {
			// finConn = getFinMaterialsConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			enConn = getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			AXPostingLogic axpLogic = new AXPostingLogic(enConn, userProfile);

			FKTrans2AXTransItemDAO fkt2axtDAO = new FKTrans2AXTransItemDAO(enConn, userProfile);

			FKTrans2AXTransItemFilter transIteFilter = new FKTrans2AXTransItemFilter();

			transIteFilter.FKTrans2AXTrans.code = FKTrans2AXTransObjCode;
			if (!transDate.equals("")) {
				transIteFilter.conditionSQL = "  FKTRANS2AXTRANSITEM.TRANSDATE = '" +transDate+ "'" ;
			}


			    Set<KAUTemplates> kauSet = getKautemplates();

                Iterator<KAUTemplates> kauTemplatesIterator = kauSet.iterator();
			    while(kauTemplatesIterator.hasNext()){
			    	//EstimateItem2PartyData key = (EstimateItem2PartyData)em.nextElement();
			    	KAUTemplates zzz = kauTemplatesIterator.next();

                    System.out.println(" "+ zzz.ledgerAccount + " ----- " + zzz.convertTemplate );
			    }

			    Set<DimensionsEqual> dimensionsEqualSet = getDimensionsEqual();

			    Iterator<DimensionsEqual> DimensionsIterator = dimensionsEqualSet.iterator();
			    while(DimensionsIterator.hasNext()){

			     DimensionsEqual ddd = DimensionsIterator.next();

                 System.out.println(" "+ ddd.accounts + " ----- " + ddd.dimensionNum + " ----- " + ddd.kau  );
			    }

			    // выберем дистинктом разные проводки FK (счет , кау )
			    // дальше для счета находим шаблон в KAUTEMPLATES
			    // 0 - не обрабатывается . обрабатываем буквы
			    // например z в ФК КАУ - тогда смотрим(по XLS табличке ) что значение для дименшена нужно выбирать из таблицы DimensionsEqual поле DIMENSIONNUM
			     //  для поиска этого значения нужно знать какую длину вырезать из КАУ ФК - эту длину определим по табличке  DimensionsEqual по полю KAU
			     // ( фильтр будет такой  ACCOUNTS = счет ФК AND DIMENSIONNUM like '1%'( так как по табличке видно что букве z соответствует все  ветки котоыре начинаются на число 1   )  )
			    FKTrans2AXTransItemShortList sch_kauList = fkt2axtDAO.getAccountAndKAUDistinctFKTrans(FKTrans2AXTransObjCode , transDate);

			    for (int i = 0; i<sch_kauList.totalCount; i++) {
			      String fk_sch = sch_kauList.get(i).balSch; // счет фк для которого будем определять аксапотовые аналитики
			      String fk_kau = sch_kauList.get(i).balKau; // кау фк по которому будем определять аксапотовые аналитики
			      String axKauTemplate = "";
			        // по счету определим KAUTEMPLATES для определения аналитик
				    Iterator<KAUTemplates> kauTemplatesIterat = kauSet.iterator();

				    while(kauTemplatesIterat.hasNext()){
				    	KAUTemplates kauTemplate = kauTemplatesIterat.next();
	                    if (kauTemplate.ledgerAccount.equals(fk_sch)) {
	                    	axKauTemplate = kauTemplate.convertTemplate;
	                    	break;
	                    }
				    }

				    if(axKauTemplate.equals("")) {
				    	throw new EnergyproSystemException(" Шаблон КАУ для рахунка  " + fk_sch + " не знайдено !!!"  );
				    }
				    String dim2 = "";
				    String dim3 = "";
				    String dim4 = "";
				    String dim5 = "";
				    String dim9 = "";
				    String dim10 = "";
				    String dim12 = "";
				    String dim13 = "";

				    int j_kau = 0; // сколько символов уже обработали из кау ФК

				    // обработка шаблона КАУ
				    for(int j=0; j<axKauTemplate.length(); j++ ) {
				    	//      0     //
				    	 if(axKauTemplate.startsWith("0", j)) {
				    		j_kau = j_kau+1;
				    		continue; // пропускаем ноли
				    	 }
				    	 //     z     //
				    	 if(axKauTemplate.startsWith("z", j)) { // Аналитика Центра Затрат , передавать в поле Dimension[2]

				    		 Iterator<DimensionsEqual> DimIterat = dimensionsEqualSet.iterator();
							    while(DimIterat.hasNext()){
							     DimensionsEqual dim = DimIterat.next();
							     if(dim.dimensionNum.startsWith("1")) {
							    	if(dim.accounts.contains(fk_sch)) {
							    		String substrFkKAU = fk_kau.substring(j_kau, j_kau + dim.kau.length()); // значение с кау фк для поиска в таблице соответствия
									     if( dim.kau.equals(substrFkKAU)  ) {
									    	 dim2 = dim.dimensionNum;
									    	 j_kau = j_kau+substrFkKAU.length();
									    	 break;
									      }
							    	}
							     }

							    }
							    if(dim2.equals("")) {
							    	throw new EnergyproSystemException(" не знайдено dimensionNum для рахунка  " + fk_sch + " , визначенния знаку \"z\" по КАУ з ФК = " + fk_kau  );
							    }

					     }
                         //	     c     //
				    	 if(axKauTemplate.startsWith("c", j)) { // Аналитика Цели , передавать в Dimension[3]

				    		 Iterator<DimensionsEqual> DimIterat = dimensionsEqualSet.iterator();
							    while(DimIterat.hasNext()){
							     DimensionsEqual dim = DimIterat.next();
							     if (dim.dimensionNum.startsWith("2")) {
							    	if (dim.accounts.contains(fk_sch)) {
							    		String substrFkKAU = fk_kau.substring(j_kau, j_kau + dim.kau.length()); // значение с кау фк для поиска в таблице соответствия
							    		if(dim.kau.equals(substrFkKAU)  ) {
									    	 dim3 = dim.dimensionNum;
									    	 j_kau = j_kau+substrFkKAU.length();
									    	 break;
									      }
							    	}
							     }

							    }
							    if(dim3.equals("")) {
							    	throw new EnergyproSystemException(" не знайдено dimensionNum для рахунка  " + fk_sch + " , визначенния знаку \"c\" по КАУ з ФК = " + fk_kau  );
							    }

					     }
                         //	     n     //
				    	 if(axKauTemplate.startsWith("n", j)) { // Аналитика Назначение , передавать в Dimension[9]

				    		 Iterator<DimensionsEqual> DimIterat = dimensionsEqualSet.iterator();
							    while(DimIterat.hasNext()){
							     DimensionsEqual dim = DimIterat.next();
							     if (dim.dimensionNum.startsWith("3") ) {
							    	 if(dim.accounts.contains(fk_sch) ) {
							    		 String substrFkKAU = fk_kau.substring(j_kau, j_kau + dim.kau.length()); // значение с кау фк для поиска в таблице соответствия
								    	 if( dim.kau.equals(substrFkKAU)  ) {
									    	 dim9 = dim.dimensionNum;
									    	 j_kau = j_kau+substrFkKAU.length();
									    	 break;
									      }
							    	   }
							       }
							    }
							    if(dim9.equals("")) {
							    	throw new EnergyproSystemException(" не знайдено dimensionNum для рахунка  " + fk_sch + " , визначенния знаку \"n\" по КАУ з ФК = " + fk_kau  );
							    }

					     }
                         //	   o     //
				    	 if(axKauTemplate.startsWith("o", j)) { // Аналитика Основания , передавать в Dimension[10]

				    		 Iterator<DimensionsEqual> DimIterat = dimensionsEqualSet.iterator();
							    while(DimIterat.hasNext()){
							     DimensionsEqual dim = DimIterat.next();
							     if (dim.dimensionNum.startsWith("4")) {
							    	if(dim.accounts.contains(fk_sch)) {
							    		String substrFkKAU = fk_kau.substring(j_kau, j_kau + dim.kau.length()); // значение с кау фк для поиска в таблице соответствия
									     if(dim.kau.equals(substrFkKAU)  ) {
									    	 dim10 = dim.dimensionNum;
									    	 j_kau = j_kau+substrFkKAU.length();
									    	 break;
									      }
							    	}
							     }

							    }
							    if(dim10.equals("")) {
							    	throw new EnergyproSystemException(" не знайдено dimensionNum для рахунка  " + fk_sch + " , визначенния знаку \"o\" по КАУ з ФК = " + fk_kau  );
							    }

					     }
				    	 //     s     //
				    	 if(axKauTemplate.startsWith("s", j)) { // Аналитика Счет. В случае S - контрагент (CustTable/VendTable).Vend/CustExtCode_UA/EmplId В КАУ Всегда занимает 7-10 символы.
				    		                                    // передавать в Dimension[4]
					    	 if(sch_kauList.get(i).isPrihod == 1) { // приход значит счет из vendtable
					    		 dim4 = axpLogic.getDimension4FromVendTableByVendExtCode_UA(fk_kau.substring(2, 6));
						    		j_kau = j_kau+fk_kau.substring(2, 6).length();
									    if(dim4.equals("")) {
									    	throw new EnergyproSystemException(" не знайдено Dimension4 , фильтр по VendExtCode_UA  ="+ fk_kau.substring(2, 6) +" для рахунка  " + fk_sch + " , визначенния знаку \"s\" по КАУ з ФК = " + fk_kau  );
									    }
					    	 }	else {
					    		 dim4 = axpLogic.getDimension4FromCustTableByCustExtCode_UA(fk_kau.substring(2, 6));
						    		j_kau = j_kau+fk_kau.substring(2, 6).length();
									    if(dim4.equals("")) {
									    	throw new EnergyproSystemException(" не знайдено Dimension4 , фильтр по CustExtCode_UA  ="+ fk_kau.substring(2, 6) +" для рахунка  " + fk_sch + " , визначенния знаку \"s\" по КАУ з ФК = " + fk_kau  );
									    }
					    	 }
					     }

				    	 //	  d     //
				    	 if(axKauTemplate.startsWith("d", j)) { // АналитикаДоговор. Всегда находится в КАУ в позиции 11-15 символ. RContractTable (ExtCode_UA)
				    		                                    // передавать в Dimension[5]

				    		String fil_contract = fk_kau.substring(6, 11);
				    		if ( sch_kauList.get(i).isPrihod == 1 && fk_kau.substring(6, 11).equals("00000") ) { // поставщики
				    			fil_contract = "00933";
				    		}
                              if ( sch_kauList.get(i).isPrihod != 1 && fk_kau.substring(6, 11).equals("00000") ) { // не поставщики
                            	fil_contract = "54941";
				    		}

				    		 dim5 = axpLogic.getDimension5FromRContractTableByExtCode_UA(fil_contract);
				    		 j_kau = j_kau+fil_contract.length();
							    if(dim5.equals("")) {
							    	throw new EnergyproSystemException(" не знайдено Dimension5 , фильтр по ExtCode_UA ="+ fk_kau.substring(6, 11) +" для рахунка  " + fk_sch +
                                                                       " , визначенния знаку \"d\" по КАУ з ФК = " + fk_kau  );
							    }

					     }

				    	 //	   m    //
				    	 if(axKauTemplate.startsWith("m", j)) { // Аналитика Основное средство. КАУ = Аналитике. (последние 5) КАУ 11-15 символы  RASSETTABLE
				    		                                    // передавать в Dimension[12]

				    	   if (axKauTemplate.contains("p") || axKauTemplate.contains("d") ) { // если  в шаблоне есть или "p" или "d",  то "m" берем c 2 знака КАУ
				    		   dim12 = axpLogic.getAccountNumFromRASSETTABLEByAccountNum(fk_kau.substring(1, 6));
					    		 j_kau = j_kau+fk_kau.substring(1, 6 ).length();
								    if(dim12.equals("")) {
								    	throw new EnergyproSystemException(" не знайдено AccountNum , фильтр по AccountNum ="+ fk_kau.substring(1, 6) +" для рахунка  " + fk_sch +
	                                                                       " , визначення знаку \"m\" по КАУ з ФК = " + fk_kau  );
								    }
				    	   } else
				    	   {
				    		   dim12 = axpLogic.getAccountNumFromRASSETTABLEByAccountNum(fk_kau.substring(6, 11));
					    		 j_kau = j_kau+fk_kau.substring(6, 11).length();
								    if(dim12.equals("")) {
								    	throw new EnergyproSystemException(" не знайдено AccountNum , фильтр по AccountNum ="+ fk_kau.substring(6, 11) +" для рахунка  " + fk_sch +
	                                                                       " , визначення знаку \"m\" по КАУ з ФК = " + fk_kau  );
								    }
				    	   }


					     }

				    	 //	   k    //
				    	 if(axKauTemplate.startsWith("k", j)) { // Аналитика Основное средство. кап строй  КАУ = Аналитике. (последние 5) КАУ 11-15 символы  RASSETTABLE
				    		                                    // передавать в Dimension[12]

				    		 dim12 = axpLogic.getAccountNumFromRASSETTABLEByPassportNum(fk_kau.substring(1, 3) );
				    		 j_kau = j_kau+fk_kau.substring(1, 3).length();
							    if(dim12.equals("")) {
							    	throw new EnergyproSystemException(" не знайдено AccountNum , фильтр по PassportNum ="+ fk_kau.substring(1, 3) +" для рахунка  " + fk_sch +
                                                                       " , визначенния знаку \"k\" по КАУ з ФК = " + fk_kau  );
							    }

					     }

				    	 	//	 p     //
				    	 if(axKauTemplate.startsWith("p", j)) { // Аналитика Договора на присоединение. Занимает 11-15 символ в КАУ. RContractTable.Dimension[13]
				    		                                    // передавать в Dimension[13]

				    		 dim13 = axpLogic.getDimension13FromRContractTableByExtCode_UA(fk_kau.substring(6, 11));
				    		 j_kau = j_kau+fk_kau.substring(6, 11).length();
							    if(dim13.equals("")) {
							    	throw new EnergyproSystemException(" не знайдено Dimension13 , фильтр по ExtCode_UA ="+ fk_kau.substring(6, 11) +" для рахунка  " + fk_sch +
                                                                       " , визначенния знаку \"p\"(Аналитика Договора на присоединение  Dimension13 ) по КАУ з ФК = " + fk_kau  );
							    }

					     }

				    } //\\ обработка шаблона КАУ

			     // шаблон обработали . апдейт данных в energynet значений аналитик для аксапты
				    FKTrans2AXTransItemFilter ft2axtFilUpd = new FKTrans2AXTransItemFilter();
				    ft2axtFilUpd.FKTrans2AXTrans.code = FKTrans2AXTransObjCode;
				    ft2axtFilUpd.isPrihod = sch_kauList.get(i).isPrihod;
				    ft2axtFilUpd.conditionSQL = " ((fktrans2axtransitem.balsch = '"+ fk_sch +"' and fktrans2axtransitem.balkau = '"+ fk_kau +"' ) " +
											    " or " +
											    "  (fktrans2axtransitem.korsch = '"+ fk_sch +"' and fktrans2axtransitem.korkau = '"+ fk_kau +"' )) ";

				    if (!transDate.equals("")) {
				    	ft2axtFilUpd.conditionSQL = ft2axtFilUpd.conditionSQL + " and  FKTRANS2AXTRANSITEM.TRANSDATE = '" +transDate+ "'" ;
					}

				    int[] ft2axtArrUpd = fkt2axtDAO.getFilteredCodeArray(ft2axtFilUpd, 0, -1);
				    for (int u = 0; u < ft2axtArrUpd.length; u++) {
				    	FKTrans2AXTransItem ft2axtObjUpd = fkt2axtDAO.getObject(ft2axtArrUpd[u]);

				    	if (ft2axtObjUpd.balSch.equals(fk_sch) && ft2axtObjUpd.balKau.equals(fk_kau) ) {
				    		ft2axtObjUpd.accountDimension1 = ft2axtObjUpd.balCeh;
				    		ft2axtObjUpd.accountDimension2 = dim2;
				    		ft2axtObjUpd.accountDimension3 = dim3;
				    		ft2axtObjUpd.accountDimension4 = dim4;
				    		ft2axtObjUpd.accountDimension5 = dim5;
				    		ft2axtObjUpd.accountDimension9 = dim9;
				    		ft2axtObjUpd.accountDimension10 = dim10;
				    		ft2axtObjUpd.accountDimension12 = dim12;
				    		ft2axtObjUpd.accountDimension13 = dim13;

				    	}

				    	if (ft2axtObjUpd.korSch.equals(fk_sch) && ft2axtObjUpd.korKau.equals(fk_kau) ) {
				    		ft2axtObjUpd.corAccountDimension1 = ft2axtObjUpd.korCeh;
				    		ft2axtObjUpd.corAccountDimension2 = dim2;
				    		ft2axtObjUpd.corAccountDimension3 = dim3;
				    		ft2axtObjUpd.corAccountDimension4 = dim4;
				    		ft2axtObjUpd.corAccountDimension5 = dim5;
				    		ft2axtObjUpd.corAccountDimension9 = dim9;
				    		ft2axtObjUpd.corAccountDimension10 = dim10;
				    		ft2axtObjUpd.corAccountDimension12 = dim12;
				    		ft2axtObjUpd.corAccountDimension13 = dim13;

				    	}

				    	ft2axtObjUpd.status =   FKTrans2AXTransItem.STATUS_PREPARED;
				    	fkt2axtDAO.save(ft2axtObjUpd);
					}
			    }





		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
			}
		finally {
			try {
				if(finConn != null && !finConn.isClosed()) {
					finConn.close();
				}
				if(enConn != null && !enConn.isClosed()) {
					enConn.close();
				}
			} catch (SQLException e) {
			}
		}
 }


 public void moveTrans2AX(Integer FKTrans2AXTransObjCode , String transDate) {
	 Connection finConn = null;
	 Connection enConn = null;
	 PreparedStatement statement = null;
	 ResultSet  resultset = null;
	 String retVoucher = "";
	 LedgerTransksActions ltAct = new LedgerTransksActions(enConn, userProfile);
		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			enConn = getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			//AXPostingLogic axpLogic = new AXPostingLogic(finConn, userProfile);

			FKTrans2AXTransItemDAO fkt2axtDAO = new FKTrans2AXTransItemDAO(enConn, userProfile);

			FKTrans2AXTransItemFilter transIteFilter = new FKTrans2AXTransItemFilter();

			transIteFilter.FKTrans2AXTrans.code = FKTrans2AXTransObjCode;
			if (!transDate.equals("")) {
				transIteFilter.conditionSQL = "  FKTRANS2AXTRANSITEM.TRANSDATE = '" +transDate+ "'" ;
			}


			int[] transList = fkt2axtDAO.getFilteredCodeArray(transIteFilter, 0, -1);



			    for (int i = 0; i<transList.length; i++) {
			    	FKTrans2AXTransItem transItem = fkt2axtDAO.getObject(transList[i]);

			    	System.out.print(" fktrans2axtrans prepare move trans " + i + " from " + transList.length +
			    			" balCeh = " +  transItem.balCeh + " : " +
			    			" balSch = " +  transItem.balSch + " : " +
			    			" balKau = " +  transItem.balKau + " : " +
			    			" korCeh = " +  transItem.korCeh + " : " +
			    			" korSch = " +  transItem.korSch + " : " +
			    			" korKau = " +  transItem.korKau + " : " );

			    	if (i > 0 )
			    		transItem.voucher = retVoucher;

			    	retVoucher = ltAct.movePostingToAX(
			    			transItem.transDate,
			    			transItem.amountCur,
			    			transItem.currency,
			    			transItem.amountMST,
			    			transItem.accountNum,
			    			transItem.offsetAccountNum,
			    			transItem.accountDimension1+";"+
			    			transItem.accountDimension2+";"+
			    			transItem.accountDimension3+";"+
			    			transItem.accountDimension4+";"+
			    			transItem.accountDimension5+";"+
			    			transItem.accountDimension6+";"+
			    			transItem.accountDimension7+";"+
			    			transItem.accountDimension8+";"+
			    			transItem.accountDimension9+";"+
			    			transItem.accountDimension10+";"+
			    			transItem.accountDimension11+";"+
			    			transItem.accountDimension12+";"+
			    			transItem.accountDimension13,
			    			 transItem.corAccountDimension1+";"+
			    			 transItem.corAccountDimension2+";"+
			    			 transItem.corAccountDimension3+";"+
			    			 transItem.corAccountDimension4+";"+
			    			 transItem.corAccountDimension5+";"+
			    			 transItem.corAccountDimension6+";"+
			    			 transItem.corAccountDimension7+";"+
			    			 transItem.corAccountDimension8+";"+
			    			 transItem.corAccountDimension9+";"+
			    			 transItem.corAccountDimension10+";"+
			    			 transItem.corAccountDimension11+";"+
			    			 transItem.corAccountDimension12+";"+
			    			 transItem.corAccountDimension13,
			    			 transItem.ledgerTxt,
			    			 transItem.voucher
	        				);
			    	transItem.voucher = retVoucher;
			    	transItem.status =  FKTrans2AXTransItem.STATUS_MOVED;
			    	fkt2axtDAO.save(transItem);

			    }

		}catch(SystemException e)
        {
			ltAct.deletePostingToAX(retVoucher);
        	throw new SystemException("Error executing movePostingToAX   \n " + e.getMessage());
        } catch (DatasourceConnectException e) {

        	ltAct.deletePostingToAX(retVoucher);
        	throw new SystemException("Error executing movePostingToAX   \n " + e.getMessage());
		}
		catch (PersistenceException e) {

        	ltAct.deletePostingToAX(retVoucher);
        	throw new SystemException("Error executing movePostingToAX   \n " + e.getMessage());
		}
		finally {
			try {
				if(finConn != null && !finConn.isClosed()) {
					finConn.close();
				}
				if(enConn != null && !enConn.isClosed()) {
					enConn.close();
				}
			} catch (SQLException e) {
			}
		}
 }


 public void exportTrans2AX(Integer FKTrans2AXTransObjCode , String transDate) {
	 Connection finConn = null;
	 Connection enConn = null;
	 PreparedStatement statement = null;
	 ResultSet  resultset = null;
	 String retVoucher = "";
		try {
			finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			enConn = getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			AXTransactionsLogic axLogic = new AXTransactionsLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
			String usr = axLogic.getUserSecurity().domainUserName;
			String pwd = axLogic.getUserSecurity().userPass;


			FKTrans2AXTransItemDAO fkt2axtDAO = new FKTrans2AXTransItemDAO(enConn, userProfile);

			FKTrans2AXTransItemFilter transIteFilter = new FKTrans2AXTransItemFilter();

			transIteFilter.FKTrans2AXTrans.code = FKTrans2AXTransObjCode;
			if (!transDate.equals("")) {
				transIteFilter.conditionSQL = "  FKTRANS2AXTRANSITEM.TRANSDATE = '" +transDate+ "'" ;
			}

			transIteFilter.orderBySQL = "  FKTRANS2AXTRANSITEM.TRANSDATE ";


		    FKTrans2AXTransItemShortList f2kaxtranList = fkt2axtDAO.getScrollableFilteredList(transIteFilter, 0, -1);

			PackLedgerTransKSService_Service service = new PackLedgerTransKSService_Service();
			PackLedgerTransKSService proxy = service.getBasicHttpBindingPackLedgerTransKSService();
			((BindingProvider) proxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
			((BindingProvider) proxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

			PackTrans pckTrans = new PackTrans(proxy);


			// очистка  темп таблицу в AX
			pckTrans.clearTransFromStagingTable();

			// заполнение темп таблицу в AX
			pckTrans.exportTrans2AX(f2kaxtranList);

		}catch (PackLedgerTransKSServiceClearStagingTableAifFaultFaultFaultMessage e) {

			throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
		}
		catch (PackLedgerTransKSServiceCreateAifFaultFaultFaultMessage e) {

			throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
		}
		 catch(SystemException e)
        {
        	throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
        } catch (DatasourceConnectException e) {
        	throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
		}
		catch (PersistenceException e) {

        	throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
		} catch (DatatypeConfigurationException e) {

			throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
		}
		finally {
			try {
				if(finConn != null && !finConn.isClosed()) {
					finConn.close();
				}
				if(enConn != null && !enConn.isClosed()) {
					enConn.close();
				}
			} catch (SQLException e) {
			}
		}
 }




 public class KAUTemplates {
	 private String ledgerAccount;
	 private String convertTemplate;

 }


 public class DimensionsEqual {
	 private String dimensionNum;
	 private String kau;
	 private String accounts;

 }

/** заполнение kautemplates */
	public /*boolean*/ HashSet<KAUTemplates> getKautemplates() {

	 Set<KAUTemplates> hset = new HashSet<KAUTemplates>();
	 PreparedStatement stmt = null;
	 Connection mDaxConnection = null;
		try {
			mDaxConnection = getMDAXConnection();
			String sql = " select LedgerAccount , ConvertTemplate from  KAUTemplates ";

			stmt = mDaxConnection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				KAUTemplates aa = new KAUTemplates();
				aa.ledgerAccount = rs.getString("LedgerAccount");
				aa.convertTemplate = rs.getString("ConvertTemplate");
				hset.add(aa);

			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (Exception cte) {
			if (cte.getMessage().contains("USERID")) {
				throw new SystemException("\n\n"
						+ "Пользователь " + userProfile.userName + " не найден в Microsoft Dynamics AX...");
			} else {
				throw new SystemException(cte.getMessage(), cte);
			}

		} finally {

			try {
				if (stmt != null)
					stmt.close();
				stmt = null;
			} catch (SQLException e) {
			}

			closeConnection();
		}

		return (HashSet<KAUTemplates>) hset;
	}


	/** заполнение DimensionsEqual */
	public /*boolean*/ HashSet<DimensionsEqual> getDimensionsEqual() {

	 Set<DimensionsEqual> hset = new HashSet<DimensionsEqual>();
	 PreparedStatement stmt = null;
	 Connection mDaxConnection = null;
		try {
			mDaxConnection = getMDAXConnection();
			String sql = " select DIMENSIONNUM , KAU , ACCOUNTS from DimensionsEqual ";

			stmt = mDaxConnection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				DimensionsEqual aa = new DimensionsEqual();
				aa.dimensionNum = rs.getString("DIMENSIONNUM");
				aa.kau = rs.getString("KAU");
				aa.accounts = rs.getString("ACCOUNTS");
				hset.add(aa);

			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (Exception cte) {
			if (cte.getMessage().contains("USERID")) {
				throw new SystemException("\n\n"
						+ "Пользователь " + userProfile.userName + " не найден в Microsoft Dynamics AX...");
			} else {
				throw new SystemException(cte.getMessage(), cte);
			}

		} finally {

			try {
				if (stmt != null)
					stmt.close();
				stmt = null;
			} catch (SQLException e) {
			}

			closeConnection();
		}

		return (HashSet<DimensionsEqual>) hset;
	}

	/** создает проводки в аксапте из темповой таблицы аксапты  */
	public void startCreatingPack(Integer FKTrans2AXTransObjCode , String transDate) {
		 Connection finConn = null;
		 Connection enConn = null;

			try {
				finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
				enConn = getConnection_(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

				AXTransactionsLogic axLogic = new AXTransactionsLogic(
						getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), userProfile);
				String usr = axLogic.getUserSecurity().domainUserName;
				String pwd = axLogic.getUserSecurity().userPass;


				FKTrans2AXTransItemDAO fkt2axtDAO = new FKTrans2AXTransItemDAO(enConn, userProfile);
				FKTrans2AXTransDAO fkt2axDAO = new FKTrans2AXTransDAO(enConn, userProfile);

				FKTrans2AXTransItemFilter transIteFilter = new FKTrans2AXTransItemFilter();

				transIteFilter.FKTrans2AXTrans.code = FKTrans2AXTransObjCode;
				if (!transDate.equals("")) {
					transIteFilter.conditionSQL = "  FKTRANS2AXTRANSITEM.TRANSDATE = '" +transDate+ "'" ;
				}

				transIteFilter.orderBySQL = "  FKTRANS2AXTRANSITEM.TRANSDATE ";



			    FKTrans2AXTransItemShortList f2kaxtranList = fkt2axtDAO.getScrollableFilteredListGroup(transIteFilter, transIteFilter.conditionSQL, transIteFilter.orderBySQL, 0, -1, null);

				PackLedgerTransKSService_Service service = new PackLedgerTransKSService_Service();
				PackLedgerTransKSService proxy = service.getBasicHttpBindingPackLedgerTransKSService();
				((BindingProvider) proxy).getRequestContext().put(BindingProvider.USERNAME_PROPERTY, usr);
				((BindingProvider) proxy).getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, pwd);

				PackTrans pckTrans = new PackTrans(proxy);

				for (int i = 0; i < f2kaxtranList.totalCount; i++) {
				//  генерация проводок
					pckTrans.startCreatingPack(f2kaxtranList.get(i).transDate);
				}


			}catch (PackLedgerTransKSServiceStartCreatingPackAifFaultFaultFaultMessage e) {

				throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
			}

			 catch(SystemException e)
	        {
	        	throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
	        } catch (DatasourceConnectException e) {
	        	throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
			}
			catch (PersistenceException e) {

	        	throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
			} catch (DatatypeConfigurationException e) {

				throw new SystemException("Error executing exportTrans2AX   \n " + e.getMessage());
			}
			finally {
				try {
					if(finConn != null && !finConn.isClosed()) {
						finConn.close();
					}
					if(enConn != null && !enConn.isClosed()) {
						enConn.close();
					}
				} catch (SQLException e) {
				}
			}
	 }


}
