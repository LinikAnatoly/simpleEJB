
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlan2Humen;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENPlan2HumenShort;

public class ENPlan2HumenShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<ENPlan2HumenShort> list = new Vector<ENPlan2HumenShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENPlan2HumenShort> getList() {return list;}
  public final void setList(Vector<ENPlan2HumenShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENPlan2HumenShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENPlan2HumenShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENPlan2Humen

