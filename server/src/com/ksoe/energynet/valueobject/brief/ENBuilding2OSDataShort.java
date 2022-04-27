
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBuilding2OSData;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBuilding2OSDataShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int num_un = Integer.MIN_VALUE;
	public String kod_inv;
	public String kod_nal_nakl;
	public String kod_ist;
	public String name_ist;
	public String kod_subsch;
	public String name_subsch;
	public String kod_vid;
	public String name_vid;
	public String kod_privat;
	public String name_privat;
	public String kod_gr;
	public String name_gr;
	public int num_klass = Integer.MIN_VALUE;
	public String name_klass;
	public String f_amort;
	public Date dt_vypusk ;
	public BigDecimal sum_izn_perv;
	public BigDecimal sum_izn_perv_n;
	public BigDecimal sum_st_perv_n;
	public String kod_zatr;
	public String kod_oborud;
	public String primechan;
	public String characters;
	public int id_amort = Integer.MIN_VALUE;
	public String kod_amort;
	public String name_amort;
	public int kod_am = Integer.MIN_VALUE;
	public String name_am;
	public int kod_am_n = Integer.MIN_VALUE;
	public String name_am_n;
	public int use_limit = Integer.MIN_VALUE;
	public int use_limit_n = Integer.MIN_VALUE;
	public String primechan_vyb;
	public String kod_prizn;
	public Date datePosting ;
	public String userGen;
	public Date dateEdit ;
	public int ENBuildingRefCode = Integer.MIN_VALUE;
	public String ENBuildingRefNumbergen;
	public Date ENBuildingRefDateGen;
	public Date ENBuildingRefDateEdit;
	public BigDecimal ENBuildingRefSummaGen;
	public BigDecimal ENBuildingRefSummaNDS;
	public String ENBuildingRefCharacteristic;
	public String ENBuildingRefExecutedPosition;
	public String ENBuildingRefExecutedName;
	public String ENBuildingRefAcceptedPosition;
	public String ENBuildingRefAcceptedName;
	public BigDecimal ENBuildingRefContractPrice;
	public String ENBuildingRefCodeMol;
	public String ENBuildingRefCodePodr;
	public String ENBuildingRefInvNumberOZ;
	public String ENBuildingRefNameOZ;
	public String ENBuildingRefFinContractNumber;
	public Date ENBuildingRefFinContractDate;
	public String ENBuildingRefPartnerName;
	public String ENBuildingRefPartnerCode;
	public int ENBuildingRefIsInvestProgram = Integer.MIN_VALUE;
	public String ENBuildingRefYearInvestProgram;
	public String ENBuildingRefItemInvestProgram;
	public String ENBuildingRefBuildingAddress;
	public String ENBuildingRefDecreeNumber;
	public Date ENBuildingRefDecreeDate;
	public int ENBuildingRefExploitationTerm = Integer.MIN_VALUE;
	public Date ENBuildingRefDateLoadExpl;
	public Date ENBuildingRefDateBuild;
	public String ENBuildingRefUserGen;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getNum_un() {
		return num_un;
	}

	public void setNum_un(int num_un) {
		this.num_un = num_un;
	}

	public String getKod_inv() {
		return kod_inv;
	}

	public void setKod_inv(String kod_inv) {
		this.kod_inv = kod_inv;
	}

	public String getKod_nal_nakl() {
		return kod_nal_nakl;
	}

	public void setKod_nal_nakl(String kod_nal_nakl) {
		this.kod_nal_nakl = kod_nal_nakl;
	}

	public String getKod_ist() {
		return kod_ist;
	}

	public void setKod_ist(String kod_ist) {
		this.kod_ist = kod_ist;
	}

	public String getName_ist() {
		return name_ist;
	}

	public void setName_ist(String name_ist) {
		this.name_ist = name_ist;
	}

	public String getKod_subsch() {
		return kod_subsch;
	}

	public void setKod_subsch(String kod_subsch) {
		this.kod_subsch = kod_subsch;
	}

	public String getName_subsch() {
		return name_subsch;
	}

	public void setName_subsch(String name_subsch) {
		this.name_subsch = name_subsch;
	}

	public String getKod_vid() {
		return kod_vid;
	}

	public void setKod_vid(String kod_vid) {
		this.kod_vid = kod_vid;
	}

	public String getName_vid() {
		return name_vid;
	}

	public void setName_vid(String name_vid) {
		this.name_vid = name_vid;
	}

	public String getKod_privat() {
		return kod_privat;
	}

	public void setKod_privat(String kod_privat) {
		this.kod_privat = kod_privat;
	}

	public String getName_privat() {
		return name_privat;
	}

	public void setName_privat(String name_privat) {
		this.name_privat = name_privat;
	}

	public String getKod_gr() {
		return kod_gr;
	}

	public void setKod_gr(String kod_gr) {
		this.kod_gr = kod_gr;
	}

	public String getName_gr() {
		return name_gr;
	}

	public void setName_gr(String name_gr) {
		this.name_gr = name_gr;
	}

	public int getNum_klass() {
		return num_klass;
	}

	public void setNum_klass(int num_klass) {
		this.num_klass = num_klass;
	}

	public String getName_klass() {
		return name_klass;
	}

	public void setName_klass(String name_klass) {
		this.name_klass = name_klass;
	}

	public String getf_amort() {
		return f_amort;
	}

	public void setf_amort(String f_amort) {
		this.f_amort = f_amort;
	}

	public Date getDt_vypusk() {
		return dt_vypusk;
	}

	public void setDt_vypusk(Date dt_vypusk) {
		this.dt_vypusk = dt_vypusk;
	}

	public BigDecimal getSum_izn_perv() {
		return sum_izn_perv;
	}

	public void setSum_izn_perv(BigDecimal sum_izn_perv) {
		this.sum_izn_perv = sum_izn_perv;
	}

	public BigDecimal getSum_izn_perv_n() {
		return sum_izn_perv_n;
	}

	public void setSum_izn_perv_n(BigDecimal sum_izn_perv_n) {
		this.sum_izn_perv_n = sum_izn_perv_n;
	}

	public BigDecimal getSum_st_perv_n() {
		return sum_st_perv_n;
	}

	public void setSum_st_perv_n(BigDecimal sum_st_perv_n) {
		this.sum_st_perv_n = sum_st_perv_n;
	}

	public String getKod_zatr() {
		return kod_zatr;
	}

	public void setKod_zatr(String kod_zatr) {
		this.kod_zatr = kod_zatr;
	}

	public String getKod_oborud() {
		return kod_oborud;
	}

	public void setKod_oborud(String kod_oborud) {
		this.kod_oborud = kod_oborud;
	}

	public String getPrimechan() {
		return primechan;
	}

	public void setPrimechan(String primechan) {
		this.primechan = primechan;
	}

	public String getCharacters() {
		return characters;
	}

	public void setCharacters(String characters) {
		this.characters = characters;
	}

	public int getId_amort() {
		return id_amort;
	}

	public void setId_amort(int id_amort) {
		this.id_amort = id_amort;
	}

	public String getKod_amort() {
		return kod_amort;
	}

	public void setKod_amort(String kod_amort) {
		this.kod_amort = kod_amort;
	}

	public String getName_amort() {
		return name_amort;
	}

	public void setName_amort(String name_amort) {
		this.name_amort = name_amort;
	}

	public int getKod_am() {
		return kod_am;
	}

	public void setKod_am(int kod_am) {
		this.kod_am = kod_am;
	}

	public String getName_am() {
		return name_am;
	}

	public void setName_am(String name_am) {
		this.name_am = name_am;
	}

	public int getKod_am_n() {
		return kod_am_n;
	}

	public void setKod_am_n(int kod_am_n) {
		this.kod_am_n = kod_am_n;
	}

	public String getName_am_n() {
		return name_am_n;
	}

	public void setName_am_n(String name_am_n) {
		this.name_am_n = name_am_n;
	}

	public int getUse_limit() {
		return use_limit;
	}

	public void setUse_limit(int use_limit) {
		this.use_limit = use_limit;
	}

	public int getUse_limit_n() {
		return use_limit_n;
	}

	public void setUse_limit_n(int use_limit_n) {
		this.use_limit_n = use_limit_n;
	}

	public String getPrimechan_vyb() {
		return primechan_vyb;
	}

	public void setPrimechan_vyb(String primechan_vyb) {
		this.primechan_vyb = primechan_vyb;
	}

	public String getKod_prizn() {
		return kod_prizn;
	}

	public void setKod_prizn(String kod_prizn) {
		this.kod_prizn = kod_prizn;
	}

	public Date getDatePosting() {
		return datePosting;
	}

	public void setDatePosting(Date datePosting) {
		this.datePosting = datePosting;
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



	public int getENBuildingRefCode(){
		return ENBuildingRefCode;
	}

	public void setENBuildingRefCode(int ENBuildingRefCode) {
		this.ENBuildingRefCode = ENBuildingRefCode;
	}

	public String getENBuildingRefNumbergen(){
		return ENBuildingRefNumbergen;
	}

	public void setENBuildingRefNumbergen(String ENBuildingRefNumbergen) {
		this.ENBuildingRefNumbergen = ENBuildingRefNumbergen;
	}

	public Date getENBuildingRefDateGen(){
		return ENBuildingRefDateGen;
	}

	public void setENBuildingRefDateGen(Date ENBuildingRefDateGen) {
		this.ENBuildingRefDateGen = ENBuildingRefDateGen;
	}

	public Date getENBuildingRefDateEdit(){
		return ENBuildingRefDateEdit;
	}

	public void setENBuildingRefDateEdit(Date ENBuildingRefDateEdit) {
		this.ENBuildingRefDateEdit = ENBuildingRefDateEdit;
	}

	public BigDecimal getENBuildingRefSummaGen(){
		return ENBuildingRefSummaGen;
	}

	public void setENBuildingRefSummaGen(BigDecimal ENBuildingRefSummaGen) {
		this.ENBuildingRefSummaGen = ENBuildingRefSummaGen;
	}

	public BigDecimal getENBuildingRefSummaNDS(){
		return ENBuildingRefSummaNDS;
	}

	public void setENBuildingRefSummaNDS(BigDecimal ENBuildingRefSummaNDS) {
		this.ENBuildingRefSummaNDS = ENBuildingRefSummaNDS;
	}

	public String getENBuildingRefCharacteristic(){
		return ENBuildingRefCharacteristic;
	}

	public void setENBuildingRefCharacteristic(String ENBuildingRefCharacteristic) {
		this.ENBuildingRefCharacteristic = ENBuildingRefCharacteristic;
	}

	public String getENBuildingRefExecutedPosition(){
		return ENBuildingRefExecutedPosition;
	}

	public void setENBuildingRefExecutedPosition(String ENBuildingRefExecutedPosition) {
		this.ENBuildingRefExecutedPosition = ENBuildingRefExecutedPosition;
	}

	public String getENBuildingRefExecutedName(){
		return ENBuildingRefExecutedName;
	}

	public void setENBuildingRefExecutedName(String ENBuildingRefExecutedName) {
		this.ENBuildingRefExecutedName = ENBuildingRefExecutedName;
	}

	public String getENBuildingRefAcceptedPosition(){
		return ENBuildingRefAcceptedPosition;
	}

	public void setENBuildingRefAcceptedPosition(String ENBuildingRefAcceptedPosition) {
		this.ENBuildingRefAcceptedPosition = ENBuildingRefAcceptedPosition;
	}

	public String getENBuildingRefAcceptedName(){
		return ENBuildingRefAcceptedName;
	}

	public void setENBuildingRefAcceptedName(String ENBuildingRefAcceptedName) {
		this.ENBuildingRefAcceptedName = ENBuildingRefAcceptedName;
	}

	public BigDecimal getENBuildingRefContractPrice(){
		return ENBuildingRefContractPrice;
	}

	public void setENBuildingRefContractPrice(BigDecimal ENBuildingRefContractPrice) {
		this.ENBuildingRefContractPrice = ENBuildingRefContractPrice;
	}

	public String getENBuildingRefCodeMol(){
		return ENBuildingRefCodeMol;
	}

	public void setENBuildingRefCodeMol(String ENBuildingRefCodeMol) {
		this.ENBuildingRefCodeMol = ENBuildingRefCodeMol;
	}

	public String getENBuildingRefCodePodr(){
		return ENBuildingRefCodePodr;
	}

	public void setENBuildingRefCodePodr(String ENBuildingRefCodePodr) {
		this.ENBuildingRefCodePodr = ENBuildingRefCodePodr;
	}

	public String getENBuildingRefInvNumberOZ(){
		return ENBuildingRefInvNumberOZ;
	}

	public void setENBuildingRefInvNumberOZ(String ENBuildingRefInvNumberOZ) {
		this.ENBuildingRefInvNumberOZ = ENBuildingRefInvNumberOZ;
	}

	public String getENBuildingRefNameOZ(){
		return ENBuildingRefNameOZ;
	}

	public void setENBuildingRefNameOZ(String ENBuildingRefNameOZ) {
		this.ENBuildingRefNameOZ = ENBuildingRefNameOZ;
	}

	public String getENBuildingRefFinContractNumber(){
		return ENBuildingRefFinContractNumber;
	}

	public void setENBuildingRefFinContractNumber(String ENBuildingRefFinContractNumber) {
		this.ENBuildingRefFinContractNumber = ENBuildingRefFinContractNumber;
	}

	public Date getENBuildingRefFinContractDate(){
		return ENBuildingRefFinContractDate;
	}

	public void setENBuildingRefFinContractDate(Date ENBuildingRefFinContractDate) {
		this.ENBuildingRefFinContractDate = ENBuildingRefFinContractDate;
	}

	public String getENBuildingRefPartnerName(){
		return ENBuildingRefPartnerName;
	}

	public void setENBuildingRefPartnerName(String ENBuildingRefPartnerName) {
		this.ENBuildingRefPartnerName = ENBuildingRefPartnerName;
	}

	public String getENBuildingRefPartnerCode(){
		return ENBuildingRefPartnerCode;
	}

	public void setENBuildingRefPartnerCode(String ENBuildingRefPartnerCode) {
		this.ENBuildingRefPartnerCode = ENBuildingRefPartnerCode;
	}

	public int getENBuildingRefIsInvestProgram(){
		return ENBuildingRefIsInvestProgram;
	}

	public void setENBuildingRefIsInvestProgram(int ENBuildingRefIsInvestProgram) {
		this.ENBuildingRefIsInvestProgram = ENBuildingRefIsInvestProgram;
	}

	public String getENBuildingRefYearInvestProgram(){
		return ENBuildingRefYearInvestProgram;
	}

	public void setENBuildingRefYearInvestProgram(String ENBuildingRefYearInvestProgram) {
		this.ENBuildingRefYearInvestProgram = ENBuildingRefYearInvestProgram;
	}

	public String getENBuildingRefItemInvestProgram(){
		return ENBuildingRefItemInvestProgram;
	}

	public void setENBuildingRefItemInvestProgram(String ENBuildingRefItemInvestProgram) {
		this.ENBuildingRefItemInvestProgram = ENBuildingRefItemInvestProgram;
	}

	public String getENBuildingRefBuildingAddress(){
		return ENBuildingRefBuildingAddress;
	}

	public void setENBuildingRefBuildingAddress(String ENBuildingRefBuildingAddress) {
		this.ENBuildingRefBuildingAddress = ENBuildingRefBuildingAddress;
	}

	public String getENBuildingRefDecreeNumber(){
		return ENBuildingRefDecreeNumber;
	}

	public void setENBuildingRefDecreeNumber(String ENBuildingRefDecreeNumber) {
		this.ENBuildingRefDecreeNumber = ENBuildingRefDecreeNumber;
	}

	public Date getENBuildingRefDecreeDate(){
		return ENBuildingRefDecreeDate;
	}

	public void setENBuildingRefDecreeDate(Date ENBuildingRefDecreeDate) {
		this.ENBuildingRefDecreeDate = ENBuildingRefDecreeDate;
	}

	public int getENBuildingRefExploitationTerm(){
		return ENBuildingRefExploitationTerm;
	}

	public void setENBuildingRefExploitationTerm(int ENBuildingRefExploitationTerm) {
		this.ENBuildingRefExploitationTerm = ENBuildingRefExploitationTerm;
	}

	public Date getENBuildingRefDateLoadExpl(){
		return ENBuildingRefDateLoadExpl;
	}

	public void setENBuildingRefDateLoadExpl(Date ENBuildingRefDateLoadExpl) {
		this.ENBuildingRefDateLoadExpl = ENBuildingRefDateLoadExpl;
	}

	public Date getENBuildingRefDateBuild(){
		return ENBuildingRefDateBuild;
	}

	public void setENBuildingRefDateBuild(Date ENBuildingRefDateBuild) {
		this.ENBuildingRefDateBuild = ENBuildingRefDateBuild;
	}

	public String getENBuildingRefUserGen(){
		return ENBuildingRefUserGen;
	}

	public void setENBuildingRefUserGen(String ENBuildingRefUserGen) {
		this.ENBuildingRefUserGen = ENBuildingRefUserGen;
	}



}
