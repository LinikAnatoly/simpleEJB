
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActPostingKind;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActPostingKindShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numberGen;
	public String name;
	public Date dateTemplate ;
	public String account_expense;
	public String kau_expense;
	public String account_closing;
	public String kau_closing;
	public String typeOperMatetialsAct;
	public String typeOperMatetialsOrder;
	public String typeOperCountersAct;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getNumberGen() {
		return numberGen;
	}

	public void setNumberGen(String numberGen) {
		this.numberGen = numberGen;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDateTemplate() {
		return dateTemplate;
	}

	public void setDateTemplate(Date dateTemplate) {
		this.dateTemplate = dateTemplate;
	}

	public String getAccount_expense() {
		return account_expense;
	}

	public void setAccount_expense(String account_expense) {
		this.account_expense = account_expense;
	}

	public String getKau_expense() {
		return kau_expense;
	}

	public void setKau_expense(String kau_expense) {
		this.kau_expense = kau_expense;
	}

	public String getAccount_closing() {
		return account_closing;
	}

	public void setAccount_closing(String account_closing) {
		this.account_closing = account_closing;
	}

	public String getKau_closing() {
		return kau_closing;
	}

	public void setKau_closing(String kau_closing) {
		this.kau_closing = kau_closing;
	}

	public String getTypeOperMatetialsAct() {
		return typeOperMatetialsAct;
	}

	public void setTypeOperMatetialsAct(String typeOperMatetialsAct) {
		this.typeOperMatetialsAct = typeOperMatetialsAct;
	}

	public String getTypeOperMatetialsOrder() {
		return typeOperMatetialsOrder;
	}

	public void setTypeOperMatetialsOrder(String typeOperMatetialsOrder) {
		this.typeOperMatetialsOrder = typeOperMatetialsOrder;
	}

	public String getTypeOperCountersAct() {
		return typeOperCountersAct;
	}

	public void setTypeOperCountersAct(String typeOperCountersAct) {
		this.typeOperCountersAct = typeOperCountersAct;
	}




}
