
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTravelSheetItemDistance2TKFuelKoef;  	
  */

import java.util.Vector;
import java.io.Serializable;

public class ENTravelSheetItemDistance2TKFuelKoefShortList implements Serializable {

  public int totalCount = 0;
  public Vector list = new Vector();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENTravelSheetItemDistance2TKFuelKoefShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENTravelSheetItemDistance2TKFuelKoefShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENTravelSheetItemDistance2TKFuelKoef

