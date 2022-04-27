
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENReconstrModern2OSData;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENReconstrModern2OSDataShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int num_un = Integer.MIN_VALUE;
    public int num_dovvod = Integer.MIN_VALUE;
    public Date date_dovvod ;
    public String kod_inv;
    public String kod_ist;
    public String name_ist;
    public BigDecimal sum_dovvod_n;
    public BigDecimal sum_dovvod_b;
    public BigDecimal sum_nds;
    public BigDecimal sum_dovvod_nds_b;
    public BigDecimal sum_dovvod_izn_n;
    public BigDecimal sum_dovvod_izn_b;
    public String name_dovvod;
    public String userGen;
    public Date dateEdit ;
    public String kod_nakl;
    public Date dt_nakl ;
    public String kod_nal_nakl;
    public String kod_postav;
    public String kod_dogovor;
    public Date dateBuh ;
    public int ENReconstrModernOZRefCode = Integer.MIN_VALUE;
    public String ENReconstrModernOZRefNumbergen;
    public Date ENReconstrModernOZRefDateGen;
    public Date ENReconstrModernOZRefDateEdit;
    public BigDecimal ENReconstrModernOZRefSummaGen;
    public String ENReconstrModernOZRefCharacteristic;
    public String ENReconstrModernOZRefExecutedPosition;
    public String ENReconstrModernOZRefExecutedName;
    public String ENReconstrModernOZRefAcceptedPosition;
    public String ENReconstrModernOZRefAcceptedName;
    public BigDecimal ENReconstrModernOZRefContractPrice;
    public String ENReconstrModernOZRefCodeMol;
    public String ENReconstrModernOZRefCodePodr;
    public String ENReconstrModernOZRefInvNumberOZ;
    public String ENReconstrModernOZRefNameOZ;
    public String ENReconstrModernOZRefFinContractNumber;
    public Date ENReconstrModernOZRefFinContractDate;
    public String ENReconstrModernOZRefPartnerName;
    public String ENReconstrModernOZRefPartnerCode;
    public String ENReconstrModernOZRefUserGen;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setNum_un(int aValue){
       num_un = aValue;
    }

    public int getNum_un(){
       return num_un;
    }
    public void setNum_dovvod(int aValue){
       num_dovvod = aValue;
    }

    public int getNum_dovvod(){
       return num_dovvod;
    }

    public void setDate_dovvod(Date aValue){
       date_dovvod = aValue;
    }

    public Date getDate_dovvod(){
       return date_dovvod;
    }
    public void setKod_inv(String aValue){
       kod_inv = aValue;
    }

    public String getKod_inv(){
       return kod_inv;
    }
    public void setKod_ist(String aValue){
       kod_ist = aValue;
    }

    public String getKod_ist(){
       return kod_ist;
    }
    public void setName_ist(String aValue){
       name_ist = aValue;
    }

    public String getName_ist(){
       return name_ist;
    }
    public void setSum_dovvod_n(BigDecimal aValue){
       sum_dovvod_n = aValue;
    }

    public BigDecimal getSum_dovvod_n(){
       return sum_dovvod_n;
    }
    public void setSum_dovvod_b(BigDecimal aValue){
       sum_dovvod_b = aValue;
    }

    public BigDecimal getSum_dovvod_b(){
       return sum_dovvod_b;
    }
    public void setSum_nds(BigDecimal aValue){
       sum_nds = aValue;
    }

    public BigDecimal getSum_nds(){
       return sum_nds;
    }
    public void setSum_dovvod_nds_b(BigDecimal aValue){
       sum_dovvod_nds_b = aValue;
    }

    public BigDecimal getSum_dovvod_nds_b(){
       return sum_dovvod_nds_b;
    }
    public void setSum_dovvod_izn_n(BigDecimal aValue){
       sum_dovvod_izn_n = aValue;
    }

    public BigDecimal getSum_dovvod_izn_n(){
       return sum_dovvod_izn_n;
    }
    public void setSum_dovvod_izn_b(BigDecimal aValue){
       sum_dovvod_izn_b = aValue;
    }

    public BigDecimal getSum_dovvod_izn_b(){
       return sum_dovvod_izn_b;
    }
    public void setName_dovvod(String aValue){
       name_dovvod = aValue;
    }

    public String getName_dovvod(){
       return name_dovvod;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }
    public void setKod_nakl(String aValue){
       kod_nakl = aValue;
    }

    public String getKod_nakl(){
       return kod_nakl;
    }

    public void setDt_nakl(Date aValue){
       dt_nakl = aValue;
    }

    public Date getDt_nakl(){
       return dt_nakl;
    }
    public void setKod_nal_nakl(String aValue){
       kod_nal_nakl = aValue;
    }

    public String getKod_nal_nakl(){
       return kod_nal_nakl;
    }
    public void setKod_postav(String aValue){
       kod_postav = aValue;
    }

    public String getKod_postav(){
       return kod_postav;
    }
    public void setKod_dogovor(String aValue){
       kod_dogovor = aValue;
    }

    public String getKod_dogovor(){
       return kod_dogovor;
    }

    public void setDateBuh(Date aValue){
       dateBuh = aValue;
    }

    public Date getDateBuh(){
       return dateBuh;
    }


    public void setENReconstrModernOZRefCode(int aValue){
       ENReconstrModernOZRefCode = aValue;
    }
    public int getENReconstrModernOZRefCode(){
       return ENReconstrModernOZRefCode;
    }

    public void setENReconstrModernOZRefNumbergen(String aValue){
       ENReconstrModernOZRefNumbergen = aValue;
    }
    public String getENReconstrModernOZRefNumbergen(){
       return ENReconstrModernOZRefNumbergen;
    }


    public void setENReconstrModernOZRefDateGen(Date aValue){
       ENReconstrModernOZRefDateGen = aValue;
    }
    public Date getENReconstrModernOZRefDateGen(){
       return ENReconstrModernOZRefDateGen;
    }


    public void setENReconstrModernOZRefDateEdit(Date aValue){
       ENReconstrModernOZRefDateEdit = aValue;
    }
    public Date getENReconstrModernOZRefDateEdit(){
       return ENReconstrModernOZRefDateEdit;
    }

    public void setENReconstrModernOZRefSummaGen(BigDecimal aValue){
       ENReconstrModernOZRefSummaGen = aValue;
    }
    public BigDecimal getENReconstrModernOZRefSummaGen(){
       return ENReconstrModernOZRefSummaGen;
    }

    public void setENReconstrModernOZRefCharacteristic(String aValue){
       ENReconstrModernOZRefCharacteristic = aValue;
    }
    public String getENReconstrModernOZRefCharacteristic(){
       return ENReconstrModernOZRefCharacteristic;
    }

    public void setENReconstrModernOZRefExecutedPosition(String aValue){
       ENReconstrModernOZRefExecutedPosition = aValue;
    }
    public String getENReconstrModernOZRefExecutedPosition(){
       return ENReconstrModernOZRefExecutedPosition;
    }

    public void setENReconstrModernOZRefExecutedName(String aValue){
       ENReconstrModernOZRefExecutedName = aValue;
    }
    public String getENReconstrModernOZRefExecutedName(){
       return ENReconstrModernOZRefExecutedName;
    }

    public void setENReconstrModernOZRefAcceptedPosition(String aValue){
       ENReconstrModernOZRefAcceptedPosition = aValue;
    }
    public String getENReconstrModernOZRefAcceptedPosition(){
       return ENReconstrModernOZRefAcceptedPosition;
    }

    public void setENReconstrModernOZRefAcceptedName(String aValue){
       ENReconstrModernOZRefAcceptedName = aValue;
    }
    public String getENReconstrModernOZRefAcceptedName(){
       return ENReconstrModernOZRefAcceptedName;
    }

    public void setENReconstrModernOZRefContractPrice(BigDecimal aValue){
       ENReconstrModernOZRefContractPrice = aValue;
    }
    public BigDecimal getENReconstrModernOZRefContractPrice(){
       return ENReconstrModernOZRefContractPrice;
    }

    public void setENReconstrModernOZRefCodeMol(String aValue){
       ENReconstrModernOZRefCodeMol = aValue;
    }
    public String getENReconstrModernOZRefCodeMol(){
       return ENReconstrModernOZRefCodeMol;
    }

    public void setENReconstrModernOZRefCodePodr(String aValue){
       ENReconstrModernOZRefCodePodr = aValue;
    }
    public String getENReconstrModernOZRefCodePodr(){
       return ENReconstrModernOZRefCodePodr;
    }

    public void setENReconstrModernOZRefInvNumberOZ(String aValue){
       ENReconstrModernOZRefInvNumberOZ = aValue;
    }
    public String getENReconstrModernOZRefInvNumberOZ(){
       return ENReconstrModernOZRefInvNumberOZ;
    }

    public void setENReconstrModernOZRefNameOZ(String aValue){
       ENReconstrModernOZRefNameOZ = aValue;
    }
    public String getENReconstrModernOZRefNameOZ(){
       return ENReconstrModernOZRefNameOZ;
    }

    public void setENReconstrModernOZRefFinContractNumber(String aValue){
       ENReconstrModernOZRefFinContractNumber = aValue;
    }
    public String getENReconstrModernOZRefFinContractNumber(){
       return ENReconstrModernOZRefFinContractNumber;
    }


    public void setENReconstrModernOZRefFinContractDate(Date aValue){
       ENReconstrModernOZRefFinContractDate = aValue;
    }
    public Date getENReconstrModernOZRefFinContractDate(){
       return ENReconstrModernOZRefFinContractDate;
    }

    public void setENReconstrModernOZRefPartnerName(String aValue){
       ENReconstrModernOZRefPartnerName = aValue;
    }
    public String getENReconstrModernOZRefPartnerName(){
       return ENReconstrModernOZRefPartnerName;
    }

    public void setENReconstrModernOZRefPartnerCode(String aValue){
       ENReconstrModernOZRefPartnerCode = aValue;
    }
    public String getENReconstrModernOZRefPartnerCode(){
       return ENReconstrModernOZRefPartnerCode;
    }

    public void setENReconstrModernOZRefUserGen(String aValue){
       ENReconstrModernOZRefUserGen = aValue;
    }
    public String getENReconstrModernOZRefUserGen(){
       return ENReconstrModernOZRefUserGen;
    }



}