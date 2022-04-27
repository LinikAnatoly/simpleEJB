
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  import java.math.BigDecimal;
import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENWarrantDAO;

/**
  * EJB Controller for ENWarrant;
  *
  */



import com.ksoe.energynet.ejb.generated.ENWarrantControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENDocAttachment;
import com.ksoe.energynet.valueobject.ENWarrant;
import com.ksoe.energynet.valueobject.ENWarrantStatus;
import com.ksoe.energynet.valueobject.ENWarrantType;
import com.ksoe.energynet.valueobject.filter.ENWarrantFilter;
import com.ksoe.energynet.valueobject.lists.ENWarrantShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENWarrantControllerEJB extends ENWarrantControllerEJBGen {

  /**
	 *
	 */
	private static final long serialVersionUID = 1L;

public ENWarrantControllerEJB() {}


	@Override
	public int add(ENWarrant enWarrant) {
		return add(enWarrant, null, null, null);
	}

	public int add(ENWarrant enWarrant, ENDocAttachment attachment, byte[] aFile, String fileName) {
		try {
			ENWarrantDAO objectDAO = new ENWarrantDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			enWarrant.setDomain_info(null);

			this.checkAuth(enWarrant);
			this.processStrings(enWarrant);

			if (enWarrant.warrantTypeRef.code == ENWarrantType.FROM_SIDE || enWarrant.warrantTypeRef.code == ENWarrantType.RQFORDER ) {
				enWarrant.warrantStatusRef.code = ENWarrantStatus.ACTIVE;
				enWarrant.maxSum = BigDecimal.ZERO;
				enWarrant.power = 0;
			}
			
			if(enWarrant.warrantShortFIO == null || enWarrant.warrantShortFIO.equals("")) {
				enWarrant.warrantShortFIO = enWarrant.personSurname + " " + enWarrant.personName.substring(0,1) + "." + enWarrant.personPatronimic.substring(0,1) + "."; 
		    }

			int warrantCode = objectDAO.add(enWarrant);
			
			


			if (attachment != null) {

				Context cnt = new InitialContext();
            	Object object = cnt.lookup(ENDocAttachment2ENWarrantController.JNDI_NAME);

            	ENDocAttachment2ENWarrantControllerHome warrantControllerHome = (ENDocAttachment2ENWarrantControllerHome) PortableRemoteObject
    					.narrow(object, ENDocAttachment2ENWarrantControllerHome.class);
            	ENDocAttachment2ENWarrantController docAttachment2ENWarrantController = warrantControllerHome.create();

            	docAttachment2ENWarrantController.add(attachment, aFile, fileName, warrantCode);
			}


		    return warrantCode;

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENWarrant%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (RemoteException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	@Override
	public void remove(int code) {
		try {
			ENWarrantDAO objectDAO = new ENWarrantDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENWarrant object = objectDAO.getObject(code);

			this.checkAuth(object);

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENWarrant%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	@Override
	public void save(ENWarrant object) {
		try {
			ENWarrantDAO objectDAO = new ENWarrantDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.setDomain_info(null);

		    ENWarrant oldObject = objectDAO.getObject(object.code);
		    
		    if(object.warrantShortFIO == null || object.warrantShortFIO.equals("")) {
		    	object.warrantShortFIO = object.personSurname + " " + object.personName.substring(0,1) + "." + object.personPatronimic.substring(0,1) + "."; 
		    }

		    if(oldObject.warrantTypeRef.code != object.warrantTypeRef.code) {
		    	throw new SystemException("Неможливо змінити тип у довіреності!");
		    }

		    this.checkAuth(object);
		    this.processStrings(object);

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENWarrant%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	public ENWarrantShortList getScrollableFilteredList(
			ENWarrantFilter filterObject, int fromPosition,
			int quantity, int typeCode) {
		try {
			ENWarrantDAO objectDAO = new ENWarrantDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			Integer iTypeCode = null;
			if(typeCode != Integer.MIN_VALUE) iTypeCode = typeCode;

			return objectDAO.getScrollableFilteredList(filterObject
					, filterObject.conditionSQL
					, filterObject.orderBySQL
					, fromPosition
					, quantity
					, null
					, iTypeCode);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list of {%com.ksoe.energynet.valueobject.ENWarrant%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	  private void checkAuth(ENWarrant object) throws DatasourceConnectException {

		  if(object == null) throw new java.lang.NullPointerException("Не задана довіренність");

		  AuthLogic authLogic = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  if(object.warrantTypeRef == null || object.warrantTypeRef.code == Integer.MIN_VALUE) {
			  throw new SystemException("Не визначений тип довіернності");
		  }

		  switch(object.warrantTypeRef.code) {
		  case ENWarrantType.INNER:
			  authLogic.checkPermission(ENWarrantController.JNDI_NAME, "editENWarrantInner");
			  break;
		  case ENWarrantType.FROM_SIDE:
			  /* Пока ничего не проверяется, те кто имеют права редактировать
			  	доверенности предприятия будут иметь доступ редактировать доверенности для сторонних организаций
			  	они же все-таки юристы :D
			  */
			  break;
		  }
	  }

	  private void processStrings(ENWarrant object) {
		  this.checkNullStrings("Не задане прізвище довіреної особи!", object.personSurname, object.personSurnameGenitive);
		  this.checkNullStrings("Не задане ім'я довіреної особи!", object.personName, object.personNameGenitive);
		  this.checkNullStrings("Не задане по-батькові довіреної особи!", object.personPatronimic, object.personPatronimic);

		  object.personSurname = object.personSurname.trim();
		  object.personName = object.personName.trim();
		  object.personPatronimic = object.personPatronimic.trim();

		  object.personSurnameGenitive = object.personSurnameGenitive.trim();
		  object.personNameGenitive = object.personNameGenitive.trim();
		  object.personPatronimicGenitive = object.personPatronimicGenitive.trim();

		  if(object.address != null) object.address = object.address.trim();
		  if(object.name != null) object.name = object.name.trim();
		  if(object.numbergen != null) object.numbergen = object.numbergen.trim();
		  if(object.warrantPosition != null) object.warrantPosition = object.warrantPosition.trim();
		  if(object.genitivePosition != null) object.genitivePosition = object.genitivePosition.trim();
		  if(object.passport != null) object.passport = object.passport.trim();
		  if(object.warrantShortFIO != null) object.warrantShortFIO = object.warrantShortFIO.trim();

		  object.warrantFIO = String.format("%s %s %s", object.personSurname, object.personName, object.personPatronimic);
		  object.genitiveFIO = String.format("%s %s %s"
				  , object.personSurnameGenitive, object.personNameGenitive, object.personPatronimicGenitive);

	  }

	  private void checkNullStrings(String errMsg, String... values) {
		  if(values != null) {
			  for(String value : values) {
				  if(value == null || value.trim().length() == 0) {
					  throw new SystemException(errMsg);
				  }
			  }
		  }
	  }




	/**
	 * Изменить доверенность на не черновом договоре
	 *
	 * @param servicesObjectCode
	 * @param warrantCode
	 */
	public void changeWarrant(int servicesObjectCode, int warrantCode) {
		try {

			ServicesLogic soLogic = new ServicesLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			soLogic.changeWarrant(servicesObjectCode, warrantCode);

        } catch (DatasourceConnectException e) {
        	throw new SystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }



} // end of EJB Controller for ENWarrant