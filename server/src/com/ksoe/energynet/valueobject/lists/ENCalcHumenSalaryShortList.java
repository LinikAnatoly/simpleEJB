
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENCalcHumenSalary;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENCalcHumenSalaryShort;

public class ENCalcHumenSalaryShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENCalcHumenSalaryShort> list = new Vector<ENCalcHumenSalaryShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENCalcHumenSalaryShort> getList() {return list;}
	public final void setList(Vector<ENCalcHumenSalaryShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENCalcHumenSalaryShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENCalcHumenSalary

