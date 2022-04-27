
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for SCUsageInputItemOZ;  
  * 	
  */



import java.sql.Connection;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAct2ProvDAO;
import com.ksoe.energynet.dataminer.SCUsageInputItemOZ2ProvDAO;
import com.ksoe.energynet.ejb.generated.SCUsageInputItemOZControllerEJBGen;
import com.ksoe.energynet.valueobject.filter.ENAct2ProvFilter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2ProvFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2ProvShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKPostingLogic;
import com.ksoe.fin.valueobject.lists.FKProvObjectShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class SCUsageInputItemOZControllerEJB extends SCUsageInputItemOZControllerEJBGen
 {

  public SCUsageInputItemOZControllerEJB() {}

  
  
  public FKProvObjectShortList getPostingsList(int ozCode)
  {
      FKProvObjectShortList result = new FKProvObjectShortList();

      Connection finConn = null;

      try
      {
          SCUsageInputItemOZ2ProvFilter oz2provFilter = new SCUsageInputItemOZ2ProvFilter();
          oz2provFilter.ozRef.code = ozCode;
          SCUsageInputItemOZ2ProvDAO oz2provDAO = new SCUsageInputItemOZ2ProvDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
          SCUsageInputItemOZ2ProvShortList oz2provList = oz2provDAO.getScrollableFilteredList(oz2provFilter, 0, -1);

          if (oz2provList.totalCount == 0)
          {
              return result;
          }

          if (oz2provList.totalCount > 1)
          {
              throw new EnergyproSystemException("Знайдено декілька (" + oz2provList.totalCount + ") пачок проводок для цього акту!");
          }

          //enConn = getRemoteConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
          int partId = oz2provList.get(0).partId;
          if (partId == Integer.MIN_VALUE)
          {
              throw new EnergyproSystemException("Відсутній код пачки проводок для цього акту!");
          }

          finConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

          FKPostingLogic fpLogic = new FKPostingLogic(finConn, getUserProfile());
          return fpLogic.getProvListFromFin(partId);
      }
      catch (DatasourceConnectException e) {throw new EnergyproSystemException("Нет связи с БД Фин.Коллекции ...",e);}
      catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
      finally                              {
          try {
              if (finConn != null && ! finConn.isClosed()) {
                  finConn.close();
                  finConn = null;
              }
          } catch (SQLException e) {
          }

          closeConnection();
      }
  }

} // end of EJB Controller for SCUsageInputItemOZ