
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActPostingKindItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActPostingKindItemShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String cehKt;
	public String accountKt;
	public String kauKt;
	public String cehDt;
	public String accountDt;
	public String kauDt;
	public BigDecimal summaGen;
	public String plusMinus;
	public String description;
	public int ENActPostingKindCode = Integer.MIN_VALUE;
	public String ENActPostingKindNumberGen;
	public String ENActPostingKindName;
	public Date ENActPostingKindDateTemplate;
	public String ENActPostingKindAccount_expense;
	public String ENActPostingKindKau_expense;
	public String ENActPostingKindAccount_closing;
	public String ENActPostingKindKau_closing;
	public String ENActPostingKindTypeOperMatetialsAct;
	public String ENActPostingKindTypeOperMatetialsOrder;
	public String ENActPostingKindTypeOperCountersAct;
	public int ENActPostingTypeSumCode = Integer.MIN_VALUE;
	public String ENActPostingTypeSumName;
	public int ENActPostingFormCode = Integer.MIN_VALUE;
	public String ENActPostingFormName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getCehKt() {
		return cehKt;
	}

	public void setCehKt(String cehKt) {
		this.cehKt = cehKt;
	}

	public String getAccountKt() {
		return accountKt;
	}

	public void setAccountKt(String accountKt) {
		this.accountKt = accountKt;
	}

	public String getKauKt() {
		return kauKt;
	}

	public void setKauKt(String kauKt) {
		this.kauKt = kauKt;
	}

	public String getCehDt() {
		return cehDt;
	}

	public void setCehDt(String cehDt) {
		this.cehDt = cehDt;
	}

	public String getAccountDt() {
		return accountDt;
	}

	public void setAccountDt(String accountDt) {
		this.accountDt = accountDt;
	}

	public String getKauDt() {
		return kauDt;
	}

	public void setKauDt(String kauDt) {
		this.kauDt = kauDt;
	}

	public BigDecimal getSummaGen() {
		return summaGen;
	}

	public void setSummaGen(BigDecimal summaGen) {
		this.summaGen = summaGen;
	}

	public String getPlusMinus() {
		return plusMinus;
	}

	public void setPlusMinus(String plusMinus) {
		this.plusMinus = plusMinus;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public int getENActPostingKindCode(){
		return ENActPostingKindCode;
	}

	public void setENActPostingKindCode(int ENActPostingKindCode) {
		this.ENActPostingKindCode = ENActPostingKindCode;
	}

	public String getENActPostingKindNumberGen(){
		return ENActPostingKindNumberGen;
	}

	public void setENActPostingKindNumberGen(String ENActPostingKindNumberGen) {
		this.ENActPostingKindNumberGen = ENActPostingKindNumberGen;
	}

	public String getENActPostingKindName(){
		return ENActPostingKindName;
	}

	public void setENActPostingKindName(String ENActPostingKindName) {
		this.ENActPostingKindName = ENActPostingKindName;
	}

	public Date getENActPostingKindDateTemplate(){
		return ENActPostingKindDateTemplate;
	}

	public void setENActPostingKindDateTemplate(Date ENActPostingKindDateTemplate) {
		this.ENActPostingKindDateTemplate = ENActPostingKindDateTemplate;
	}

	public String getENActPostingKindAccount_expense(){
		return ENActPostingKindAccount_expense;
	}

	public void setENActPostingKindAccount_expense(String ENActPostingKindAccount_expense) {
		this.ENActPostingKindAccount_expense = ENActPostingKindAccount_expense;
	}

	public String getENActPostingKindKau_expense(){
		return ENActPostingKindKau_expense;
	}

	public void setENActPostingKindKau_expense(String ENActPostingKindKau_expense) {
		this.ENActPostingKindKau_expense = ENActPostingKindKau_expense;
	}

	public String getENActPostingKindAccount_closing(){
		return ENActPostingKindAccount_closing;
	}

	public void setENActPostingKindAccount_closing(String ENActPostingKindAccount_closing) {
		this.ENActPostingKindAccount_closing = ENActPostingKindAccount_closing;
	}

	public String getENActPostingKindKau_closing(){
		return ENActPostingKindKau_closing;
	}

	public void setENActPostingKindKau_closing(String ENActPostingKindKau_closing) {
		this.ENActPostingKindKau_closing = ENActPostingKindKau_closing;
	}

	public String getENActPostingKindTypeOperMatetialsAct(){
		return ENActPostingKindTypeOperMatetialsAct;
	}

	public void setENActPostingKindTypeOperMatetialsAct(String ENActPostingKindTypeOperMatetialsAct) {
		this.ENActPostingKindTypeOperMatetialsAct = ENActPostingKindTypeOperMatetialsAct;
	}

	public String getENActPostingKindTypeOperMatetialsOrder(){
		return ENActPostingKindTypeOperMatetialsOrder;
	}

	public void setENActPostingKindTypeOperMatetialsOrder(String ENActPostingKindTypeOperMatetialsOrder) {
		this.ENActPostingKindTypeOperMatetialsOrder = ENActPostingKindTypeOperMatetialsOrder;
	}

	public String getENActPostingKindTypeOperCountersAct(){
		return ENActPostingKindTypeOperCountersAct;
	}

	public void setENActPostingKindTypeOperCountersAct(String ENActPostingKindTypeOperCountersAct) {
		this.ENActPostingKindTypeOperCountersAct = ENActPostingKindTypeOperCountersAct;
	}

	public int getENActPostingTypeSumCode(){
		return ENActPostingTypeSumCode;
	}

	public void setENActPostingTypeSumCode(int ENActPostingTypeSumCode) {
		this.ENActPostingTypeSumCode = ENActPostingTypeSumCode;
	}

	public String getENActPostingTypeSumName(){
		return ENActPostingTypeSumName;
	}

	public void setENActPostingTypeSumName(String ENActPostingTypeSumName) {
		this.ENActPostingTypeSumName = ENActPostingTypeSumName;
	}

	public int getENActPostingFormCode(){
		return ENActPostingFormCode;
	}

	public void setENActPostingFormCode(int ENActPostingFormCode) {
		this.ENActPostingFormCode = ENActPostingFormCode;
	}

	public String getENActPostingFormName(){
		return ENActPostingFormName;
	}

	public void setENActPostingFormName(String ENActPostingFormName) {
		this.ENActPostingFormName = ENActPostingFormName;
	}



}
