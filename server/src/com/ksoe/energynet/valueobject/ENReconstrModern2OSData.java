
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENReconstrModern2OSData;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENReconstrModernOZRef;

public class ENReconstrModern2OSData implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  num_un = Integer.MIN_VALUE; 
    public int  num_dovvod = Integer.MIN_VALUE; 
    public Date date_dovvod ;
    public String  kod_inv; 
    public String  kod_ist; 
    public String  name_ist; 
    public BigDecimal  sum_dovvod_n; 
    public BigDecimal  sum_dovvod_b; 
    public BigDecimal  sum_nds; 
    public BigDecimal  sum_dovvod_nds_b; 
    public BigDecimal  sum_dovvod_izn_n; 
    public BigDecimal  sum_dovvod_izn_b; 
    public String  name_dovvod; 
    public String  userGen; 
    public Date dateEdit ;
    public String  kod_nakl; 
    public Date dt_nakl ;
    public String  kod_nal_nakl; 
    public String  kod_postav; 
    public String  kod_dogovor; 
    public Date dateBuh ;
    public long  modify_time = Long.MIN_VALUE;
    public ENReconstrModernOZRef ENReconstrModernOZRef = new ENReconstrModernOZRef();
    public static final String tableName = "ENRECONSTRMODERN2OSDAT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENRECONSTRMODERN2OSDAT.CODE";
    public static final String num_un_Attr = "num_un";
    public static final String num_un_Field = "NUM_UN";
    public static final String num_un_QFielld = "ENRECONSTRMODERN2OSDAT.NUM_UN";
    public static final String num_dovvod_Attr = "num_dovvod";
    public static final String num_dovvod_Field = "NUM_DOVVOD";
    public static final String num_dovvod_QFielld = "ENRECONSTRMODERN2OSDAT.NUM_DOVVOD";
    public static final String date_dovvod_Attr = "date_dovvod";
    public static final String date_dovvod_Field = "DATE_DOVVOD";
    public static final String date_dovvod_QFielld = "ENRECONSTRMODERN2OSDAT.DATE_DOVVOD";
    public static final String kod_inv_Attr = "kod_inv";
    public static final String kod_inv_Field = "KOD_INV";
    public static final String kod_inv_QFielld = "ENRECONSTRMODERN2OSDAT.KOD_INV";
    public static final String kod_ist_Attr = "kod_ist";
    public static final String kod_ist_Field = "KOD_IST";
    public static final String kod_ist_QFielld = "ENRECONSTRMODERN2OSDAT.KOD_IST";
    public static final String name_ist_Attr = "name_ist";
    public static final String name_ist_Field = "NAME_IST";
    public static final String name_ist_QFielld = "ENRECONSTRMODERN2OSDAT.NAME_IST";
    public static final String sum_dovvod_n_Attr = "sum_dovvod_n";
    public static final String sum_dovvod_n_Field = "SUM_DOVVOD_N";
    public static final String sum_dovvod_n_QFielld = "ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_N";
    public static final String sum_dovvod_b_Attr = "sum_dovvod_b";
    public static final String sum_dovvod_b_Field = "SUM_DOVVOD_B";
    public static final String sum_dovvod_b_QFielld = "ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_B";
    public static final String sum_nds_Attr = "sum_nds";
    public static final String sum_nds_Field = "SUM_NDS";
    public static final String sum_nds_QFielld = "ENRECONSTRMODERN2OSDAT.SUM_NDS";
    public static final String sum_dovvod_nds_b_Attr = "sum_dovvod_nds_b";
    public static final String sum_dovvod_nds_b_Field = "SUM_DOVVOD_NDS_B";
    public static final String sum_dovvod_nds_b_QFielld = "ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_NDS_B";
    public static final String sum_dovvod_izn_n_Attr = "sum_dovvod_izn_n";
    public static final String sum_dovvod_izn_n_Field = "SUM_DOVVOD_IZN_N";
    public static final String sum_dovvod_izn_n_QFielld = "ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_N";
    public static final String sum_dovvod_izn_b_Attr = "sum_dovvod_izn_b";
    public static final String sum_dovvod_izn_b_Field = "SUM_DOVVOD_IZN_B";
    public static final String sum_dovvod_izn_b_QFielld = "ENRECONSTRMODERN2OSDAT.SUM_DOVVOD_IZN_B";
    public static final String name_dovvod_Attr = "name_dovvod";
    public static final String name_dovvod_Field = "NAME_DOVVOD";
    public static final String name_dovvod_QFielld = "ENRECONSTRMODERN2OSDAT.NAME_DOVVOD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENRECONSTRMODERN2OSDAT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENRECONSTRMODERN2OSDAT.DATEEDIT";
    public static final String kod_nakl_Attr = "kod_nakl";
    public static final String kod_nakl_Field = "KOD_NAKL";
    public static final String kod_nakl_QFielld = "ENRECONSTRMODERN2OSDAT.KOD_NAKL";
    public static final String dt_nakl_Attr = "dt_nakl";
    public static final String dt_nakl_Field = "DT_NAKL";
    public static final String dt_nakl_QFielld = "ENRECONSTRMODERN2OSDAT.DT_NAKL";
    public static final String kod_nal_nakl_Attr = "kod_nal_nakl";
    public static final String kod_nal_nakl_Field = "KOD_NAL_NAKL";
    public static final String kod_nal_nakl_QFielld = "ENRECONSTRMODERN2OSDAT.KOD_NAL_NAKL";
    public static final String kod_postav_Attr = "kod_postav";
    public static final String kod_postav_Field = "KOD_POSTAV";
    public static final String kod_postav_QFielld = "ENRECONSTRMODERN2OSDAT.KOD_POSTAV";
    public static final String kod_dogovor_Attr = "kod_dogovor";
    public static final String kod_dogovor_Field = "KOD_DOGOVOR";
    public static final String kod_dogovor_QFielld = "ENRECONSTRMODERN2OSDAT.KOD_DOGOVOR";
    public static final String dateBuh_Attr = "dateBuh";
    public static final String dateBuh_Field = "DATEBUH";
    public static final String dateBuh_QFielld = "ENRECONSTRMODERN2OSDAT.DATEBUH";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENRECONSTRMODERN2OSDAT.MODIFY_TIME";
    public static final String ENReconstrModernOZRef_Attr = "ENReconstrModernOZRef";
    public static final String ENReconstrModernOZRef_Field = "ENRECONSTRMODERNOZRFCD";
    public static final String  ENReconstrModernOZRef_QFielld = "ENRECONSTRMODERN2OSDAT.ENRECONSTRMODERNOZRFCD";


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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setENReconstrModernOZRef(ENReconstrModernOZRef aValue){
       ENReconstrModernOZRef = aValue;
    }

    public ENReconstrModernOZRef getENReconstrModernOZRef(){
       return ENReconstrModernOZRef;
    }

} // end of ENReconstrModern2OSDataValueObject

