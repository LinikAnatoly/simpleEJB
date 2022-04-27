
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for CNPack;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.CNPackDAO;
import com.ksoe.energynet.ejb.generated.CNPackControllerEJBGen;
import com.ksoe.energynet.logic.CNLogic;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.filter.CNPackFilter;
import com.ksoe.energynet.valueobject.lists.CNPackShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
//import com.ksoe.energynet.valueobject.CNPack;
//import com.ksoe.energynet.valueobject.CNPack;
//import com.ksoe.energynet.valueobject.lists.CNPackShortList;
//import com.ksoe.energynet.valueobject.filter.CNPackFilter;

public class CNPackControllerEJB extends CNPackControllerEJBGen
 {

  public CNPackControllerEJB() {}

  /* CNPack(Пакети документів з EnergyWorkflow). Получить список по фильтру для просмотра */
  public CNPackShortList getCNPackList(CNPackFilter f, int fromPosition, int quantity)
  {
	    try
	     {
	    	CNPackDAO objectDAO = new CNPackDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
	        return objectDAO.getCNPackList(f, fromPosition, quantity);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  /* CNPack(EnergyWorkflow). Получить список пакетов подсистем
   * ПРИСОЕДИНЕНИЕ до и после 01.08.2010, с 14.03.2011 по фильтру с текущими состояниями */
  public CNPackShortList getCNPackCurStateList(CNPackFilter f, int fromPosition, int quantity)
  {
	    try
	     {
	    	CNPackDAO objectDAO = new CNPackDAO(getUserProfile(),
	    			getConnection(AuthorizationJNDINames.CN_DATASOURCE));
	        return objectDAO.getCNPackCurStateList(f, fromPosition, quantity);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  /* CNPack(EnergyWorkflow). Получить пакеты
   * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ ЮРИДИЧЕСКОГО И БЫТОВОГО СЕКТОРОВ
   * по фильтру с текущими состояниями */
  public CNPackShortList getSPL_PP_PackCurStateList(CNPackFilter f, int fromPosition, int quantity)
  {
	    try
	     {
	    	CNPackDAO objectDAO = new CNPackDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
	        return objectDAO.getSPL_PP_PackCurStateList(f, fromPosition, quantity);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  public CNPack getObjectByCodeAndSubsystem(int uid, int ssID)
  {

	  try
	     {
	    	CNPackDAO objectDAO = new CNPackDAO(getUserProfile(), getConnection(AuthorizationJNDINames.CN_DATASOURCE));
	        return objectDAO.getObjectByCodeAndSubsystem(uid, ssID);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  public int addPackCN(CNPack pack)
  {
	  try
	     {
	    	CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
	        return cnLogic.addPackCN(pack);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  public int savePackCN(CNPack pack)
  {
	  try
	     {
	    	CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
	        return cnLogic.savePackCN(pack);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  public void completeTask(int id_pack, int id_movement, int[] states, int id_pack_status, int id_user, 
  		String note, String client_ip)
  {
	  try
      {
    	 CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
         cnLogic.completeTask(id_pack, id_movement, states, id_pack_status, id_user, note, client_ip);
      }
      catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
      catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
      finally                              {closeConnection();}
  }
  
  public void sendPackToArchive(int id_pack, int id_movement, int id_user, String note, String client_ip)
  {
	  try
      {
    	 CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
         cnLogic.sendPackToArchive(id_pack, id_movement, id_user, note, client_ip);
      }
      catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
      catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
      finally                              {closeConnection();}
  }
  
  public void deleteDSTPack(int id_pack, int id_pack_status, int id_old_pack_status, int id_user, String action) {
	  try
      {
    	 CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
         cnLogic.deleteDSTPack(id_pack, id_pack_status, id_old_pack_status, id_user, action);
      }
      catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
      catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
      finally                              {closeConnection();}
  }
  
	/**
	 *    Обновляем EIC для DFDocSupplyEE
	 *    
	 * @param cnDSTPackCode  - Код пакета DST
	 * @param eic			- EIC-код точки обліку
	 * @throws PersistenceException
	 */
  public void updateEICDFDocSupplyEE(int cnDSTPackCode, String eic) {
	  try
      {
    	 CNLogic cnLogic = new CNLogic(getConnection(AuthorizationJNDINames.CN_DATASOURCE),getUserProfile());
         cnLogic.updateEICDFDocSupplyEE(cnDSTPackCode, eic);
      }
      catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с EnergyWokflow!",e);}
      catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
      finally                              {closeConnection();}
  }
  
} // end of EJB Controller for CNPack