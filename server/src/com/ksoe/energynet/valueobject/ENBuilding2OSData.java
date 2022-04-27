
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBuilding2OSData;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENBuildingRef;

public class ENBuilding2OSData implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  num_un = Integer.MIN_VALUE;
    public String  kod_inv; 
    public String  kod_nal_nakl; 
    public String  kod_ist; 
    public String  name_ist; 
    public String  kod_subsch; 
    public String  name_subsch; 
    public String  kod_vid; 
    public String  name_vid; 
    public String  kod_privat; 
    public String  name_privat; 
    public String  kod_gr; 
    public String  name_gr; 
    public int  num_klass = Integer.MIN_VALUE;
    public String  name_klass; 
    public String  f_amort; 
    public Date dt_vypusk;
    public BigDecimal  sum_izn_perv; 
    public BigDecimal  sum_izn_perv_n; 
    public BigDecimal  sum_st_perv_n; 
    public String  kod_zatr; 
    public String  kod_oborud; 
    public String  primechan; 
    public String  characters; 
    public int  id_amort = Integer.MIN_VALUE;
    public String  kod_amort; 
    public String  name_amort; 
    public int  kod_am = Integer.MIN_VALUE;
    public String  name_am; 
    public int  kod_am_n = Integer.MIN_VALUE;
    public String  name_am_n; 
    public int  use_limit = Integer.MIN_VALUE;
    public int  use_limit_n = Integer.MIN_VALUE;
    public String  primechan_vyb; 
    public String  kod_prizn; 
    public Date datePosting;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;

    public ENBuildingRef ENBuildingRef = new ENBuildingRef();

    public static final String tableName = "ENBUILDING2OSDATA";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUILDING2OSDATA.CODE";
    public static final String num_un_Attr = "num_un";
    public static final String num_un_Field = "NUM_UN";
    public static final String num_un_QFielld = "ENBUILDING2OSDATA.NUM_UN";
    public static final String kod_inv_Attr = "kod_inv";
    public static final String kod_inv_Field = "KOD_INV";
    public static final String kod_inv_QFielld = "ENBUILDING2OSDATA.KOD_INV";
    public static final String kod_nal_nakl_Attr = "kod_nal_nakl";
    public static final String kod_nal_nakl_Field = "KOD_NAL_NAKL";
    public static final String kod_nal_nakl_QFielld = "ENBUILDING2OSDATA.KOD_NAL_NAKL";
    public static final String kod_ist_Attr = "kod_ist";
    public static final String kod_ist_Field = "KOD_IST";
    public static final String kod_ist_QFielld = "ENBUILDING2OSDATA.KOD_IST";
    public static final String name_ist_Attr = "name_ist";
    public static final String name_ist_Field = "NAME_IST";
    public static final String name_ist_QFielld = "ENBUILDING2OSDATA.NAME_IST";
    public static final String kod_subsch_Attr = "kod_subsch";
    public static final String kod_subsch_Field = "KOD_SUBSCH";
    public static final String kod_subsch_QFielld = "ENBUILDING2OSDATA.KOD_SUBSCH";
    public static final String name_subsch_Attr = "name_subsch";
    public static final String name_subsch_Field = "NAME_SUBSCH";
    public static final String name_subsch_QFielld = "ENBUILDING2OSDATA.NAME_SUBSCH";
    public static final String kod_vid_Attr = "kod_vid";
    public static final String kod_vid_Field = "KOD_VID";
    public static final String kod_vid_QFielld = "ENBUILDING2OSDATA.KOD_VID";
    public static final String name_vid_Attr = "name_vid";
    public static final String name_vid_Field = "NAME_VID";
    public static final String name_vid_QFielld = "ENBUILDING2OSDATA.NAME_VID";
    public static final String kod_privat_Attr = "kod_privat";
    public static final String kod_privat_Field = "KOD_PRIVAT";
    public static final String kod_privat_QFielld = "ENBUILDING2OSDATA.KOD_PRIVAT";
    public static final String name_privat_Attr = "name_privat";
    public static final String name_privat_Field = "NAME_PRIVAT";
    public static final String name_privat_QFielld = "ENBUILDING2OSDATA.NAME_PRIVAT";
    public static final String kod_gr_Attr = "kod_gr";
    public static final String kod_gr_Field = "KOD_GR";
    public static final String kod_gr_QFielld = "ENBUILDING2OSDATA.KOD_GR";
    public static final String name_gr_Attr = "name_gr";
    public static final String name_gr_Field = "NAME_GR";
    public static final String name_gr_QFielld = "ENBUILDING2OSDATA.NAME_GR";
    public static final String num_klass_Attr = "num_klass";
    public static final String num_klass_Field = "NUM_KLASS";
    public static final String num_klass_QFielld = "ENBUILDING2OSDATA.NUM_KLASS";
    public static final String name_klass_Attr = "name_klass";
    public static final String name_klass_Field = "NAME_KLASS";
    public static final String name_klass_QFielld = "ENBUILDING2OSDATA.NAME_KLASS";
    public static final String f_amort_Attr = "f_amort";
    public static final String f_amort_Field = "F_AMORT";
    public static final String f_amort_QFielld = "ENBUILDING2OSDATA.F_AMORT";
    public static final String dt_vypusk_Attr = "dt_vypusk";
    public static final String dt_vypusk_Field = "DT_VYPUSK";
    public static final String dt_vypusk_QFielld = "ENBUILDING2OSDATA.DT_VYPUSK";
    public static final String sum_izn_perv_Attr = "sum_izn_perv";
    public static final String sum_izn_perv_Field = "SUM_IZN_PERV";
    public static final String sum_izn_perv_QFielld = "ENBUILDING2OSDATA.SUM_IZN_PERV";
    public static final String sum_izn_perv_n_Attr = "sum_izn_perv_n";
    public static final String sum_izn_perv_n_Field = "SUM_IZN_PERV_N";
    public static final String sum_izn_perv_n_QFielld = "ENBUILDING2OSDATA.SUM_IZN_PERV_N";
    public static final String sum_st_perv_n_Attr = "sum_st_perv_n";
    public static final String sum_st_perv_n_Field = "SUM_ST_PERV_N";
    public static final String sum_st_perv_n_QFielld = "ENBUILDING2OSDATA.SUM_ST_PERV_N";
    public static final String kod_zatr_Attr = "kod_zatr";
    public static final String kod_zatr_Field = "KOD_ZATR";
    public static final String kod_zatr_QFielld = "ENBUILDING2OSDATA.KOD_ZATR";
    public static final String kod_oborud_Attr = "kod_oborud";
    public static final String kod_oborud_Field = "KOD_OBORUD";
    public static final String kod_oborud_QFielld = "ENBUILDING2OSDATA.KOD_OBORUD";
    public static final String primechan_Attr = "primechan";
    public static final String primechan_Field = "PRIMECHAN";
    public static final String primechan_QFielld = "ENBUILDING2OSDATA.PRIMECHAN";
    public static final String characters_Attr = "characters";
    public static final String characters_Field = "CHARACTERS";
    public static final String characters_QFielld = "ENBUILDING2OSDATA.CHARACTERS";
    public static final String id_amort_Attr = "id_amort";
    public static final String id_amort_Field = "ID_AMORT";
    public static final String id_amort_QFielld = "ENBUILDING2OSDATA.ID_AMORT";
    public static final String kod_amort_Attr = "kod_amort";
    public static final String kod_amort_Field = "KOD_AMORT";
    public static final String kod_amort_QFielld = "ENBUILDING2OSDATA.KOD_AMORT";
    public static final String name_amort_Attr = "name_amort";
    public static final String name_amort_Field = "NAME_AMORT";
    public static final String name_amort_QFielld = "ENBUILDING2OSDATA.NAME_AMORT";
    public static final String kod_am_Attr = "kod_am";
    public static final String kod_am_Field = "KOD_AM";
    public static final String kod_am_QFielld = "ENBUILDING2OSDATA.KOD_AM";
    public static final String name_am_Attr = "name_am";
    public static final String name_am_Field = "NAME_AM";
    public static final String name_am_QFielld = "ENBUILDING2OSDATA.NAME_AM";
    public static final String kod_am_n_Attr = "kod_am_n";
    public static final String kod_am_n_Field = "KOD_AM_N";
    public static final String kod_am_n_QFielld = "ENBUILDING2OSDATA.KOD_AM_N";
    public static final String name_am_n_Attr = "name_am_n";
    public static final String name_am_n_Field = "NAME_AM_N";
    public static final String name_am_n_QFielld = "ENBUILDING2OSDATA.NAME_AM_N";
    public static final String use_limit_Attr = "use_limit";
    public static final String use_limit_Field = "USE_LIMIT";
    public static final String use_limit_QFielld = "ENBUILDING2OSDATA.USE_LIMIT";
    public static final String use_limit_n_Attr = "use_limit_n";
    public static final String use_limit_n_Field = "USE_LIMIT_N";
    public static final String use_limit_n_QFielld = "ENBUILDING2OSDATA.USE_LIMIT_N";
    public static final String primechan_vyb_Attr = "primechan_vyb";
    public static final String primechan_vyb_Field = "PRIMECHAN_VYB";
    public static final String primechan_vyb_QFielld = "ENBUILDING2OSDATA.PRIMECHAN_VYB";
    public static final String kod_prizn_Attr = "kod_prizn";
    public static final String kod_prizn_Field = "KOD_PRIZN";
    public static final String kod_prizn_QFielld = "ENBUILDING2OSDATA.KOD_PRIZN";
    public static final String datePosting_Attr = "datePosting";
    public static final String datePosting_Field = "DATEPOSTING";
    public static final String datePosting_QFielld = "ENBUILDING2OSDATA.DATEPOSTING";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENBUILDING2OSDATA.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENBUILDING2OSDATA.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENBUILDING2OSDATA.MODIFY_TIME";

    public static final String ENBuildingRef_Attr = "ENBuildingRef";
    public static final String ENBuildingRef_Field = "ENBUILDINGREFCODE";
    public static final String  ENBuildingRef_QFielld = "ENBUILDING2OSDATA.ENBUILDINGREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public int getNum_un(){
       return num_un;
    }
    
    public void setNum_un(int num_un){
       this.num_un = num_un;
    }


    public String getKod_inv(){
       return kod_inv;
    }
    
    public void setKod_inv(String kod_inv){
       this.kod_inv = kod_inv;
    }


    public String getKod_nal_nakl(){
       return kod_nal_nakl;
    }
    
    public void setKod_nal_nakl(String kod_nal_nakl){
       this.kod_nal_nakl = kod_nal_nakl;
    }


    public String getKod_ist(){
       return kod_ist;
    }
    
    public void setKod_ist(String kod_ist){
       this.kod_ist = kod_ist;
    }


    public String getName_ist(){
       return name_ist;
    }
    
    public void setName_ist(String name_ist){
       this.name_ist = name_ist;
    }


    public String getKod_subsch(){
       return kod_subsch;
    }
    
    public void setKod_subsch(String kod_subsch){
       this.kod_subsch = kod_subsch;
    }


    public String getName_subsch(){
       return name_subsch;
    }
    
    public void setName_subsch(String name_subsch){
       this.name_subsch = name_subsch;
    }


    public String getKod_vid(){
       return kod_vid;
    }
    
    public void setKod_vid(String kod_vid){
       this.kod_vid = kod_vid;
    }


    public String getName_vid(){
       return name_vid;
    }
    
    public void setName_vid(String name_vid){
       this.name_vid = name_vid;
    }


    public String getKod_privat(){
       return kod_privat;
    }
    
    public void setKod_privat(String kod_privat){
       this.kod_privat = kod_privat;
    }


    public String getName_privat(){
       return name_privat;
    }
    
    public void setName_privat(String name_privat){
       this.name_privat = name_privat;
    }


    public String getKod_gr(){
       return kod_gr;
    }
    
    public void setKod_gr(String kod_gr){
       this.kod_gr = kod_gr;
    }


    public String getName_gr(){
       return name_gr;
    }
    
    public void setName_gr(String name_gr){
       this.name_gr = name_gr;
    }


    public int getNum_klass(){
       return num_klass;
    }
    
    public void setNum_klass(int num_klass){
       this.num_klass = num_klass;
    }


    public String getName_klass(){
       return name_klass;
    }
    
    public void setName_klass(String name_klass){
       this.name_klass = name_klass;
    }


    public String getf_amort(){
       return f_amort;
    }
    
    public void setf_amort(String f_amort){
       this.f_amort = f_amort;
    }


    public Date getDt_vypusk(){
       return dt_vypusk;
    }

    public void setDt_vypusk(Date dt_vypusk){
       this.dt_vypusk = dt_vypusk;
    }


    public BigDecimal getSum_izn_perv(){
       return sum_izn_perv;
    }
    
    public void setSum_izn_perv(BigDecimal sum_izn_perv){
       this.sum_izn_perv = sum_izn_perv;
    }


    public BigDecimal getSum_izn_perv_n(){
       return sum_izn_perv_n;
    }
    
    public void setSum_izn_perv_n(BigDecimal sum_izn_perv_n){
       this.sum_izn_perv_n = sum_izn_perv_n;
    }


    public BigDecimal getSum_st_perv_n(){
       return sum_st_perv_n;
    }
    
    public void setSum_st_perv_n(BigDecimal sum_st_perv_n){
       this.sum_st_perv_n = sum_st_perv_n;
    }


    public String getKod_zatr(){
       return kod_zatr;
    }
    
    public void setKod_zatr(String kod_zatr){
       this.kod_zatr = kod_zatr;
    }


    public String getKod_oborud(){
       return kod_oborud;
    }
    
    public void setKod_oborud(String kod_oborud){
       this.kod_oborud = kod_oborud;
    }


    public String getPrimechan(){
       return primechan;
    }
    
    public void setPrimechan(String primechan){
       this.primechan = primechan;
    }


    public String getCharacters(){
       return characters;
    }
    
    public void setCharacters(String characters){
       this.characters = characters;
    }


    public int getId_amort(){
       return id_amort;
    }
    
    public void setId_amort(int id_amort){
       this.id_amort = id_amort;
    }


    public String getKod_amort(){
       return kod_amort;
    }
    
    public void setKod_amort(String kod_amort){
       this.kod_amort = kod_amort;
    }


    public String getName_amort(){
       return name_amort;
    }
    
    public void setName_amort(String name_amort){
       this.name_amort = name_amort;
    }


    public int getKod_am(){
       return kod_am;
    }
    
    public void setKod_am(int kod_am){
       this.kod_am = kod_am;
    }


    public String getName_am(){
       return name_am;
    }
    
    public void setName_am(String name_am){
       this.name_am = name_am;
    }


    public int getKod_am_n(){
       return kod_am_n;
    }
    
    public void setKod_am_n(int kod_am_n){
       this.kod_am_n = kod_am_n;
    }


    public String getName_am_n(){
       return name_am_n;
    }
    
    public void setName_am_n(String name_am_n){
       this.name_am_n = name_am_n;
    }


    public int getUse_limit(){
       return use_limit;
    }
    
    public void setUse_limit(int use_limit){
       this.use_limit = use_limit;
    }


    public int getUse_limit_n(){
       return use_limit_n;
    }
    
    public void setUse_limit_n(int use_limit_n){
       this.use_limit_n = use_limit_n;
    }


    public String getPrimechan_vyb(){
       return primechan_vyb;
    }
    
    public void setPrimechan_vyb(String primechan_vyb){
       this.primechan_vyb = primechan_vyb;
    }


    public String getKod_prizn(){
       return kod_prizn;
    }
    
    public void setKod_prizn(String kod_prizn){
       this.kod_prizn = kod_prizn;
    }


    public Date getDatePosting(){
       return datePosting;
    }

    public void setDatePosting(Date datePosting){
       this.datePosting = datePosting;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENBuildingRef getENBuildingRef(){
       return ENBuildingRef;
    }
    
    public void setENBuildingRef(ENBuildingRef ENBuildingRef){
       this.ENBuildingRef = ENBuildingRef;
    }

} // end of ENBuilding2OSDataValueObject

