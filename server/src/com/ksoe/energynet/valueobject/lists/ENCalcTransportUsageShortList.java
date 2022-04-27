
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENCalcTransportUsage;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENCalcTransportUsageShort;

public class ENCalcTransportUsageShortList implements Serializable {

  public int totalCount = 0;
  public Vector<ENCalcTransportUsageShort> list = new Vector<ENCalcTransportUsageShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector<ENCalcTransportUsageShort> aValue) {list = aValue;}

  public final ENCalcTransportUsageShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENCalcTransportUsage

