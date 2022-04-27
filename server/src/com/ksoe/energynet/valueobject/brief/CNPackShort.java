
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNPack;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class CNPackShort implements Serializable {

    public int code = Integer.MIN_VALUE; //Код
    public int packCode = Integer.MIN_VALUE; //Код пакета EnergyWorkflow
    public String name; //Наименование пакета EnergyWorkflow
    public int id_ren = Integer.MIN_VALUE; //Код РЭС-а из EnergyWorkflow
    public String renName; //Название РЭС-а из EnergyWorkflow
    public int id_district = Integer.MIN_VALUE; /* Код Района города из EnergyWorkflow. Важен для подсистемы
      * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ БЫТОВОГО СЕКТОРА*/
    public String districtName; /* Название Района города из EnergyWorkflow. Важен для подсистемы
      * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ БЫТОВОГО СЕКТОРА*/
    public int id_pack_status = Integer.MIN_VALUE; //Код статуса пакета EnergyWorkflow: 1, 5, 4, 2
    public String statusName; //Статус пакета EnergyWorkflow: В работе, Ожидание, Архив, Завершён)
    public String description; //Целевое назначение, описание пакета EnergyWorkflow
    public BigDecimal power; //Мощность
    public String address; //Адрес заказчика
    public String address_jur; /*Юридический адрес заказчика. Используется в подсистемах комплекса EnergyWorkflow:
    * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ ЮРИДИСЧЕСКОГО СЕКТОРА,
    * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ БЫТОВОГО СЕКТОРА */
    public String reg_num_cn_contract; //№ договора о Присоединении
    public Date date_cn_contract ; //Дата заключения договора о Присоединении
    public String reg_num_tu_contract; //Регистрационный № Технических Условий
    public Date date_tu_contract; //Дата регистрации Технических Условий
    public String reg_num_tu_cr_contract; //№ договора о Разработке Технических Условий
    public Date date_tu_cr_contract; //Дата договора о Разработке Технических Условий
    public String project_num; //№ Проекта Технических Условий
    public Date project_date; //Дата согласования проекта Технических Условий
    public String reg_num_spl_pp_contract; //№ договора о Поставке Электроэнергии (об Использовании Электроэнергии)
    public Date date_spl_pp_contract ; //Дата заключения договора о Поставке Электроэнергии (об Использовании Электроэнергии)
    public int subsystemRefCode = Integer.MIN_VALUE; //Код подсистемы комплекса EnergyWorkflow
    public String subsystemRefName; //Подсистема комплекса EnergyWorkflow
    public String cur_state; //Текущее состояние пакета EnergyWorkflow
    public String business_type; //Род деятельности объекта
    public int over5 = Integer.MIN_VALUE;
    public int status = Integer.MIN_VALUE;
    public String letter_num_customer;
    public Date date_letter_customer ;
    public String letter_num;
    public Date date_letter ;
    public String reliability_class;
    public int id_waiting_status = Integer.MIN_VALUE;
    public String waitingStatus;
    public int is_payable = Integer.MIN_VALUE;
    public String worksize;
    public String work_inc_net;
    public int estimateterm = Integer.MIN_VALUE;
    public Date estimatedate ;
    public int buildingterm = Integer.MIN_VALUE;
    public Date buildingdate ;
    public int buyingterm = Integer.MIN_VALUE;
    public Date buyingdate ;
    public String estimate_num;
    public Date estimate_contract_date ;
    public int is_reserv = Integer.MIN_VALUE;
    public Date date_finish_pack; //Дата завершения работы над пакетом
    public String purpose;
    public int is_ksoe = Integer.MIN_VALUE;
    public int over150 = Integer.MIN_VALUE;
    public int is_new = Integer.MIN_VALUE;
    public int is3phases = Integer.MIN_VALUE;
    //Признак завершённостии связанного с ТУ договора поставки
    public int is_finish_supply = Integer.MIN_VALUE;
    //Признак регистрации ТУ
    public int is_registration = Integer.MIN_VALUE;

    public int id_feature = Integer.MIN_VALUE;

    //Некоторые поля сущности ТУ
    public BigDecimal pow_exist; //Существующая до выдачи ТУ мощность, кВт
    public int is_realized = Integer.MIN_VALUE; //Признак, Реализованы ли ТУ (0 - нет, 1 - да, Null - не известно)
    public BigDecimal tension_point; //Напряжение в точке присоединения, В
    public BigDecimal tension_exist; //Существующее до выдачи ТУ напряжение в точке присоединения, В
    public BigDecimal current_automat; //Сила тока автоматического выключателя, А
    public int id_proposal; //Код предложения ТУ: 0 или Null - не указано; 1 - увеличение мощности;
    						//2 - изменение точки присоединения, 3 - увеличение мощности с изменением точки присоединения

    //public String status; // Юридический статус пакета: 0 - юридическое лицо, 1 - физическое лицо
    //public int is_new;
     /* Признак нового договора о поставке электроэнергии. Используется в подсистеме
      * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ ЮРИДИЧЕСКОГО СЕКТОРА:
      *   0 - перезаключение договора о поставке;
      *   1 - заключение нового договора о поставке */
    //public int is_ksoe;
     /* Принадлежность к цепочке. Назначение поля в подсистемах комплекса EnergyWorkflow:
      * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ ЮРИДИСЧЕСКОГО СЕКТОРА:
      *   0 - рэсовская цепочка,
      *   1 - цепочка ХОЭ;
      * ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ БЫТОВОГО СЕКТОРА:
      *   0 - перезаключение договора (РЭС),
      *   1 - новый договор (РЭС),
      *   2 - перезаключение договора (ХГЭС),
      *   3 - новый договор (ХГЭС) */

    //Поля подсистем ПРИСОЕДИНЕНИЕ до и после 01.08.2010, с 14.03.2011 комплекса EnergyWorkflow
    /* over5 //Принадлежность к цепочке: 0 - ПРИСОЕДИНЕНИЕ до 5 кВт, 1 - ПРИСОЕДИНЕНИЕ свыше 5 кВт
     * ps_110_35
     * ps_110_10
     * ps_35_10
     * ps_10_04
     * mp_ps_110_35
     * mp_ps_110_10
     * mp_ps_35_10
     * mp_ps_10_04
     * rec_length_110_35
     * rec_length_110_10
     * rec_length_35_10
     * rec_length_10_04
     * account //Лицевой из биллинга (если это существующий потребитель)*/

    //Поля подсистем ПОСТАВКА ЭЛЕКТРОЭНЕРГИИ ПОТРЕБИТЕЛЯМ ЮРИДИЧЕСКОГО И БЫТОВОГО СЕКТОРОВ
    /* over150 //Признак мощности: 0 - менее 150 кВт, 1 - более 150 кВт */

    //Связь с объектами энергетики для схемы нормального режима
    public int airLine04RefCode = Integer.MIN_VALUE;
    public int cableLine04RefCode = Integer.MIN_VALUE;
    public int trRefCode = Integer.MIN_VALUE;
    public int s04RefCode = Integer.MIN_VALUE;
    public int airLine10RefCode = Integer.MIN_VALUE;
    public int cableLine10RefCode = Integer.MIN_VALUE;
    public int s35RefCode = Integer.MIN_VALUE;
    public int airLine150RefCode = Integer.MIN_VALUE;
    public int cableLine150RefCode = Integer.MIN_VALUE;
    public int s150RefCode = Integer.MIN_VALUE;



	public int getId_proposal() {
		return id_proposal;
	}

	public void setId_proposal(int id_proposal) {
		this.id_proposal = id_proposal;
	}

	public int getIs_registration() {
		return is_registration;
	}

	public void setIs_registration(int is_registration) {
		this.is_registration = is_registration;
	}

	public String getCur_state() {
		return cur_state;
	}

	public void setCur_state(String cur_state) {
		this.cur_state = cur_state;
	}

	public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setPackCode(int aValue){
       packCode = aValue;
    }

    public int getPackCode(){
       return packCode;
    }
    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }
    public void setId_ren(int aValue){
       id_ren = aValue;
    }

    public int getId_ren(){
       return id_ren;
    }
    public void setRenName(String aValue){
       renName = aValue;
    }

    public String getRenName(){
       return renName;
    }
    public void setId_pack_status(int aValue){
       id_pack_status = aValue;
    }

    public int getId_pack_status(){
       return id_pack_status;
    }
    public void setStatusName(String aValue){
       statusName = aValue;
    }

    public String getStatusName(){
       return statusName;
    }
    public void setDescription(String aValue){
       description = aValue;
    }

    public String getDescription(){
       return description;
    }
    public void setPower(BigDecimal aValue){
       power = aValue;
    }

    public BigDecimal getPower(){
       return power;
    }
    public void setAddress(String aValue){
       address = aValue;
    }

    public String getAddress(){
       return address;
    }

    public void setAddress_jur(String aValue){
       address_jur = aValue;
    }

    public String getAddress_jur(){
       return address_jur;
    }

    public void setReg_num_cn_contract(String aValue){
       reg_num_cn_contract = aValue;
    }

    public String getReg_num_cn_contract(){
       return reg_num_cn_contract;
    }

    public void setDate_cn_contract(Date aValue){
       date_cn_contract = aValue;
    }

    public Date getDate_cn_contract(){
       return date_cn_contract;
    }
    public void setReg_num_tu_contract(String aValue){
       reg_num_tu_contract = aValue;
    }

    public String getReg_num_tu_contract(){
       return reg_num_tu_contract;
    }

    public void setDate_tu_contract(Date aValue){
       date_tu_contract = aValue;
    }

    public Date getDate_tu_contract(){
       return date_tu_contract;
    }
    public void setReg_num_tu_cr_contract(String aValue){
       reg_num_tu_cr_contract = aValue;
    }

    public String getReg_num_tu_cr_contract(){
       return reg_num_tu_cr_contract;
    }

    public void setDate_tu_cr_contract(Date aValue){
       date_tu_cr_contract = aValue;
    }

    public Date getDate_tu_cr_contract(){
       return date_tu_cr_contract;
    }
    public void setProject_num(String aValue){
       project_num = aValue;
    }

    public String getProject_num(){
       return project_num;
    }

    public void setProject_date(Date aValue){
       project_date = aValue;
    }

    public Date getProject_date(){
       return project_date;
    }
    public void setOver5(int aValue){
       over5 = aValue;
    }

    public int getOver5(){
       return over5;
    }
    public void setStatus(int aValue){
       status = aValue;
    }

    public int getStatus(){
       return status;
    }
    public void setLetter_num_customer(String aValue){
       letter_num_customer = aValue;
    }

    public String getLetter_num_customer(){
       return letter_num_customer;
    }

    public void setDate_letter_customer(Date aValue){
       date_letter_customer = aValue;
    }

    public Date getDate_letter_customer(){
       return date_letter_customer;
    }
    public void setLetter_num(String aValue){
       letter_num = aValue;
    }

    public String getLetter_num(){
       return letter_num;
    }

    public void setDate_letter(Date aValue){
       date_letter = aValue;
    }

    public Date getDate_letter(){
       return date_letter;
    }
    public void setReliability_class(String aValue){
       reliability_class = aValue;
    }

    public String getReliability_class(){
       return reliability_class;
    }
    public void setId_waiting_status(int aValue){
       id_waiting_status = aValue;
    }

    public int getId_waiting_status(){
       return id_waiting_status;
    }
    public void setWaitingStatus(String aValue){
       waitingStatus = aValue;
    }

    public String getWaitingStatus(){
       return waitingStatus;
    }
    public void setIs_payable(int aValue){
       is_payable = aValue;
    }

    public int getIs_payable(){
       return is_payable;
    }
    public void setWorksize(String aValue){
       worksize = aValue;
    }

    public String getWorksize(){
       return worksize;
    }
    public void setWork_inc_net(String aValue){
       work_inc_net = aValue;
    }

    public String getWork_inc_net(){
       return work_inc_net;
    }
    public void setEstimateterm(int aValue){
       estimateterm = aValue;
    }

    public int getEstimateterm(){
       return estimateterm;
    }

    public void setEstimatedate(Date aValue){
       estimatedate = aValue;
    }

    public Date getEstimatedate(){
       return estimatedate;
    }
    public void setBuildingterm(int aValue){
       buildingterm = aValue;
    }

    public int getBuildingterm(){
       return buildingterm;
    }

    public void setBuildingdate(Date aValue){
       buildingdate = aValue;
    }

    public Date getBuildingdate(){
       return buildingdate;
    }
    public void setBuyingterm(int aValue){
       buyingterm = aValue;
    }

    public int getBuyingterm(){
       return buyingterm;
    }

    public void setBuyingdate(Date aValue){
       buyingdate = aValue;
    }

    public Date getBuyingdate(){
       return buyingdate;
    }
    public void setEstimate_num(String aValue){
       estimate_num = aValue;
    }

    public String getEstimate_num(){
       return estimate_num;
    }

    public void setEstimate_contract_date(Date aValue){
       estimate_contract_date = aValue;
    }

    public Date getEstimate_contract_date(){
       return estimate_contract_date;
    }
    public void setIs_reserv(int aValue){
       is_reserv = aValue;
    }

    public int getIs_reserv(){
       return is_reserv;
    }
public void setPurpose(String aValue){
       purpose = aValue;
    }

    public String getPurpose(){
       return purpose;
    }
    public void setIs_ksoe(int aValue){
       is_ksoe = aValue;
    }

    public int getIs_ksoe(){
       return is_ksoe;
    }
    public void setOver150(int aValue){
       over150 = aValue;
    }

    public int getOver150(){
       return over150;
    }
    public void setIs_new(int aValue){
       is_new = aValue;
    }

    public int getIs_new(){
       return is_new;
    }
    public void setIs3phases(int aValue){
       is3phases = aValue;
    }

    public int getIs3phases(){
       return is3phases;
    }


    public void setSubsystemRefCode(int aValue){
       subsystemRefCode = aValue;
    }
    public int getSubsystemRefCode(){
       return subsystemRefCode;
    }

    public void setSubsystemRefName(String aValue){
       subsystemRefName = aValue;
    }
    public String getSubsystemRefName(){
       return subsystemRefName;
    }

	public String getBusiness_type() {
		return business_type;
	}

	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}

	public Date getDate_spl_pp_contract() {
		return date_spl_pp_contract;
	}

	public void setDate_spl_pp_contract(Date date_spl_pp_contract) {
		this.date_spl_pp_contract = date_spl_pp_contract;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public int getId_district() {
		return id_district;
	}

	public void setId_district(int id_district) {
		this.id_district = id_district;
	}

	public String getReg_num_spl_pp_contract() {
		return reg_num_spl_pp_contract;
	}

	public void setReg_num_spl_pp_contract(String reg_num_spl_pp_contract) {
		this.reg_num_spl_pp_contract = reg_num_spl_pp_contract;
	}

	public BigDecimal getCurrent_automat() {
		return current_automat;
	}

	public void setCurrent_automat(BigDecimal current_automat) {
		this.current_automat = current_automat;
	}

	public int getIs_finish_supply() {
		return is_finish_supply;
	}

	public void setIs_finish_supply(int is_finish_supply) {
		this.is_finish_supply = is_finish_supply;
	}

	public int getIs_realized() {
		return is_realized;
	}

	public void setIs_realized(int is_realized) {
		this.is_realized = is_realized;
	}

	public BigDecimal getPow_exist() {
		return pow_exist;
	}

	public void setPow_exist(BigDecimal pow_exist) {
		this.pow_exist = pow_exist;
	}

	public BigDecimal getTension_exist() {
		return tension_exist;
	}

	public void setTension_exist(BigDecimal tension_exist) {
		this.tension_exist = tension_exist;
	}

	public BigDecimal getTension_point() {
		return tension_point;
	}

	public void setTension_point(BigDecimal tension_point) {
		this.tension_point = tension_point;
	}

	public Date getDate_finish_pack() {
		return date_finish_pack;
	}

	public void setDate_finish_pack(Date date_finish_pack) {
		this.date_finish_pack = date_finish_pack;
	}

    public void setAirLine04RefCode(int aValue){
       airLine04RefCode = aValue;
    }
    public int getAirLine04RefCode(){
       return airLine04RefCode;
    }

    public void setCableLine04RefCode(int aValue){
       cableLine04RefCode = aValue;
    }
    public int getCableLine04RefCode(){
       return cableLine04RefCode;
    }

    public void setTrRefCode(int aValue){
       trRefCode = aValue;
    }
    public int getTrRefCode(){
       return trRefCode;
    }

    public void setS04RefCode(int aValue){
       s04RefCode = aValue;
    }
    public int getS04RefCode(){
       return s04RefCode;
    }

    public void setAirLine10RefCode(int aValue){
       airLine10RefCode = aValue;
    }
    public int getAirLine10RefCode(){
       return airLine10RefCode;
    }

    public void setCableLine10RefCode(int aValue){
       cableLine10RefCode = aValue;
    }
    public int getCableLine10RefCode(){
       return cableLine10RefCode;
    }

    public void setS35RefCode(int aValue){
       s35RefCode = aValue;
    }
    public int getS35RefCode(){
       return s35RefCode;
    }

    public void setAirLine150RefCode(int aValue){
       airLine150RefCode = aValue;
    }
    public int getAirLine150RefCode(){
       return airLine150RefCode;
    }

    public void setcableLine150RefCode(int aValue){
       cableLine150RefCode = aValue;
    }
    public int getcableLine150RefCode(){
       return cableLine150RefCode;
    }

    public void setS150RefCode(int aValue){
       s150RefCode = aValue;
    }
    public int getS150RefCode(){
       return s150RefCode;
    }

	public int getId_feature() {
		return id_feature;
	}

	public void setId_feature(int id_feature) {
		this.id_feature = id_feature;
	}

}