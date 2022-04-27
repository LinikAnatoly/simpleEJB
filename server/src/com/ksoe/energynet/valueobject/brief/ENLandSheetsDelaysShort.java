
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENLandSheetsDelays;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENLandSheetsDelaysShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public Date dateFrom ;
	public Date dateTo ;
	public int standardDelay = Integer.MIN_VALUE;
	public int nonstandardDelay = Integer.MIN_VALUE;
	public String commentgen;
	public String userAdd;
	public Date dateAdd ;
	public String userGen;
	public Date dateEdit ;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	public int getStandardDelay() {
		return standardDelay;
	}

	public void setStandardDelay(int standardDelay) {
		this.standardDelay = standardDelay;
	}

	public int getNonstandardDelay() {
		return nonstandardDelay;
	}

	public void setNonstandardDelay(int nonstandardDelay) {
		this.nonstandardDelay = nonstandardDelay;
	}

	public String getCommentgen() {
		return commentgen;
	}

	public void setCommentgen(String commentgen) {
		this.commentgen = commentgen;
	}

	public String getUserAdd() {
		return userAdd;
	}

	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}

	public Date getDateAdd() {
		return dateAdd;
	}

	public void setDateAdd(Date dateAdd) {
		this.dateAdd = dateAdd;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}





}
