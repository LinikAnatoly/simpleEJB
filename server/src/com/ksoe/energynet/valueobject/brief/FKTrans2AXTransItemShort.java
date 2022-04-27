
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FKTrans2AXTransItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FKTrans2AXTransItemShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String numUnFKStr;
	public int partId = Integer.MIN_VALUE;
	public int isPrihod = Integer.MIN_VALUE;
	public Date transDate ;
	public String balCeh;
	public String balSch;
	public String balKau;
	public String korCeh;
	public String korSch;
	public String korKau;
	public BigDecimal amountCur;
	public String currency;
	public BigDecimal amountMST;
	public String accountNum;
	public String offsetAccountNum;
	public String accountDimension1;
	public String accountDimension2;
	public String accountDimension3;
	public String accountDimension4;
	public String accountDimension5;
	public String accountDimension6;
	public String accountDimension7;
	public String accountDimension8;
	public String accountDimension9;
	public String accountDimension10;
	public String accountDimension11;
	public String accountDimension12;
	public String accountDimension13;
	public String corAccountDimension1;
	public String corAccountDimension2;
	public String corAccountDimension3;
	public String corAccountDimension4;
	public String corAccountDimension5;
	public String corAccountDimension6;
	public String corAccountDimension7;
	public String corAccountDimension8;
	public String corAccountDimension9;
	public String corAccountDimension10;
	public String corAccountDimension11;
	public String corAccountDimension12;
	public String corAccountDimension13;
	public String ledgerTxt;
	public String voucher;
	public int status = Integer.MIN_VALUE;
	public String errorStr;
	public int FKTrans2AXTransCode = Integer.MIN_VALUE;
	public int FKTrans2AXTransMonthGen = Integer.MIN_VALUE;
	public int FKTrans2AXTransYearGen = Integer.MIN_VALUE;
	public String FKTrans2AXTransTaskOwner;
	
	public String balans;
	
	public int chargerefcode;


	public int getChargerefcode() {
		return chargerefcode;
	}

	public void setChargerefcode(int chargerefcode) {
		this.chargerefcode = chargerefcode;
	}

	public String getBalans() {
		return balans;
	}

	public void setBalans(String balans) {
		this.balans = balans;
	}

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setNumUnFKStr(String aValue){
		numUnFKStr = aValue;
	}

	public String getNumUnFKStr(){
		return numUnFKStr;
	}

	public void setPartId(int aValue){
		partId = aValue;
	}

	public int getPartId(){
		return partId;
	}

	public void setIsPrihod(int aValue){
		isPrihod = aValue;
	}

	public int getIsPrihod(){
		return isPrihod;
	}

	public void setTransDate(Date aValue){
		transDate = aValue;
	}

	public Date getTransDate(){
		return transDate;
	}

	public void setBalCeh(String aValue){
		balCeh = aValue;
	}

	public String getBalCeh(){
		return balCeh;
	}

	public void setBalSch(String aValue){
		balSch = aValue;
	}

	public String getBalSch(){
		return balSch;
	}

	public void setBalKau(String aValue){
		balKau = aValue;
	}

	public String getBalKau(){
		return balKau;
	}

	public void setKorCeh(String aValue){
		korCeh = aValue;
	}

	public String getKorCeh(){
		return korCeh;
	}

	public void setKorSch(String aValue){
		korSch = aValue;
	}

	public String getKorSch(){
		return korSch;
	}

	public void setKorKau(String aValue){
		korKau = aValue;
	}

	public String getKorKau(){
		return korKau;
	}

	public void setAmountCur(BigDecimal aValue){
		amountCur = aValue;
	}

	public BigDecimal getAmountCur(){
		return amountCur;
	}

	public void setCurrency(String aValue){
		currency = aValue;
	}

	public String getCurrency(){
		return currency;
	}

	public void setAmountMST(BigDecimal aValue){
		amountMST = aValue;
	}

	public BigDecimal getAmountMST(){
		return amountMST;
	}

	public void setAccountNum(String aValue){
		accountNum = aValue;
	}

	public String getAccountNum(){
		return accountNum;
	}

	public void setOffsetAccountNum(String aValue){
		offsetAccountNum = aValue;
	}

	public String getOffsetAccountNum(){
		return offsetAccountNum;
	}

	public void setAccountDimension1(String aValue){
		accountDimension1 = aValue;
	}

	public String getAccountDimension1(){
		return accountDimension1;
	}

	public void setAccountDimension2(String aValue){
		accountDimension2 = aValue;
	}

	public String getAccountDimension2(){
		return accountDimension2;
	}

	public void setAccountDimension3(String aValue){
		accountDimension3 = aValue;
	}

	public String getAccountDimension3(){
		return accountDimension3;
	}

	public void setAccountDimension4(String aValue){
		accountDimension4 = aValue;
	}

	public String getAccountDimension4(){
		return accountDimension4;
	}

	public void setAccountDimension5(String aValue){
		accountDimension5 = aValue;
	}

	public String getAccountDimension5(){
		return accountDimension5;
	}

	public void setAccountDimension6(String aValue){
		accountDimension6 = aValue;
	}

	public String getAccountDimension6(){
		return accountDimension6;
	}

	public void setAccountDimension7(String aValue){
		accountDimension7 = aValue;
	}

	public String getAccountDimension7(){
		return accountDimension7;
	}

	public void setAccountDimension8(String aValue){
		accountDimension8 = aValue;
	}

	public String getAccountDimension8(){
		return accountDimension8;
	}

	public void setAccountDimension9(String aValue){
		accountDimension9 = aValue;
	}

	public String getAccountDimension9(){
		return accountDimension9;
	}

	public void setAccountDimension10(String aValue){
		accountDimension10 = aValue;
	}

	public String getAccountDimension10(){
		return accountDimension10;
	}

	public void setAccountDimension11(String aValue){
		accountDimension11 = aValue;
	}

	public String getAccountDimension11(){
		return accountDimension11;
	}

	public void setAccountDimension12(String aValue){
		accountDimension12 = aValue;
	}

	public String getAccountDimension12(){
		return accountDimension12;
	}

	public void setAccountDimension13(String aValue){
		accountDimension13 = aValue;
	}

	public String getAccountDimension13(){
		return accountDimension13;
	}

	public void setCorAccountDimension1(String aValue){
		corAccountDimension1 = aValue;
	}

	public String getCorAccountDimension1(){
		return corAccountDimension1;
	}

	public void setCorAccountDimension2(String aValue){
		corAccountDimension2 = aValue;
	}

	public String getCorAccountDimension2(){
		return corAccountDimension2;
	}

	public void setCorAccountDimension3(String aValue){
		corAccountDimension3 = aValue;
	}

	public String getCorAccountDimension3(){
		return corAccountDimension3;
	}

	public void setCorAccountDimension4(String aValue){
		corAccountDimension4 = aValue;
	}

	public String getCorAccountDimension4(){
		return corAccountDimension4;
	}

	public void setCorAccountDimension5(String aValue){
		corAccountDimension5 = aValue;
	}

	public String getCorAccountDimension5(){
		return corAccountDimension5;
	}

	public void setCorAccountDimension6(String aValue){
		corAccountDimension6 = aValue;
	}

	public String getCorAccountDimension6(){
		return corAccountDimension6;
	}

	public void setCorAccountDimension7(String aValue){
		corAccountDimension7 = aValue;
	}

	public String getCorAccountDimension7(){
		return corAccountDimension7;
	}

	public void setCorAccountDimension8(String aValue){
		corAccountDimension8 = aValue;
	}

	public String getCorAccountDimension8(){
		return corAccountDimension8;
	}

	public void setCorAccountDimension9(String aValue){
		corAccountDimension9 = aValue;
	}

	public String getCorAccountDimension9(){
		return corAccountDimension9;
	}

	public void setCorAccountDimension10(String aValue){
		corAccountDimension10 = aValue;
	}

	public String getCorAccountDimension10(){
		return corAccountDimension10;
	}

	public void setCorAccountDimension11(String aValue){
		corAccountDimension11 = aValue;
	}

	public String getCorAccountDimension11(){
		return corAccountDimension11;
	}

	public void setCorAccountDimension12(String aValue){
		corAccountDimension12 = aValue;
	}

	public String getCorAccountDimension12(){
		return corAccountDimension12;
	}

	public void setCorAccountDimension13(String aValue){
		corAccountDimension13 = aValue;
	}

	public String getCorAccountDimension13(){
		return corAccountDimension13;
	}

	public void setLedgerTxt(String aValue){
		ledgerTxt = aValue;
	}

	public String getLedgerTxt(){
		return ledgerTxt;
	}

	public void setVoucher(String aValue){
		voucher = aValue;
	}

	public String getVoucher(){
		return voucher;
	}

	public void setStatus(int aValue){
		status = aValue;
	}

	public int getStatus(){
		return status;
	}

	public void setErrorStr(String aValue){
		errorStr = aValue;
	}

	public String getErrorStr(){
		return errorStr;
	}


	public void setFKTrans2AXTransCode(int aValue){
		FKTrans2AXTransCode = aValue;
	}
	public int getFKTrans2AXTransCode(){
		return FKTrans2AXTransCode;
	}

	public void setFKTrans2AXTransMonthGen(int aValue){
		FKTrans2AXTransMonthGen = aValue;
	}
	public int getFKTrans2AXTransMonthGen(){
		return FKTrans2AXTransMonthGen;
	}

	public void setFKTrans2AXTransYearGen(int aValue){
		FKTrans2AXTransYearGen = aValue;
	}
	public int getFKTrans2AXTransYearGen(){
		return FKTrans2AXTransYearGen;
	}

	public void setFKTrans2AXTransTaskOwner(String aValue){
		FKTrans2AXTransTaskOwner = aValue;
	}
	public String getFKTrans2AXTransTaskOwner(){
		return FKTrans2AXTransTaskOwner;
	}



}