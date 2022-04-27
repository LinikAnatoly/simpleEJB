
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENIPItem;
 *
 */

import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENIPDAO;
import com.ksoe.energynet.dataminer.ENIPItem2ContractDAO;
import com.ksoe.energynet.dataminer.ENIPItem2ENIPItemDAO;
import com.ksoe.energynet.dataminer.ENIPItemDAO;
import com.ksoe.energynet.ejb.generated.ENIPItemControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.InvestProgramLogic;
import com.ksoe.energynet.valueobject.ENIP;
import com.ksoe.energynet.valueobject.ENIPItem;
import com.ksoe.energynet.valueobject.ENIPStatus;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ContractFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ENIPItemFilter;
import com.ksoe.energynet.valueobject.filter.ENIPItemFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItemShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKMeasurementDAO;
import com.ksoe.techcard.valueobject.filter.TKMeasurementFilter;
import com.ksoe.techcard.valueobject.lists.TKMeasurementShortList;

public class ENIPItemControllerEJB extends
		ENIPItemControllerEJBGen {

	public ENIPItemControllerEJB() {
	}

	/* ENIPItem. Изменить */
	public void save(ENIPItem object) {
		try {
			ENIPItemDAO objectDAO = new ENIPItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENIPItem oldObject = objectDAO.getObject(object.code);
			
			/////
			if (object.ipRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			if (object.ipRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			ENIPDAO ipDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENIP investProgram = ipDAO.getObject(object.ipRef.code);

			if (investProgram == null)
			{
				throw new SystemException("\n\nNET-4344 Не знайдено Інвестпрограму з кодом " + object.ipRef.code + " !");
			}

			if (investProgram.statusRef.code != ENIPStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4344 Редагувати позиції можна тільки в чорновій Інвестпрограмі!");
			}
			/////

			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			InvestProgramLogic ipLogic = new InvestProgramLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ipLogic.checkLastVersionIP(investProgram.code, true);
			/////

		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    objectDAO.save(object);

		   if( 
		    oldObject.countGen.compareTo(object.countGen) !=  0 || 
		    oldObject.price.compareTo(object.price) !=  0 || 
		    oldObject.sumGen.compareTo(object.sumGen) !=  0 || 
		    oldObject.quarter1count.compareTo(object.quarter1count) !=  0 || 
		    oldObject.quarter1sum.compareTo(object.quarter1sum) !=  0 || 
		    oldObject.quarter2count.compareTo(object.quarter2count) !=  0 || 
		    oldObject.quarter2sum.compareTo(object.quarter2sum) !=  0 || 
		    oldObject.quarter3count.compareTo(object.quarter3count) !=  0 || 
		    oldObject.quarter3sum.compareTo(object.quarter3sum) !=  0 || 
		    oldObject.quarter4count.compareTo(object.quarter4count) !=  0 || 
		    oldObject.quarter4sum.compareTo(object.quarter4sum) !=  0 
			){		    	
		    	
			    if(object.parentRef.code != Integer.MIN_VALUE){
			    	this.recalcParentIpItem(object);
			    }
		   }

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENIPItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}





	/* ENIPItem. Добавить */
	public int add(ENIPItem object) {
		try {
			/////
			if (object.ipRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			if (object.ipRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			ENIPDAO ipDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			AuthLogic netAuth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TKMeasurementDAO measDAO = new TKMeasurementDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)); 
			
			/////// 20.12.2016 ед изм из mdax // нет айди ед изм поэтому вытянем айдишник ед изм с базы energyNET
			if (object.measurement.code == Integer.MIN_VALUE || object.measurement.code == 0  ) {
				TKMeasurementFilter measFil = new TKMeasurementFilter();
				measFil.name = object.measurement.name;
				TKMeasurementShortList measList = measDAO.getScrollableFilteredList(measFil,measFil.conditionSQL," code ",0,-1,null, false);
				
				if (measList.totalCount > 0) {
					object.measurement.code = measList.get(0).code;
				}
				
			}
			
			
			ENIP investProgram = ipDAO.getObject(object.ipRef.code);

			if (investProgram == null)
			{
				throw new SystemException("\n\nNET-4344 Не знайдено Інвестпрограму з кодом " + object.ipRef.code + " !");
			}

			if (investProgram.statusRef.code != ENIPStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4344 Додавати позиції можна тільки в чорнову Інвестпрограму!");
			}
			/////

			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			InvestProgramLogic ipLogic = new InvestProgramLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ipLogic.checkLastVersionIP(investProgram.code, true);
			/////

			int outipitemcode = 0;
			ENIPItemDAO objectDAO = new ENIPItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userAdd = getUserProfile().userName;
	        object.dateAdd = new Date();
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();



	        outipitemcode = objectDAO.add(object);

	        if(object.parentRef.code != Integer.MIN_VALUE){
	        	this.recalcParentIpItem(object);
		    }


	        return outipitemcode;



		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENIPItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENIPItem. пересчитать строку парент если меняется/добавляется под нее дочерняя строка  */
	public void recalcParentIpItem(ENIPItem object) {
		try {
			ENIPItemDAO objectDAO = new ENIPItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIPItem objectParent = objectDAO.getObject(object.parentRef.code);

			objectParent.countGen = new BigDecimal(0);
			objectParent.price = new BigDecimal(0);
			objectParent.sumGen =  new BigDecimal(0);
			objectParent.quarter1count =  new BigDecimal(0);
			objectParent.quarter1sum =  new BigDecimal(0);
			objectParent.quarter2count =  new BigDecimal(0);
			objectParent.quarter2sum =  new BigDecimal(0);
			objectParent.quarter3count =  new BigDecimal(0);
			objectParent.quarter3sum =  new BigDecimal(0);
			objectParent.quarter4count =  new BigDecimal(0);
			objectParent.quarter4sum =  new BigDecimal(0);




			ENIPItemFilter itchildFilter = new ENIPItemFilter();
			itchildFilter.parentRef.code = objectParent.code;
			ENIPItemShortList itchildList = objectDAO.getScrollableFilteredList(itchildFilter, 0, -1);
			 for (int i=0; i < itchildList.totalCount; i++){

				    objectParent.countGen = objectParent.countGen.add(itchildList.get(i).countGen);

					objectParent.sumGen =  objectParent.sumGen.add(itchildList.get(i).sumGen);
					objectParent.quarter1count =  objectParent.quarter1count.add(itchildList.get(i).quarter1count);
					objectParent.quarter1sum =  objectParent.quarter1sum.add(itchildList.get(i).quarter1sum);
					objectParent.quarter2count =  objectParent.quarter2count.add(itchildList.get(i).quarter2count);
					objectParent.quarter2sum =  objectParent.quarter2sum.add(itchildList.get(i).quarter2sum);
					objectParent.quarter3count =  objectParent.quarter3count.add(itchildList.get(i).quarter3count);
					objectParent.quarter3sum =  objectParent.quarter3sum.add(itchildList.get(i).quarter3sum);
					objectParent.quarter4count =  objectParent.quarter4count.add(itchildList.get(i).quarter4count);
					objectParent.quarter4sum =  objectParent.quarter4sum.add(itchildList.get(i).quarter4sum);
					// calc price

					objectParent.price = objectParent.sumGen.divide(objectParent.countGen, 3, BigDecimal.ROUND_HALF_UP);

			 }

			 objectDAO.save(objectParent);


		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENIPItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENIPItem. Удалить */
	public void remove(int code) {
		try {
			ENIPItemDAO objectDAO = new ENIPItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENIPItem2ENIPItemDAO it2itDAO = new ENIPItem2ENIPItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENIPItem object = objectDAO.getObject(code);

			/////
			if (object.ipRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			if (object.ipRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			ENIPDAO ipDAO = new ENIPDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENIP investProgram = ipDAO.getObject(object.ipRef.code);

			if (investProgram == null)
			{
				throw new SystemException("\n\nNET-4344 Не знайдено Інвестпрограму з кодом " + object.ipRef.code + " !");
			}

			if (investProgram.statusRef.code != ENIPStatus.DRAFT)
			{
				throw new SystemException("\n\nNET-4344 Видаляти позиції можна тільки з чорнової Інвестпрограми!");
			}
			/////

			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			InvestProgramLogic ipLogic = new InvestProgramLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ipLogic.checkLastVersionIP(investProgram.code, true);
			/////

			// 28.05.2014 - удалим связки			//

			ENIPItem2ENIPItemFilter i22itFilter = new ENIPItem2ENIPItemFilter();
			i22itFilter.ipItemOutRef.code = code;


			int[] it2itArr = it2itDAO.getFilteredCodeArray(i22itFilter, 0, -1);
			if (it2itArr.length > 0 ){
				it2itDAO.remove(it2itArr[0]);
			}

            objectDAO.remove(code);

			if(object.parentRef.code != Integer.MIN_VALUE){
	        	this.recalcParentIpItem(object);
		    }

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENIPItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENIPItem. Изменить суммы для финансирования */
	public void saveSumInside(ENIPItem object) {
		try {

			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			if (object.ipRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			if (object.ipRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			InvestProgramLogic ipLogic = new InvestProgramLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ipLogic.checkLastVersionIP(object.ipRef.code, true);
			/////

			ENIPItemDAO objectDAO = new ENIPItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    objectDAO.saveSumInside(object);

		    if(object.parentRef.code != Integer.MIN_VALUE){
		    	this.recalcParentIpItemSumInside(object);
		    }

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENIPItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENIPItem. пересчитать строку парент ТОЛЬКО СУММЫ ДЛЯ ФИНАНСИРОВАНИЯ если меняется/добавляется под нее дочерняя строка  */
	public void recalcParentIpItemSumInside(ENIPItem object) {
		try {
			ENIPItemDAO objectDAO = new ENIPItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIPItem objectParent = objectDAO.getObject(object.parentRef.code);



			objectParent.countGenInside = new BigDecimal(0);
			objectParent.priceInside =  new BigDecimal(0);
			objectParent.sumGenInside = new BigDecimal(0);
			objectParent.mm1countInside =  new BigDecimal(0);
		    objectParent.mm2countInside =  new BigDecimal(0);
		    objectParent.mm3countInside =  new BigDecimal(0);
		    objectParent.mm4countInside =  new BigDecimal(0);
		    objectParent.mm5countInside =  new BigDecimal(0);
		    objectParent.mm6countInside =  new BigDecimal(0);
		    objectParent.mm7countInside =  new BigDecimal(0);
		    objectParent.mm8countInside =  new BigDecimal(0);
		    objectParent.mm9countInside =  new BigDecimal(0);
		    objectParent.mm10countInside =  new BigDecimal(0);
		    objectParent.mm11countInside =  new BigDecimal(0);
		    objectParent.mm12countInside =  new BigDecimal(0);
		    objectParent.mm1sumInside =  new BigDecimal(0);
		    objectParent.mm2sumInside =  new BigDecimal(0);
		    objectParent.mm3sumInside =  new BigDecimal(0);
		    objectParent.mm4sumInside =  new BigDecimal(0);
		    objectParent.mm5sumInside =  new BigDecimal(0);
		    objectParent.mm6sumInside =  new BigDecimal(0);
		    objectParent.mm7sumInside =  new BigDecimal(0);
		    objectParent.mm8sumInside =  new BigDecimal(0);
		    objectParent.mm9sumInside =  new BigDecimal(0);
		    objectParent.mm10sumInside =  new BigDecimal(0);
		    objectParent.mm11sumInside =  new BigDecimal(0);
		    objectParent.mm12sumInside =  new BigDecimal(0);





			ENIPItemFilter itchildFilter = new ENIPItemFilter();
			itchildFilter.parentRef.code = objectParent.code;
			ENIPItemShortList itchildList = objectDAO.getScrollableFilteredList(itchildFilter, 0, -1);
			 for (int i=0; i < itchildList.totalCount; i++){

				    objectParent.countGenInside = objectParent.countGenInside.add(itchildList.get(i).countGenInside);
					objectParent.sumGenInside =  objectParent.sumGenInside.add(itchildList.get(i).sumGenInside);

					objectParent.mm1countInside = objectParent.mm1countInside.add(itchildList.get(i).mm1countInside);
					objectParent.mm2countInside = objectParent.mm2countInside.add(itchildList.get(i).mm2countInside);
					objectParent.mm3countInside = objectParent.mm3countInside.add(itchildList.get(i).mm3countInside);
					objectParent.mm4countInside = objectParent.mm4countInside.add(itchildList.get(i).mm4countInside);
					objectParent.mm5countInside = objectParent.mm5countInside.add(itchildList.get(i).mm5countInside);
					objectParent.mm6countInside = objectParent.mm6countInside.add(itchildList.get(i).mm6countInside);
					objectParent.mm7countInside = objectParent.mm7countInside.add(itchildList.get(i).mm7countInside);
					objectParent.mm8countInside = objectParent.mm8countInside.add(itchildList.get(i).mm8countInside);
					objectParent.mm9countInside = objectParent.mm9countInside.add(itchildList.get(i).mm9countInside);
					objectParent.mm10countInside = objectParent.mm10countInside.add(itchildList.get(i).mm10countInside);
					objectParent.mm11countInside = objectParent.mm11countInside.add(itchildList.get(i).mm11countInside);
					objectParent.mm12countInside = objectParent.mm12countInside.add(itchildList.get(i).mm12countInside);

					objectParent.mm1sumInside = objectParent.mm1sumInside.add(itchildList.get(i).mm1sumInside);
					objectParent.mm2sumInside = objectParent.mm2sumInside.add(itchildList.get(i).mm2sumInside);
					objectParent.mm3sumInside = objectParent.mm3sumInside.add(itchildList.get(i).mm3sumInside);
					objectParent.mm4sumInside = objectParent.mm4sumInside.add(itchildList.get(i).mm4sumInside);
					objectParent.mm5sumInside = objectParent.mm5sumInside.add(itchildList.get(i).mm5sumInside);
					objectParent.mm6sumInside = objectParent.mm6sumInside.add(itchildList.get(i).mm6sumInside);
					objectParent.mm7sumInside = objectParent.mm7sumInside.add(itchildList.get(i).mm7sumInside);
					objectParent.mm8sumInside = objectParent.mm8sumInside.add(itchildList.get(i).mm8sumInside);
					objectParent.mm9sumInside = objectParent.mm9sumInside.add(itchildList.get(i).mm9sumInside);
					objectParent.mm10sumInside = objectParent.mm10sumInside.add(itchildList.get(i).mm10sumInside);
					objectParent.mm11sumInside = objectParent.mm11sumInside.add(itchildList.get(i).mm11sumInside);
					objectParent.mm12sumInside = objectParent.mm12sumInside.add(itchildList.get(i).mm12sumInside);




					//objectParent.priceInside = objectParent.sumGenInside.divide(objectParent.countGenInside, 3, BigDecimal.ROUND_HALF_UP);

			 }


			 if (objectParent.countGenInside != null)
			 {
				 if (objectParent.countGenInside.doubleValue() > 0)
				 {
					 objectParent.priceInside = objectParent.sumGenInside.divide(objectParent.countGenInside, 3, BigDecimal.ROUND_HALF_UP);
				 }
			 }

			 objectDAO.saveSumInside(objectParent);


		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENIPItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENIPItem. Изменить информацию по торгам   */
	public void saveinfoTenders(ENIPItem object) {
		try {

			///// 16.04.14 Проверим, последнюю ли версию ИП пытаются редактировать
			if (object.ipRef == null)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			if (object.ipRef.code == Integer.MIN_VALUE)
			{
				throw new SystemException("\n\nNET-4344 Не вказано код Інвестпрограми!");
			}

			InvestProgramLogic ipLogic = new InvestProgramLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ipLogic.checkLastVersionIP(object.ipRef.code, true);
			/////


			ENIPItemDAO objectDAO = new ENIPItemDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIPItem2ContractDAO it2cDAO = new ENIPItem2ContractDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENIPItem2ContractFilter it2cFilter = new ENIPItem2ContractFilter();
			it2cFilter.ipItemRef.code = object.code;
			int[] it2cArr = it2cDAO.getFilteredCodeArray(it2cFilter, 0, -1);
			if (it2cArr.length > 0 ){
				throw new SystemException("\n\n" +
                        " Під пункт ІП знайдено прив`язку до договорів. Ручне редагування інформації по торгам неможливе !!!");
			}

			//поищем в дочерних пунктах ИП
			it2cFilter = new ENIPItem2ContractFilter();
			it2cFilter.conditionSQL = "      enipitem2contract.ipitemrefcode in (    select pi.code from enipitem pi where pi.parentrefcode = " + object.code + "  )";
			it2cArr = it2cDAO.getFilteredCodeArray(it2cFilter, 0, -1);
			if (it2cArr.length > 0 ){
				throw new SystemException("\n\n" +
                        " В підпунктах ІП знайдено прив`язку до договорів. Ручне редагування інформації по торгам неможливе !!!");
			}

		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    objectDAO.saveinfoTenders(object);

		    if(object.parentRef.code != Integer.MIN_VALUE){
		    	ipLogic.recalcParentIpItemInfoTenders(object); // если меняем инфу на дочернем пункте ИП то обновим для парента
		    }

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENIPItem%} object.",e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	


} // end of EJB Controller for ENIPItem