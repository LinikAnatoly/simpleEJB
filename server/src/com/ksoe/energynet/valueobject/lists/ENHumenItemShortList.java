
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENHumenItem;  	
  */

import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENHumenItemShort;

import java.io.Serializable;

public class ENHumenItemShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<ENHumenItemShort> list = new Vector<ENHumenItemShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENHumenItemShort> getList() {return list;}
  public final void setList(Vector<ENHumenItemShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENHumenItemShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENHumenItem

