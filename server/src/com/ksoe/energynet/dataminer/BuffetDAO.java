package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.util.Tools;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * 
 * DAO ��� ������ � �� ��������� �����
 * 
 * @author kreschishinma
 *
 */
public class BuffetDAO extends GenericDataMiner {
	
	  public BuffetDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
	  public BuffetDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}
	  
	  
	  private static final String SUM_WITHOUT_VAT_COLUMN = "summa_wvat";
	  private static final String SUM_WITH_VAT_COLUMN = "summa";
	  
	  private static final byte BUFFET_INVOICE_KIND_WRITE_OFF = 2;

	  /**
	   * 
	   * �������� ����� �� ��������� � ������ ��� ���, ���.
	   * 
	   * ����� ��������� �� ���� ������ ����� �������
	   * 
	   * @param invoiceNumber ����� ��������� � ������
	   * @param date ���� ���������
	   * @return ����� �� ��������� ��� ���, ���.
	   */
	  public BigDecimal getInvoiceSumWithoutVAT(String invoiceNumber, Date date) {
		return this.getInvoiceSum(invoiceNumber, date, SUM_WITHOUT_VAT_COLUMN);  
	  }
	  
	  /**
	   * 
	   * �������� ����� �� ��������� � ������ � ���� ���.
	   * 
	   * ����� ��������� �� ���� ������ ����� �������
	   * 
	   * @param invoiceNumber ����� ��������� � ������
	   * @param date ���� ���������
	   * @return ����� �� ��������� � ���, ���.
	   */
	  public BigDecimal getInvoiceSumWithVAT(String invoiceNumber, Date date) {
		return this.getInvoiceSum(invoiceNumber, date, SUM_WITH_VAT_COLUMN);  
	  }
	  
	  private BigDecimal getInvoiceSum(String invoiceNumber, Date date, String sumColumn) {
		  if(invoiceNumber == null) {
			  throw new java.lang.NullPointerException("�� ������� ����� ��������!");
		  }
		  if(date == null) {
			  throw new java.lang.NullPointerException("�� ������ ����!");
		  }
		  
		  if(sumColumn == null || sumColumn.trim().length() == 0) {
			  throw new java.lang.NullPointerException("�� ������ ������� �� �����!");
		  }
		  
		  String sql = String.format("SELECT coalesce(sum(%s),0) FROM jur_nak WHERE nom_nak = ? AND data = ? AND tip = ?", sumColumn);
		  
		  Vector<Object> params = new Vector<Object>();
		  params.add(invoiceNumber);
		  params.add(date);
		  params.add(BUFFET_INVOICE_KIND_WRITE_OFF);
		  
		  BigDecimal result = BaseDAOUtils.executeStatementAndReadObject(this.getConnection(), sql, params
				  , new BaseDAOUtils.BigDecimalFromResultSetTransformator(), false);
		  
		  if(result != null) {
			  result = result.setScale(2, BigDecimal.ROUND_HALF_UP);
		  }
		  
		  return result;
	  }
	  
	  /**
	   * 
	   * �������� ��������� ����� � ��������� �����
	   * 
	   * @param tabNumber ��������� ����� ����������
	   * @param name ��� ����������
	   * @throws PersistenceException
	   */
	  public void addCardToBufet(String tabNumber, String name) throws PersistenceException {
		  String sql = "INSERT INTO SP_SK_KARD (KOD_KARD,AKTIV,FIO,ID_SKIDKI,NAME_SKIDKI,SUMMA_PREDEL,PROCENT_SKID,SUMMA_ALL,DATA_REG,DATA_ROGDEN,ADRES,TELEFON,DOP,SUMMA_ON_KARD,NAKOP_SUMMA,NAKOP_CHECKI,ID_PR_SPIS,PR_SPIS,SL_VOZV,SL_EDIT,SL_DEL,SL_PRINT,SL_NO_CLOSED,SL_BESNAL,SL_SKIDKA,SL_KASSA,SL_CLOSE_SMEN,SL_FIN_OPER,SL_ADD1,SL_ADD2,ED,INFO1,INFO2,SUMMA_POKUPOK,SUMMA_NAKOP,KOLVO_DAYS,SUMMA_1,SUMMA_2,SUMMA_BONUS,PROC_BONUS,KREDIT_MINUS,ODNORAZ,VIDAN,CHECK_DATA_OUT,DATA_OUT,OGR,OGR_SUM,OGR_KDAYS,BONUS_LIMIT_DATA,EMAIL,SUM_BROSH,ID_SKLDKI, ID)" + 
					" VALUES (?,1,?,3,'������ �� �������,���� ����� ���� ���� ���.�����',30.00,0,null,{ts '2020-03-20 00:00:00'},{ts '2020-03-20 00:00:00'},'','','',0.00,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,3, ?)";
			  BaseDAOUtils.executeUpdate(getConnection(), sql, Arrays.asList(tabNumber, name, Integer.valueOf(tabNumber)), false);

		}
	  
	  /**
	   * 
	   * �������� ��� ��������� �����
	   * 
	   * @param code ���
	   * @return ��� ��������� �����
	   */
	  public String getCardName(String code) {
		  return BaseDAOUtils.executeStatementAndReadObject(getConnection()
				  , "SELECT fio FROM sp_sk_kard WHERE kod_kard = ?", Arrays.asList(code), new BaseDAOUtils.StringFromResultSetTransformator(), false);
	  }
	  
	  /**
	   * 
	   * ������� ��������� ����� �� ��������� �����
	   * 
	   * @param tabNumber ��������� ����� ����������
	   * @param name ��� ����������
	   * @throws PersistenceException
	   */
	  public void removeCardFromBuffet(String tabNumber) throws PersistenceException {
		  BaseDAOUtils.executeUpdate(getConnection()
				  , "DELETE FROM SP_SK_KARD WHERE KOD_KARD = ?", Arrays.asList(tabNumber), false);
		}
	  
	  /**
	   * 
	   * �������� ��� �����
	   * 
	   * @param oldValue ������ ���
	   * @param newValue ����� ���
	   * @throws PersistenceException
	   */
	  public void updateCode(String oldValue, String newValue) throws PersistenceException {
		  BaseDAOUtils.executeUpdate(getConnection()
				  , "UPDATE sp_sk_kard SET kod_kard = ? WHERE kod_kard = ?", Arrays.asList(newValue, oldValue), false);
		}
	  
	  /**
	   * 
	   * �������� ��������� ����� ���������� ���������� � ��������� �����
	   * 
	   * @param tabNumber ��������� ����� ���������� ����������
	   * @param name ��� ���������� ����������
	   * @throws PersistenceException
	   */
	  public void addDismissedCardToBuffet(String tabNumber, String name) throws PersistenceException {
		  BaseDAOUtils.executeUpdate(getConnection()
				  , "INSERT INTO SP_SK_KARD_DISMISSED (KOD_KARD, FIO) VALUES (?,?)", Arrays.asList(tabNumber, name), false);
		}
	  
	  /**
	   * 
	   * ���������� ������ ����� ��������� ���� �� ��������� �����
	   * 
	   * @return ������ ����� ��������� ����
	   */
	  public List<String> getCardCodes() {
		  	List<String> DecimalDigits = Arrays.asList("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
			return BaseDAOUtils.executeStatementAndReadObjects(this.getConnection()
					, String.format("SELECT kod_kard FROM sp_sk_kard WHERE substring(kod_kard FROM 1 FOR 1) IN (%s)"
							, Tools.repeatSymbol("?", ",", DecimalDigits.size()))
					, DecimalDigits, new BaseDAOUtils.StringFromResultSetTransformator(), false);
		}
}
