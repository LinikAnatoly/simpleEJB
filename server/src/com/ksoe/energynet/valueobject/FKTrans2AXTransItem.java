
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FKTrans2AXTransItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.FKTrans2AXTransRef;

public class FKTrans2AXTransItem implements Serializable {
	
	public static final int STATUS_NEW = 1;
	public static final int STATUS_PREPARED = 2;
	public static final int STATUS_MOVED = 2;

    public int  code = Integer.MIN_VALUE; 
    public String  numUnFKStr; 
    public int  partId = Integer.MIN_VALUE; 
    public int  isPrihod = Integer.MIN_VALUE; 
    public Date transDate ;
    public String  balCeh; 
    public String  balSch; 
    public String  balKau; 
    public String  korCeh; 
    public String  korSch; 
    public String  korKau; 
    public BigDecimal  amountCur; 
    public String  currency; 
    public BigDecimal  amountMST; 
    public String  accountNum; 
    public String  offsetAccountNum; 
    public String  accountDimension1; 
    public String  accountDimension2; 
    public String  accountDimension3; 
    public String  accountDimension4; 
    public String  accountDimension5; 
    public String  accountDimension6; 
    public String  accountDimension7; 
    public String  accountDimension8; 
    public String  accountDimension9; 
    public String  accountDimension10; 
    public String  accountDimension11; 
    public String  accountDimension12; 
    public String  accountDimension13; 
    public String  corAccountDimension1; 
    public String  corAccountDimension2; 
    public String  corAccountDimension3; 
    public String  corAccountDimension4; 
    public String  corAccountDimension5; 
    public String  corAccountDimension6; 
    public String  corAccountDimension7; 
    public String  corAccountDimension8; 
    public String  corAccountDimension9; 
    public String  corAccountDimension10; 
    public String  corAccountDimension11; 
    public String  corAccountDimension12; 
    public String  corAccountDimension13; 
    public String  ledgerTxt; 
    public String  voucher; 
    public int  status = Integer.MIN_VALUE; 
    public String  errorStr; 
    public FKTrans2AXTransRef FKTrans2AXTrans = new FKTrans2AXTransRef();
    public static final String tableName = "FKTRANS2AXTRANSITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FKTRANS2AXTRANSITEM.CODE";
    public static final String numUnFKStr_Attr = "numUnFKStr";
    public static final String numUnFKStr_Field = "NUMUNFKSTR";
    public static final String numUnFKStr_QFielld = "FKTRANS2AXTRANSITEM.NUMUNFKSTR";
    public static final String partId_Attr = "partId";
    public static final String partId_Field = "PARTID";
    public static final String partId_QFielld = "FKTRANS2AXTRANSITEM.PARTID";
    public static final String isPrihod_Attr = "isPrihod";
    public static final String isPrihod_Field = "ISPRIHOD";
    public static final String isPrihod_QFielld = "FKTRANS2AXTRANSITEM.ISPRIHOD";
    public static final String transDate_Attr = "transDate";
    public static final String transDate_Field = "TRANSDATE";
    public static final String transDate_QFielld = "FKTRANS2AXTRANSITEM.TRANSDATE";
    public static final String balCeh_Attr = "balCeh";
    public static final String balCeh_Field = "BALCEH";
    public static final String balCeh_QFielld = "FKTRANS2AXTRANSITEM.BALCEH";
    public static final String balSch_Attr = "balSch";
    public static final String balSch_Field = "BALSCH";
    public static final String balSch_QFielld = "FKTRANS2AXTRANSITEM.BALSCH";
    public static final String balKau_Attr = "balKau";
    public static final String balKau_Field = "BALKAU";
    public static final String balKau_QFielld = "FKTRANS2AXTRANSITEM.BALKAU";
    public static final String korCeh_Attr = "korCeh";
    public static final String korCeh_Field = "KORCEH";
    public static final String korCeh_QFielld = "FKTRANS2AXTRANSITEM.KORCEH";
    public static final String korSch_Attr = "korSch";
    public static final String korSch_Field = "KORSCH";
    public static final String korSch_QFielld = "FKTRANS2AXTRANSITEM.KORSCH";
    public static final String korKau_Attr = "korKau";
    public static final String korKau_Field = "KORKAU";
    public static final String korKau_QFielld = "FKTRANS2AXTRANSITEM.KORKAU";
    public static final String amountCur_Attr = "amountCur";
    public static final String amountCur_Field = "AMOUNTCUR";
    public static final String amountCur_QFielld = "FKTRANS2AXTRANSITEM.AMOUNTCUR";
    public static final String currency_Attr = "currency";
    public static final String currency_Field = "CURRENCY";
    public static final String currency_QFielld = "FKTRANS2AXTRANSITEM.CURRENCY";
    public static final String amountMST_Attr = "amountMST";
    public static final String amountMST_Field = "AMOUNTMST";
    public static final String amountMST_QFielld = "FKTRANS2AXTRANSITEM.AMOUNTMST";
    public static final String accountNum_Attr = "accountNum";
    public static final String accountNum_Field = "ACCOUNTNUM";
    public static final String accountNum_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTNUM";
    public static final String offsetAccountNum_Attr = "offsetAccountNum";
    public static final String offsetAccountNum_Field = "OFFSETACCOUNTNUM";
    public static final String offsetAccountNum_QFielld = "FKTRANS2AXTRANSITEM.OFFSETACCOUNTNUM";
    public static final String accountDimension1_Attr = "accountDimension1";
    public static final String accountDimension1_Field = "ACCOUNTDIMENSION1";
    public static final String accountDimension1_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION1";
    public static final String accountDimension2_Attr = "accountDimension2";
    public static final String accountDimension2_Field = "ACCOUNTDIMENSION2";
    public static final String accountDimension2_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION2";
    public static final String accountDimension3_Attr = "accountDimension3";
    public static final String accountDimension3_Field = "ACCOUNTDIMENSION3";
    public static final String accountDimension3_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION3";
    public static final String accountDimension4_Attr = "accountDimension4";
    public static final String accountDimension4_Field = "ACCOUNTDIMENSION4";
    public static final String accountDimension4_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION4";
    public static final String accountDimension5_Attr = "accountDimension5";
    public static final String accountDimension5_Field = "ACCOUNTDIMENSION5";
    public static final String accountDimension5_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION5";
    public static final String accountDimension6_Attr = "accountDimension6";
    public static final String accountDimension6_Field = "ACCOUNTDIMENSION6";
    public static final String accountDimension6_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION6";
    public static final String accountDimension7_Attr = "accountDimension7";
    public static final String accountDimension7_Field = "ACCOUNTDIMENSION7";
    public static final String accountDimension7_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION7";
    public static final String accountDimension8_Attr = "accountDimension8";
    public static final String accountDimension8_Field = "ACCOUNTDIMENSION8";
    public static final String accountDimension8_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION8";
    public static final String accountDimension9_Attr = "accountDimension9";
    public static final String accountDimension9_Field = "ACCOUNTDIMENSION9";
    public static final String accountDimension9_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION9";
    public static final String accountDimension10_Attr = "accountDimension10";
    public static final String accountDimension10_Field = "ACCOUNTDIMENSION10";
    public static final String accountDimension10_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION10";
    public static final String accountDimension11_Attr = "accountDimension11";
    public static final String accountDimension11_Field = "ACCOUNTDIMENSION11";
    public static final String accountDimension11_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION11";
    public static final String accountDimension12_Attr = "accountDimension12";
    public static final String accountDimension12_Field = "ACCOUNTDIMENSION12";
    public static final String accountDimension12_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION12";
    public static final String accountDimension13_Attr = "accountDimension13";
    public static final String accountDimension13_Field = "ACCOUNTDIMENSION13";
    public static final String accountDimension13_QFielld = "FKTRANS2AXTRANSITEM.ACCOUNTDIMENSION13";
    public static final String corAccountDimension1_Attr = "corAccountDimension1";
    public static final String corAccountDimension1_Field = "CORACCOUNTDIMENSION1";
    public static final String corAccountDimension1_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION1";
    public static final String corAccountDimension2_Attr = "corAccountDimension2";
    public static final String corAccountDimension2_Field = "CORACCOUNTDIMENSION2";
    public static final String corAccountDimension2_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION2";
    public static final String corAccountDimension3_Attr = "corAccountDimension3";
    public static final String corAccountDimension3_Field = "CORACCOUNTDIMENSION3";
    public static final String corAccountDimension3_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION3";
    public static final String corAccountDimension4_Attr = "corAccountDimension4";
    public static final String corAccountDimension4_Field = "CORACCOUNTDIMENSION4";
    public static final String corAccountDimension4_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION4";
    public static final String corAccountDimension5_Attr = "corAccountDimension5";
    public static final String corAccountDimension5_Field = "CORACCOUNTDIMENSION5";
    public static final String corAccountDimension5_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION5";
    public static final String corAccountDimension6_Attr = "corAccountDimension6";
    public static final String corAccountDimension6_Field = "CORACCOUNTDIMENSION6";
    public static final String corAccountDimension6_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION6";
    public static final String corAccountDimension7_Attr = "corAccountDimension7";
    public static final String corAccountDimension7_Field = "CORACCOUNTDIMENSION7";
    public static final String corAccountDimension7_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION7";
    public static final String corAccountDimension8_Attr = "corAccountDimension8";
    public static final String corAccountDimension8_Field = "CORACCOUNTDIMENSION8";
    public static final String corAccountDimension8_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION8";
    public static final String corAccountDimension9_Attr = "corAccountDimension9";
    public static final String corAccountDimension9_Field = "CORACCOUNTDIMENSION9";
    public static final String corAccountDimension9_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION9";
    public static final String corAccountDimension10_Attr = "corAccountDimension10";
    public static final String corAccountDimension10_Field = "CORACCOUNTDIMENSION10";
    public static final String corAccountDimension10_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION10";
    public static final String corAccountDimension11_Attr = "corAccountDimension11";
    public static final String corAccountDimension11_Field = "CORACCOUNTDIMENSION11";
    public static final String corAccountDimension11_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION11";
    public static final String corAccountDimension12_Attr = "corAccountDimension12";
    public static final String corAccountDimension12_Field = "CORACCOUNTDIMENSION12";
    public static final String corAccountDimension12_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION12";
    public static final String corAccountDimension13_Attr = "corAccountDimension13";
    public static final String corAccountDimension13_Field = "CORACCOUNTDIMENSION13";
    public static final String corAccountDimension13_QFielld = "FKTRANS2AXTRANSITEM.CORACCOUNTDIMENSION13";
    public static final String ledgerTxt_Attr = "ledgerTxt";
    public static final String ledgerTxt_Field = "LEDGERTXT";
    public static final String ledgerTxt_QFielld = "FKTRANS2AXTRANSITEM.LEDGERTXT";
    public static final String voucher_Attr = "voucher";
    public static final String voucher_Field = "VOUCHER";
    public static final String voucher_QFielld = "FKTRANS2AXTRANSITEM.VOUCHER";
    public static final String status_Attr = "status";
    public static final String status_Field = "STATUS";
    public static final String status_QFielld = "FKTRANS2AXTRANSITEM.STATUS";
    public static final String errorStr_Attr = "errorStr";
    public static final String errorStr_Field = "ERRORSTR";
    public static final String errorStr_QFielld = "FKTRANS2AXTRANSITEM.ERRORSTR";
    public static final String FKTrans2AXTrans_Attr = "FKTrans2AXTrans";
    public static final String FKTrans2AXTrans_Field = "FKTRANS2AXTRANSCODE";
    public static final String  FKTrans2AXTrans_QFielld = "FKTRANS2AXTRANSITEM.FKTRANS2AXTRANSCODE";



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

    public void setFKTrans2AXTrans(FKTrans2AXTransRef aValue){
       FKTrans2AXTrans = aValue;
    }

    public FKTrans2AXTransRef getFKTrans2AXTrans(){
       return FKTrans2AXTrans;
    }

} // end of FKTrans2AXTransItemValueObject

