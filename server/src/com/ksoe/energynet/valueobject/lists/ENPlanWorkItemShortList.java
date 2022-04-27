
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlanWorkItem;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENPlanWorkItemShort;

public class ENPlanWorkItemShortList implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public int totalCount = 0;
  
	public Vector<ENPlanWorkItemShort> list = new Vector<ENPlanWorkItemShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENPlanWorkItemShort> getList() {return list;}
  public final void setList(Vector<ENPlanWorkItemShort> aValue) {list = aValue;}

  public final ENPlanWorkItemShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENPlanWorkItem

