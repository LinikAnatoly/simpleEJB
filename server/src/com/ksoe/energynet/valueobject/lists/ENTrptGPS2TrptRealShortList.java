
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTrptGPS2TrptReal;  	
  */

import java.io.Serializable;
import java.util.Vector;

public class ENTrptGPS2TrptRealShortList implements Serializable {

  public int totalCount = 0;
  public Vector list = new Vector();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENTrptGPS2TrptRealShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENTrptGPS2TrptRealShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENTrptGPS2TrptReal

