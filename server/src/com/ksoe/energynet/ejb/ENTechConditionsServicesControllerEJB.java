
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
* EJB Controller for ENTechConditionsServices;
*
*/

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.CNPackDAO;
import com.ksoe.energynet.dataminer.CNRen2ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENContragentDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENServicesContractStatusDAO;
import com.ksoe.energynet.dataminer.ENServicesObject2TechCondtnsServicesDAO;
import com.ksoe.energynet.dataminer.ENServicesObjectDAO;
import com.ksoe.energynet.dataminer.ENTechCond2PlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTechCondResponsiblesDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsObjectsDAO;
import com.ksoe.energynet.dataminer.ENTechConditionsServicesDAO;
import com.ksoe.energynet.dataminer.ENWarrantDAO;
import com.ksoe.energynet.ejb.generated.ENTechConditionsServicesControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.valueobject.CNPack;
import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.CNTechTerms;
import com.ksoe.energynet.valueobject.ENBasisType;
import com.ksoe.energynet.valueobject.ENConnectionKind;
import com.ksoe.energynet.valueobject.ENConnectionPowerPoint;
import com.ksoe.energynet.valueobject.ENContragent;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENPowerReliabilityCategory;
import com.ksoe.energynet.valueobject.ENServicesContractStatus;
import com.ksoe.energynet.valueobject.ENServicesContractType;
import com.ksoe.energynet.valueobject.ENServicesContragentType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENServicesObject2TechCondtnsServices;
import com.ksoe.energynet.valueobject.ENServicesObjectStatus;
import com.ksoe.energynet.valueobject.ENTechCondResponsibles;
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.energynet.valueobject.ENTechConditionsServices;
import com.ksoe.energynet.valueobject.ENTechConditionsServicesStatus;
import com.ksoe.energynet.valueobject.ENTechConditionsServicesType;
import com.ksoe.energynet.valueobject.ENTechContragentForm;
import com.ksoe.energynet.valueobject.ENTechContragentType;
import com.ksoe.energynet.valueobject.ENWarrant;
import com.ksoe.energynet.valueobject.filter.ENContragentFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2TechCondtnsServicesFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCond2PlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENTechCondResponsiblesFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsObjectsFilter;
import com.ksoe.energynet.valueobject.filter.ENTechConditionsServicesFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.netobjects.dataminer.ENSubstation04DAO;
import com.ksoe.netobjects.dataminer.ENSubstation150DAO;
import com.ksoe.netobjects.ejb.ENPriconData2TechServicesController;
import com.ksoe.netobjects.ejb.ENPriconData2TechServicesControllerHome;
import com.ksoe.netobjects.logic.PriconnectionDataLogic;
import com.ksoe.netobjects.valueobject.ENPriconData2TechServices;
import com.ksoe.netobjects.valueobject.ENPriconnectionData;
import com.ksoe.netobjects.valueobject.ENSubstation04;
import com.ksoe.netobjects.valueobject.ENSubstation150;

public class ENTechConditionsServicesControllerEJB extends
       ENTechConditionsServicesControllerEJBGen {

   public ENTechConditionsServicesControllerEJB() {
   }

   @Override
public int add(ENTechConditionsServices object) {
    return this.add(object, true);
   }

   /* ENTechConditionsServices. Добавить */
   public int add(ENTechConditionsServices object, boolean isClient) {
       try {
           if (! object.contractNumber.equals("AUTO"))
           {
               throw new EnergyproSystemException(
                 "\n SUPP-11597. Номер договору про приєднання повинен бути заповненим." +
                 "\n Ви користуєтесь застарілою версією програми! Перезайдіть, будь ласка, у програму!");
           }

           AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

           /** 17.04.2013 +++ разрешаем работу с договорами на проектирование и реализацию по старым Тех.Условиям  */
           if (isClient && object.connectionKindRef.code != ENConnectionKind.GENERAL_CONNECTION
                   && !auth.checkPermissionSilent("ksoe/energynet/ENTechConditionsServicesController", "editTechConditions")) {
               throw new EnergyproSystemException("\n SUPP-2728..." +
                "\n Додавати можливо лише договори на проектування або реалізацію!!!");
           }

           int cnSubsystemCode = Integer.MIN_VALUE;

           if (object.cnSubsystemTypeRef != null)
           {
               cnSubsystemCode = object.cnSubsystemTypeRef.code;
           }

           // Если привязывают к пакету из EnergyWorkflow, но не указан код подсистемы
           if (object.cnPackCode != Integer.MIN_VALUE && cnSubsystemCode == Integer.MIN_VALUE)
           {
               throw new EnergyproSystemException(
                 "\n SUPP-11597. Неможливо СТВОРИТИ НОВИЙ запис таблиці " +
                 "\n Реалізації Технічних Умов, якщо не визначено код підсистеми EnergyWorkflow." +
                 "\n Ви користуєтесь застарілою версією програми! Перезайдіть, будь ласка, у програму!");
           }


           /**
            *   NET-3971
            *   22.12.2012 +++ проверка доверенности
            *   SUPP-4358
            *   11.06.2013 +++ изменено до 100
            */


           if (object.tyServicesPower != null
                   && object.warrantRef != null && object.warrantRef.code != Integer.MIN_VALUE) {

               ENWarrantDAO warrantDAO = new ENWarrantDAO(getUserProfile(),
                      getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
               ENWarrant warrant = warrantDAO.getObject(object.warrantRef.code);


               //SUPP-4539. Проверка должна осуществляться только для договоров
               //о Проектировании, Реализации, Обеспечении объекта строительства
               if (object.connectionKindRef.code == ENConnectionKind.GENERAL_CONNECTION
               && warrant.power > 100) {
                   if (object.tyServicesPower.doubleValue() <= 100) {
                       throw new EnergyproSystemException("\n"
                                       + "\n Довіреність не відповідає договору!!!"
                                       + "\n Оберіть довіреність відповідно договору!!!");
                   }
               }
           }

           /**
            *  NET-4200
            *  21.01.2013 +++ ставки платы применяются
            *  при стандартном присоединении
            *  пока только до 16 кВт....
            *
            *  NET-4434
            *  Розпорядження №Гет-620 від 31.12.2014 р.
            *  до 50 кВт....
            */

           if (object.connectionKindRef.code == ENConnectionKind.STANDART
                   && object.tyServicesPower.doubleValue() > 160) {
               throw new EnergyproSystemException("\n" +
                       "\n Ставка плати застосовується тільки для стандартного приєднання " +
                       "\n електроустановок до 160 кВт!!!");
           }


           object.setDomain_info(null);

           object.dateEdit = new Date();
           object.userGen = getUserProfile().userName;

           ENElement e = new ENElement();
           e.typeRef.code = ENElementType.TECHCONDITIONSSERVICES;

           if (object.techCondServicesType.code != ENTechConditionsServicesType.DESIGN
                   && object.techCondServicesType.code != ENTechConditionsServicesType.BUILDING) {
               throw new EnergyproSystemException(
                       "Невідомий тип договру!!!");
           }

           ENElementDAO elementDAO = new ENElementDAO(getUserProfile(),
                   getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

           if (object.element.renRef != null) {
               if (object.element.renRef.code != Integer.MIN_VALUE) {
                   e.renRef.code = object.element.renRef.code;
               }
           }

           if (e.renRef.code == Integer.MIN_VALUE) {
               e.renRef.code = 0;
           }

           object.element.code = elementDAO.add(e);
           object.element.renRef.code = e.renRef.code;
           object.element.typeRef.code = e.typeRef.code;

           object.techCondServicesStatus.code = ENTechConditionsServicesStatus.NEW;

           ENTechConditionsServicesDAO objectDAO = new ENTechConditionsServicesDAO(
                   getUserProfile(),
                   getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

           // 09.04.12 Генерим номер автоматически
           object.contractNumber = "" + objectDAO._collectAutoIncrementNumber();

           return objectDAO.add(object);
       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException(
                   "Can't add {%com.ksoe.energynet.valueobject.ENTechConditionsServices%} object.",
                   e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }


   @Override
public void save(ENTechConditionsServices object) {
       save(object, true);
   }

   /* ENTechConditionsServices. Изменить */
   public void save(ENTechConditionsServices object, boolean isClient) {
       try {

        if (object.techCondServicesStatus != null) {
            if (object.techCondServicesStatus.code != ENTechConditionsServicesStatus.NEW) {
                throw new EnergyproSystemException(
                        "Змінювати вже проведені договори заборонено!");
            }
        }

           /*
           AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

           /** 17.04.2013 +++ разрешаем работу с договорами на проектирование и реализацию по старым Тех.Условиям  */
           /*if (isClient && object.connectionKindRef.code != ENConnectionKind.GENERAL_CONNECTION
                   && !auth.checkPermissionSilent("ksoe/energynet/ENTechConditionsServicesController", "editTechConditions")) {
               throw new EnergyproSystemException("\n SUPP-2728..." +
                   "\n Редагувати можливо лише договори на проектування або реалізацію!!!");
           }
           */


           /** NET-4251... +++ определение резерва должно происходить по данным о ТП на дату составления договора */
           if (object.connectionKindRef.code == ENConnectionKind.NO_STANDART) {
               if (object.s04Ref.code != Integer.MIN_VALUE
                       || object.s35Ref.code != Integer.MIN_VALUE) {

                   int s04ElementCode = Integer.MIN_VALUE;
                   int s150ElementCode = Integer.MIN_VALUE;

                   if (object.s04Ref.code != Integer.MIN_VALUE) {
                       ENSubstation04DAO s04Dao = new ENSubstation04DAO(
                               getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                       ENSubstation04 s04 = s04Dao.getObject(object.s04Ref.code);
                       s04ElementCode = s04.element.code;
                   }

                   if (object.s35Ref.code != Integer.MIN_VALUE) {
                       ENSubstation150DAO s150Dao = new ENSubstation150DAO(
                               getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                       ENSubstation150 s150 = s150Dao.getObject(object.s35Ref.code);
                       s150ElementCode = s150.element.code;
                   }

                   int elementCodeArr[] = {};

                    if (s04ElementCode != Integer.MIN_VALUE) {
                       int elementCodeArr1[] = { s04ElementCode };
                       elementCodeArr = elementCodeArr1;
                    }

                    if (s150ElementCode != Integer.MIN_VALUE) {
                        int elementCodeArr2[] = { s150ElementCode };
                        elementCodeArr = elementCodeArr2;
                    }

                    if (s04ElementCode != Integer.MIN_VALUE && s150ElementCode != Integer.MIN_VALUE) {
                        int elementCodeArr3[] = { s04ElementCode, s150ElementCode};
                        elementCodeArr = elementCodeArr3;
                    }

                    for (int g = 0; g < elementCodeArr.length; g++) {
                       PriconnectionDataLogic dataLogic = new PriconnectionDataLogic(
                               getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                       ENPriconnectionData data = dataLogic.getCalculationDataObject(elementCodeArr[g], object.code, ENPriconnectionData.PRIMARY_SUBSTATION);

                       ENPriconData2TechServices data2tcs = new ENPriconData2TechServices();

                       data2tcs.powerMaxCurrent = data.powerMaxCurrent;
                       data2tcs.powerReserveCurrent = data.powerReserveCurrent;
                       data2tcs.coeffUsage = data.coeffUsage;
                       data2tcs.priceCurrent = data.priceCurrent;
                       data2tcs.powerContractTotal = data.powerContractTotal;
                       data2tcs.powerContractByt = data.powerContractByt;
                       data2tcs.powerContractProm = data.powerContractProm;
                       data2tcs.powerContractTU = data.powerContractNewTU;
                       data2tcs.countCustomer = data.countCustomer;
                       data2tcs.countCustomerByt = data.countCustomerByt;
                       data2tcs.countCustomerProm = data.countCustomerProm;
                       data2tcs.t1powerCurrent = data.t1powerCurrent;
                       data2tcs.t2powerCurrent = data.t2powerCurrent;
                       data2tcs.t3powerCurrent = data.t3powerCurrent;
                       data2tcs.dateGen = new Date();
                       data2tcs.techCondServRef.code = object.code;
                       data2tcs.elementRef.code = elementCodeArr[g];

                       try {
                           Context cnt = new InitialContext();
                           Object data2techRef = cnt.lookup(ENPriconData2TechServicesController.JNDI_NAME);
                           ENPriconData2TechServicesControllerHome data2techHome = (ENPriconData2TechServicesControllerHome) PortableRemoteObject
                                   .narrow(data2techRef, ENPriconData2TechServicesControllerHome.class);
                           ENPriconData2TechServicesController data2techController = data2techHome.create();
                           data2techController.add(data2tcs);

                       } catch (NamingException e) {
                           throw new EnergyproSystemException(e.getMessage(),e);
                       } catch (RemoteException e) {
                           throw new EnergyproSystemException(e.getMessage(),e);
                       } catch (CreateException e) {
                           throw new EnergyproSystemException(e.getMessage(),e);
                       }
                   }
               }
           }


           /**
            *   NET-3971
            *   22.12.2012 +++ проверка доверенности
            *   SUPP-4358
            *   11.06.2013 +++ изменено до 100
            */

           //SUPP-4539. Проверка должна осуществляться только для договоров
           //о Проектировании, Реализации, Обеспечении объекта строительства
           if (object.connectionKindRef.code == ENConnectionKind.GENERAL_CONNECTION
                && object.tyServicesPower != null
                   && object.warrantRef != null && object.warrantRef.code != Integer.MIN_VALUE) {

               ENWarrantDAO warrantDAO = new ENWarrantDAO(getUserProfile(),
                      getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
               ENWarrant warrant = warrantDAO.getObject(object.warrantRef.code);

               /** SUPP-5130... 11.07.2013 +++ если мощность в договоре превышает граничную мощность в доверенности */
               if (object.tyServicesPower.doubleValue() > warrant.power) {
               //    if (object.tyServicesPower.doubleValue() <= 100) {
                       throw new EnergyproSystemException("\n"
                                       + "\n Довіреність не відповідає договору!!!"
                                       + "\n Оберіть довіреність відповідно договору!!!");
               //    }
               }
           }

           /**
            *  NET-4200
            *  21.01.2013 +++ ставки платы применяются
            *  при стандартном присоединении
            *  пока только до 16 кВт....
            *
            *  NET-4434
            *  Розпорядження №Гет-620 від 31.12.2014 р.
            *  до 50 кВт....
            *
            */

           if (object.connectionKindRef.code == ENConnectionKind.STANDART
                   && object.tyServicesPower.doubleValue() > 160) {
               throw new EnergyproSystemException("\n" +
                       "\n Ставка плати застосовується тільки для стандартного приєднання " +
                       "\n електроустановок до 160 кВт!!!");
           }


           object.setDomain_info(null);

           ENTechConditionsServicesDAO objectDAO = new ENTechConditionsServicesDAO(
                   getUserProfile(),
                   getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


           object.dateEdit = new Date();
           object.userGen = getUserProfile().userName;

           ENElement el = new ENElement();
           ENElementDAO elDAO = new ENElementDAO(getUserProfile(),
                   getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

           el = elDAO.getObject(object.element.code);

           if (object.element.renRef != null) {
               if (object.element.renRef.code != Integer.MIN_VALUE) {
                   el.renRef.code = object.element.renRef.code;
               }
           }

           if (el.renRef.code == Integer.MIN_VALUE) {
               el.renRef.code = 0;
           }

           elDAO.save(el);

           objectDAO.save(object);
       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException(
                   "Can't save {%com.ksoe.energynet.valueobject.ENTechConditionsServices%} object.",
                   e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }

   @Override
public void remove(int code) {
       remove(code, true);
   }

   /* ENTechConditionsServices. Удалить */
   public void remove(int code, boolean isClient) {
       try {
           ENTechConditionsServicesDAO objectDAO = new ENTechConditionsServicesDAO(
                   getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           ENTechConditionsServices object = objectDAO.getObject(code);

           AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

           /** 17.04.2013 +++ разрешаем работу с договорами на проектирование и реализацию по старым Тех.Условиям  */
           if (isClient && object.connectionKindRef.code != ENConnectionKind.GENERAL_CONNECTION
                   && !auth.checkPermissionSilent("ksoe/energynet/ENTechConditionsServicesController", "editTechConditions")) {
                throw new EnergyproSystemException("\n SUPP-2728..." +
                   "\n Редагувати можливо лише договори на проектування або реалізацію!!!");
           }

           // Ну такого не будет - у нас сам договор объектом плана не является
           ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
                  getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           ENPlanWorkFilter planFilter = new ENPlanWorkFilter();
           planFilter.elementRef.code = object.element.code;
           int[] plArr = planDAO.getFilteredCodeArray(planFilter, 0, -1);
           if (plArr.length > 0) {
               throw new EnergyproSystemException(
                       "Видаляти не можна!!! Для цього об’єкту існують плани!!! ");
           }

               /* Если есть планы, то бортуем - удалять договор нельзя */
               ENTechCond2PlanWorkDAO ty2plDAO = new ENTechCond2PlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
             ENTechCond2PlanWorkFilter ty2plFilter = new ENTechCond2PlanWorkFilter();
             ty2plFilter.techConServicesRef.code = code;
             int ty2plArr[] = ty2plDAO.getFilteredCodeArray(ty2plFilter, 0, -1);

             if (ty2plArr.length > 0) {
                 throw new EnergyproSystemException("За цим договором вже складені плани! Спочатку видаліть плани!");
             }

             /*SUPP-4846 Если есть замовники - то выводится ошибка*/
             ENContragentDAO contragentDAO = new ENContragentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
             ENContragentFilter contragentFilter = new ENContragentFilter();
             contragentFilter.techCondServicesRef.code = code;
             int[] contragentCodes = contragentDAO.getFilteredCodeArray(contragentFilter, 0, -1);

             if(contragentCodes.length > 0)
                throw new EnergyproSystemException("За цим договором вже введені замовники! Спочатку видаліть їх!");

           objectDAO.remove(code);

           ENElementDAO elDAO = new ENElementDAO(getUserProfile(),
                   getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           elDAO.remove(object.element.code);

       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException(
                   "Can't remove {%com.ksoe.energynet.valueobject.ENTechConditionsServices%} object.",
                   e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }

   public void signed(int code) {
       signed(code, true);
   }

   public void signed(int code, boolean isClient) {
       try {
           ENTechConditionsServicesDAO objDAO = new ENTechConditionsServicesDAO(getConnection(
                   AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           ENTechConditionsServices obj = objDAO.getObject(code);

           /*
           AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

           /** 17.04.2013 +++ разрешаем работу с договорами на проектирование и реализацию по старым Тех.Условиям  */
           /*if (isClient && obj.connectionKindRef.code != ENConnectionKind.GENERAL_CONNECTION
                   && !auth.checkPermissionSilent("ksoe/energynet/ENTechConditionsServicesController", "editTechConditions")) {
               throw new EnergyproSystemException("\n SUPP-2728..." +
                "\n Редагувати можливо лише договори на проектування або реалізацію!!!");
           }
           */

           if (obj.techCondServicesStatus.code == ENTechConditionsServicesStatus.SIGNED)
           {
              throw new EnergyproSystemException("Договор вже підписаний!");
           }

           if (obj.techCondServicesStatus.code == ENTechConditionsServicesStatus.COMPLETED)
           {
              throw new EnergyproSystemException("Змінювати вже завершені договори заборонено!");
           }

           if (obj.finDocID == Integer.MIN_VALUE)
           {
               throw new EnergyproSystemException("Не вибрано договір з Фін. Колекції!");
           }


           ///// Проверка на кол-во Заказчиков в договоре
           ENContragentDAO contragentDAO = new ENContragentDAO(
        		   getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           ENContragentFilter contragentFilter = new ENContragentFilter();
           contragentFilter.techCondServicesRef.code = code;
           int[] contragentsArr = contragentDAO.getFilteredCodeArray(contragentFilter, 0, -1);
           if (contragentsArr.length == 0)
           {
               throw new EnergyproSystemException("Не введені замовники за договором!");
           }

           if (obj.contragentForm.code == ENTechContragentForm.INDIVIDUAL)
           {
               if (contragentsArr.length != 1)
               {
                   throw new EnergyproSystemException("В індивідуальних договорах може бути лише один замовник! Змініть вид договора на \"Солідарний\"!");
               }
           }

           if (obj.contragentForm.code == ENTechContragentForm.SOLIDARY)
           {
               if (contragentsArr.length < 2)
               {
                   throw new EnergyproSystemException("В солідарних договорах повинно бути кілька замовників!");
               }
           }
           /////

           obj.techCondServicesStatus.code = ENTechConditionsServicesStatus.SIGNED;
           objDAO.save(obj);

       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException("Can't sign ENTechConditionsServices.Code = " + code, e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }


   public void unSigned(int code) {
       unSigned(code, true);
   }

   public void unSigned(int code, boolean isClient) {
       try {
           ENTechConditionsServicesDAO objDAO = new ENTechConditionsServicesDAO(getConnection(
                   AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           ENTechConditionsServices obj = objDAO.getObject(code);

           /*
           AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

           /** 17.04.2013 +++ разрешаем работу с договорами на проектирование и реализацию по старым Тех.Условиям  */
           /*
            if (isClient && obj.connectionKindRef.code != ENConnectionKind.GENERAL_CONNECTION
                   && !auth.checkPermissionSilent("ksoe/energynet/ENTechConditionsServicesController", "editTechConditions")) {
               throw new EnergyproSystemException("\n SUPP-2728..." +
                "\n Редагувати можливо лише договори на проектування або реалізацію!!!");
           }
           */

           if (obj.techCondServicesStatus.code == ENTechConditionsServicesStatus.COMPLETED)
           {
              throw new EnergyproSystemException("Змінювати вже завершені договори заборонено!");
           }

           if (obj.techCondServicesStatus.code != ENTechConditionsServicesStatus.SIGNED)
           {
              throw new EnergyproSystemException("Договорів не підписаний!");
           }


           obj.techCondServicesStatus.code = ENTechConditionsServicesStatus.NEW;
           objDAO.save(obj);

       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException("Can't unSign ENTechConditionsServices.Code = " + code, e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }


   public void completed(int code) {
       completed(code, true);
   }

   public void completed(int code, boolean isClient) {
       try {
           ENTechConditionsServicesDAO objDAO = new ENTechConditionsServicesDAO(getConnection(
                   AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           ENTechConditionsServices obj = objDAO.getObject(code);

           AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

           /** 17.04.2013 +++ разрешаем работу с договорами на проектирование и реализацию по старым Тех.Условиям  */
           if (isClient
                   && obj.connectionKindRef.code != ENConnectionKind.GENERAL_CONNECTION
                   && !auth.checkPermissionSilent("ksoe/energynet/ENTechConditionsServicesController", "editTechConditions")) {
               throw new EnergyproSystemException("\n SUPP-2728..." +
                       "\n Редагувати можливо лише договори на проектування або реалізацію!!!");
           }

           if (obj.techCondServicesStatus.code == ENTechConditionsServicesStatus.COMPLETED)
           {
              throw new EnergyproSystemException("Роботи за договором вже завершені!");
           }

           obj.techCondServicesStatus.code = ENTechConditionsServicesStatus.COMPLETED;
           objDAO.save(obj);

       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException("Can't complete ENTechConditionsServices.Code = " + code, e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }


   public void unCompleted(int code) {
       unCompleted(code, true);
   }

   public void unCompleted(int code, boolean isClient) {
       try {
           ENTechConditionsServicesDAO objDAO = new ENTechConditionsServicesDAO(getConnection(
                   AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           ENTechConditionsServices obj = objDAO.getObject(code);

           AuthLogic auth = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

           /** 17.04.2013 +++ разрешаем работу с договорами на проектирование и реализацию по старым Тех.Условиям  */
           if (isClient
                   && obj.connectionKindRef.code != ENConnectionKind.GENERAL_CONNECTION
                   && !auth.checkPermissionSilent("ksoe/energynet/ENTechConditionsServicesController", "editTechConditions")) {
               throw new EnergyproSystemException("\n SUPP-2728..." +
                   "\n Редагувати можливо лише договори на проектування або реалізацію!!!");
           }

           if (obj.techCondServicesStatus.code != ENTechConditionsServicesStatus.COMPLETED)
           {
              throw new EnergyproSystemException("Переводити у статус \"Підписаний\" можливо лише закриті договори!!!");
           }

           obj.techCondServicesStatus.code = ENTechConditionsServicesStatus.SIGNED;
           objDAO.save(obj);

       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException("Can't unComplete ENTechConditionsServices.Code = " + code, e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }

   public void bind2CNPack(int objectCode, int cnPackCode, int cnSubsystemCode)
   {
       try {
           ENTechConditionsServicesDAO objDAO = new ENTechConditionsServicesDAO(getConnection(
                   AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
           ENTechConditionsServices obj = objDAO.getObject(objectCode);

           obj.cnPackCode = cnPackCode;
           obj.cnSubsystemTypeRef.code = cnSubsystemCode;
           objDAO.save(obj);

       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException("Can't bind2CNPack ENTechConditionsServices.Code = " + objectCode, e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }

   public String getActsListByCnPackCode(int cnPackCode) {
       // По дефолту вызываем для подсистемы "Присоединение с 14.03.2011 г."
       return getActsListByCnPackCode(cnPackCode, CNSubsystemType.SS_CONNECTION_20110314);
   }

   /* список проведённых актов к договору по коду пакета */
   public String getActsListByCnPackCode(int cnPackCode, int cnSubsystemCode) {
       try {
           ENTechConditionsServicesDAO objectDAO = new ENTechConditionsServicesDAO(
                   getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           return objectDAO.getActsListByCnPackCode(cnPackCode, cnSubsystemCode);
       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException(
                   "Can't get list Acts List By CnPackCode",
                   e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }

   public ENTechCondResponsibles getResponsiblePerson(ENTechConditionsServices techCondServices)
   {
       //return getResponsiblePerson(techCondServices.tyServicesPower, techCondServices.department.code);
       try {

        ENTechCondResponsiblesDAO respDAO = new ENTechCondResponsiblesDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
        if (techCondServices.techCondResponsiblesRef.code != Integer.MIN_VALUE)
        {
            return respDAO.getObject(techCondServices.techCondResponsiblesRef.code);
        }

           if (techCondServices.tyServicesPower == null)
           {
               throw new EnergyproSystemException("Неможливо визначити відповідальну особу, тому що не вказано потужність за договором!");
           }

           if (techCondServices.department.code == Integer.MIN_VALUE)
           {
               throw new EnergyproSystemException("Неможливо визначити відповідальну особу, тому що не вказано підрозділ у договорі!");
           }

           ENTechCondResponsiblesFilter respFilter = new ENTechCondResponsiblesFilter();

           // Если мощность > 100 кВт, ищем по граничной мощности (> 100), если нет - по граничной мощности и подразделению
           // NET-1911 Гука убрали теперь распределятся все что больше 5 кВ  между тремя пользователями.
           /*if (power.doubleValue() >= 100)
           {

               respFilter.conditionSQL = "power > " + power;

           }
           else
           {
               respFilter.conditionSQL = "power >= " + power +
                                         " and entechcondresponsibles.code in " +
                                         " (select rd.techcondresponsblsrfcd " +
                                         "       from entechcondrespnsbls2dp rd " +
                                         "      where rd.departmentrefcode = " + departmentCode + ")";
           }*/


           /*if (techCondServices.tyServicesPower.doubleValue() >= 100000)
           {
               respFilter.conditionSQL = "power > " + techCondServices.tyServicesPower;
           }
           else
           {
               // Все юр. лица ХГЭС, независимо от мощности - одно закрепленное отв. лицо в Облэнерго!!!
               if (techCondServices.contragentTypeRef.code == ENTechContragentType.JURIDICAL &&
                   techCondServices.department.code == ENConsts.ENDEPARTMENT_HGES)
               {
                   respFilter.conditionSQL = "power > 5 " +
                     " and entechcondresponsibles.code in " +
                     " (select rd.techcondresponsblsrfcd " +
                     "       from entechcondrespnsbls2dp rd " +
                     "      where rd.departmentrefcode = " + ENConsts.ENDEPARTMENT_HGES + ")";
               }
               else
               {
                   respFilter.conditionSQL = "power >= " + techCondServices.tyServicesPower +
                                             " and entechcondresponsibles.code in " +
                                             " (select rd.techcondresponsblsrfcd " +
                                             "       from entechcondrespnsbls2dp rd " +
                                             "      where rd.departmentrefcode = " + techCondServices.department.code + ")";
               }
           }*/

           //SUPP-3661



           if (techCondServices.tyServicesPower.doubleValue() >= 100000)
           {
               respFilter.conditionSQL = "power > " + techCondServices.tyServicesPower;
           }
           else
           {
            ENTechConditionsObjectsDAO tcoDAO = new ENTechConditionsObjectsDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTechConditionsObjectsFilter tcoFilter = new ENTechConditionsObjectsFilter();
            tcoFilter.conditionSQL =
                " entechconditionsobjcts.code = (select encontragent.techconobjectscode " +
                "   from encontragent where encontragent.techcondservicesrefcod = " + techCondServices.code + ")" +
                " and entechconditionsobjcts.powerpointrefcode in (" + ENConnectionPowerPoint.TENSION_6_10 + ", " +
                ENConnectionPowerPoint.TENSION_27_35 + ", " + ENConnectionPowerPoint.TENSION_110_154 + ")";

            int[] tcoCodeArr = tcoDAO.getFilteredCodeArray(tcoFilter, 0, -1);
            if (tcoCodeArr.length > 0 || techCondServices.tyServicesPower.doubleValue() > 16)
            {
                respFilter.conditionSQL = "power > 16 " +
                    " and entechcondresponsibles.code in " +
                    " (select rd.techcondresponsblsrfcd " +
                    "       from entechcondrespnsbls2dp rd " +
                    "      where rd.departmentrefcode = " + techCondServices.department.code + ")" +
                    " and entechcondresponsibles.responsibledepcode = '" + ENConsts.ENDEPARTMENT_VRTU + "'";
            }
            else
            {
                respFilter.conditionSQL = "power >= " + techCondServices.tyServicesPower +
                    " and entechcondresponsibles.code in " +
                    " (select rd.techcondresponsblsrfcd " +
                    "       from entechcondrespnsbls2dp rd " +
                    "      where rd.departmentrefcode = " + techCondServices.department.code + ")" +
                    " and entechcondresponsibles.responsibledepcode <> '" + ENConsts.ENDEPARTMENT_VRTU + "'";
            }
           }


           respFilter.orderBySQL = "power";

           int[] respArr = respDAO.getFilteredCodeArray(respFilter, 0, -1);
           if (respArr.length > 0)
           {
               return respDAO.getObject(respArr[0]);
           }

           return null;
       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException(
                   "Can't get responsible person!",
                   e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }

   public ENTechCondResponsibles getResponsiblePerson(BigDecimal power, int departmentCode)
   {
       if (1 == 1)
       {
           throw new EnergyproSystemException("NET-2498 Ви використовуєте застарілу версію! Перезайдіть, будь ласка, у програму!");
       }

       try {
           if (power == null)
           {
               throw new EnergyproSystemException("Неможливо визначити відповідальну особу, тому що не вказано потужність за договором!");
           }

           if (departmentCode == Integer.MIN_VALUE)
           {
               throw new EnergyproSystemException("Неможливо визначити відповідальну особу, тому що не вказано підрозділ у договорі!");
           }

           ENTechCondResponsiblesDAO respDAO = new ENTechCondResponsiblesDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           ENTechCondResponsiblesFilter respFilter = new ENTechCondResponsiblesFilter();

           // Если мощность > 100 кВт, ищем по граничной мощности (> 100), если нет - по граничной мощности и подразделению
           // NET-1911 Гука убрали теперь распределятся все что больше 5 кВ  между тремя пользователями.
           /*if (power.doubleValue() >= 100)
           {

               respFilter.conditionSQL = "power > " + power;

           }
           else
           {
               respFilter.conditionSQL = "power >= " + power +
                                         " and entechcondresponsibles.code in " +
                                         " (select rd.techcondresponsblsrfcd " +
                                         "       from entechcondrespnsbls2dp rd " +
                                         "      where rd.departmentrefcode = " + departmentCode + ")";
           }*/



               respFilter.conditionSQL = "power >= " + power +
                                         " and entechcondresponsibles.code in " +
                                         " (select rd.techcondresponsblsrfcd " +
                                         "       from entechcondrespnsbls2dp rd " +
                                         "      where rd.departmentrefcode = " + departmentCode + ")";


           respFilter.orderBySQL = "power";

           int[] respArr = respDAO.getFilteredCodeArray(respFilter, 0, -1);
           if (respArr.length > 0)
           {
               return respDAO.getObject(respArr[0]);
           }

           return null;
       } catch (DatasourceConnectException e) {
           throw new EnergyproSystemException(
                   "Can't get responsible person!",
                   e);
       } catch (PersistenceException e) {
           throw new EnergyproSystemException(e.getMessage(), e);
       } finally {
           closeConnection();
       }
   }


    public int addTechConditionsServicesByCNPack(CNPack pack, CNTechTerms techTerms) {
        if (1 == 1) {
            throw new EnergyproSystemException("\n "
                    + "\n Ви користуєтеся застарілою версією EnergyWorkflow!");
        }
        return Integer.MIN_VALUE;
    }

    public int addTechConditionsServicesByCNPack(int soCode, CNPack pack) {
        return addTechConditionsServicesByCNPack(soCode, pack, null);
    }

    /* Добавление договора о Присоединении по кодам пакета и подсистемы EnergyWorkFlow.
     * Если уже сущетвует договор Реализации - происходит заполнение полей
     * из договора о Подготовке ТУ и из пакета EnergyWorkFlow.
     * Тип договора о Подготовке ТУ при этом остаётся неизменным. */
    public int addTechConditionsServicesByCNPack(int soCode, CNPack pack, CNTechTerms techTerms) {
        try {

            int tcServicesObjCode = Integer.MIN_VALUE;

            ENServicesObjectDAO soDAO = new ENServicesObjectDAO(
                    getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            ENTechConditionsServicesDAO tcDao = new ENTechConditionsServicesDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());



            ENServicesObject servicesObj = soDAO.getObject(soCode);


            boolean isTcsExist = false;
            /** проверка связи договоров... если нет - создаем и меняем тип договора */
            ENServicesObject2TechCondtnsServicesDAO so2tcsDao = new ENServicesObject2TechCondtnsServicesDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            ENServicesObject2TechCondtnsServicesFilter so2tcsFilter = new ENServicesObject2TechCondtnsServicesFilter();

            so2tcsFilter.servicesObjectRef.code = soCode;
            int so2tcsArr[] = so2tcsDao.getFilteredCodeArray(so2tcsFilter, 0, -1);
            if (so2tcsArr.length > 0) {
                isTcsExist = true;
                /*int tcCode = so2tcsDao.getObject(so2tcsArr[0]).techCondServRef.code;
                ENTechConditionsServices tcObj = tcDao.getObject(tcCode);

                throw new EnergyproSystemException("\n " +
                        "\n Для цього договору на підготовку ТУ вже існує договір на приєднання, № = " + tcObj.contractNumber);*/
            }

            //PRIC-562. Недопущение создания двух договоров о Присоединении,
            //связанных с одним пакетом EnergyWorkFlow
            ENTechConditionsServicesFilter tcsFilter = new ENTechConditionsServicesFilter();
            tcsFilter.cnPackCode = pack.packCode;
            tcsFilter.cnSubsystemTypeRef.code = pack.subsystemRef.code;
            tcsFilter.techCondServicesType.code = ENTechConditionsServicesType.BUILDING;

            int [] tcsCodeArray = tcDao.getFilteredCodeArray(tcsFilter, 0, -1);

            ENTechConditionsServices tcServicesObj;

            if (tcsCodeArray.length > 0)
              { /*
                throw new EnergyproSystemException("\n " +
                "\n Для пакету EnergyWorkFlow " + pack.name + " вже існує договір Приєднання.");
                */
                tcServicesObj = this.getObject(tcsCodeArray[0]);
                isTcsExist = true;
              }
            else
              {tcServicesObj = new ENTechConditionsServices();}

            tcServicesObj.techCondServicesType.code = ENTechConditionsServicesType.BUILDING;

            /** 16.04.2013 +++ по умолчанию создаем с неопределенным типом */
            tcServicesObj.connectionKindRef.code = ENConnectionKind.UNDEFINED;

            //SUPP-8960. Стандартность технических условий должна определяться как
            //для пакетов подсистемы ПРИСОЕДИНЕНИЕ с 01.03.2013, так и для пакетов
            //подсистем ПРИСОЕДИНЕНИЕ до и после 01.08.2010, с 14.03.2011 г.
            if (pack.subsystemRef.code == CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER
              || pack.subsystemRef.code == CNSubsystemType.SS_CONNECTION_20110314
              || pack.subsystemRef.code == CNSubsystemType.SS_NEWCONNECTION
              || pack.subsystemRef.code == CNSubsystemType.SS_CONNECTION) {
                if (pack.startState == 1050021 || pack.startState == 2050008) {
                    tcServicesObj.connectionKindRef.code = ENConnectionKind.STANDART;
                }
                if (pack.startState == 1070006) {
                    tcServicesObj.connectionKindRef.code = ENConnectionKind.NO_STANDART;
                }
            }

            /*
            if (pack.power.doubleValue() <= 16) {
                tcServicesObj.connectionKindRef.code = ENConnectionKind.STANDART;
            } else {
                tcServicesObj.connectionKindRef.code = ENConnectionKind.NO_STANDART;
            }
            */

            tcServicesObj.cnPackCode = pack.packCode;
            tcServicesObj.cnSubsystemTypeRef.code = pack.subsystemRef.code;

            if (pack.reg_num_cn_contract == null) {
                if (tcServicesObj.contractNumber == null)
                  {tcServicesObj.contractNumber = "AUTO";}
                else if (tcServicesObj.contractNumber.equals(""))
                  {tcServicesObj.contractNumber = "AUTO";}
            } else {
                /** 19.04.2013 +++ после / номер договора в ФК.... */
                tcServicesObj.contractNumber = pack.reg_num_cn_contract.split("/",0)[0];
            }
            if (pack.date_cn_contract != null) {
                tcServicesObj.contractDate = pack.date_cn_contract;
            } else {
                tcServicesObj.contractDate = new Date();
            }

            tcServicesObj.tyServicesPower = pack.power;

            tcServicesObj.contragentForm.code = ENTechContragentForm.INDIVIDUAL;
            if (servicesObj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_BUDGET
                    || servicesObj.contragentTypeRef.code == ENServicesContragentType.JURIDICAL_NONBUDGET) {
                tcServicesObj.contragentTypeRef.code = ENTechContragentType.JURIDICAL;
            } else {
                tcServicesObj.contragentTypeRef.code = ENTechContragentType.PHYSICAL;
            }

            if (servicesObj.warrantRef != null) {
                tcServicesObj.warrantRef.code = servicesObj.warrantRef.code;
            }

            tcServicesObj.buildersArea = 0;
            tcServicesObj.smallArchFrm = 0;


            CNRen2ENDepartmentDAO cn2dDao = new CNRen2ENDepartmentDAO(
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
            int codeRem = cn2dDao.getDepartmentCode(pack.id_ren);

            tcServicesObj.department.code = codeRem;



            ENTechCondResponsibles respObj = this
                    .getResponsiblePerson(tcServicesObj);
            if (respObj == null) {
                throw new EnergyproSystemException(
                        "\n\nPRIC-155 За вказаними Вами потужністю та підрозділом неможливо визначити відповідальну особу!");
            }
            if (respObj.code == Integer.MIN_VALUE) {
                throw new EnergyproSystemException(
                        "\n\nPRIC-155 За вказаними Вами потужністю та підрозділом неможливо визначити відповідальну особу!");
            }

            tcServicesObj.techCondResponsiblesRef.code = respObj.code;

            boolean isTechCondExist = false;
            if (servicesObj.techConObjects == null) {
                isTechCondExist = false;
            } else {
                isTechCondExist = (servicesObj.techConObjects.code != Integer.MIN_VALUE);
            }

            Context cnt = new InitialContext();
            Object objRef = cnt
                    .lookup(ENTechConditionsObjectsController.JNDI_NAME);
            ENTechConditionsObjectsControllerHome techCondHome = (ENTechConditionsObjectsControllerHome) PortableRemoteObject
                    .narrow(objRef, ENTechConditionsObjectsControllerHome.class);
            ENTechConditionsObjectsController techCondController = techCondHome
                    .create();

            ENTechConditionsObjects techCondObj;

            if (!isTechCondExist) {
                techCondObj = new ENTechConditionsObjects();
            } else {
                techCondObj = techCondController
                        .getObject(servicesObj.techConObjects.code);
            }

            if (pack.reg_num_tu_contract != null) {
                techCondObj.numberGen = pack.reg_num_tu_contract;
            } else {
                techCondObj.numberGen = "EWF_" + pack.packCode;
                switch (pack.subsystemRef.code) {
                case CNSubsystemType.SS_CONNECTION: {
                    techCondObj.numberGen = techCondObj.numberGen
                            + " (ПРИЄДНАННЯ)";
                    break;
                }
                case CNSubsystemType.SS_NEWCONNECTION: {
                    techCondObj.numberGen = techCondObj.numberGen
                            + " (ПРИЄДНАННЯ з 01.08.2010)";
                    break;
                }
                case CNSubsystemType.SS_CONNECTION_20110314: {
                    techCondObj.numberGen = techCondObj.numberGen
                            + " (ПРИЄДНАННЯ з 14.03.2011)";
                    break;
                }
                case CNSubsystemType.SS_ELECTRICINSTALLACCESSPOWER: {
                    techCondObj.numberGen = techCondObj.numberGen
                            + " (ПРИЄДНАННЯ з 01.03.2013)";
                    break;
                }

                case CNSubsystemType.SS_ACCESSION_DISTRIBUTION_SYSTEMS_ORDER: {
                    techCondObj.numberGen = techCondObj.numberGen
                            + " (ПРИЄДНАННЯ з 19.04.2018)";
                    break;
                }

                default: {
                    throw new EnergyproSystemException(
                            "\n\nPRIC-155. Невідома підсистема EnergyWorkFlow");
                }
                }
            }


            techCondObj.dateEdit = new Date();
            techCondObj.customer = pack.name;
            if (pack.description != null) {
                techCondObj.building = pack.description;
            } else {
                techCondObj.building = "";
            }
            techCondObj.address = pack.address;
            techCondObj.tyServicesPower = pack.power;

            if (techTerms != null) {
                techCondObj.tyCurrentPower = techTerms.pow_exist;
                techCondObj.connectionPowerPlaces = techTerms.ensur_point;
                techCondObj.connectionPowerPoint = techTerms.connect_point;
            } else {
                techCondObj.tyCurrentPower = null; // techTerms.pow_exist;
                techCondObj.connectionPowerPlaces = null; // techTerms.ensur_point;
                techCondObj.connectionPowerPoint = null; // techTerms.connect_point;
            }

            techCondObj.department.code = tcServicesObj.department.code;

            if (pack.reliability_class == "1"
                    || pack.reliability_class == "1, 2"
                    || pack.reliability_class == "1, 2, 3") {
                if (pack.id_ren == 9 && pack.id_district == Integer.MIN_VALUE) {
                    techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT1_CITY;
                } else {
                    techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT1_LAND;
                }
            } else if (pack.reliability_class == "2"
                    || pack.reliability_class == "2, 3")

            {
                if (pack.id_ren == 9 && pack.id_district == Integer.MIN_VALUE) {
                    techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT2_CITY;
                } else {
                    techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT2_LAND;
                }
            } else if (pack.reliability_class == "3") {
                if (pack.id_ren == 9 && pack.id_district == Integer.MIN_VALUE) {
                    techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT3_CITY;
                } else {
                    techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT3_LAND;
                }

            } else if (pack.reliability_class == "1 - місто"
                    || pack.reliability_class == "1, 2 - місто"
                    || pack.reliability_class == "1, 2, 3 - місто") {
                techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT1_CITY;
            } else if (pack.reliability_class == "2 - місто"
                    || pack.reliability_class == "2, 3 - місто") {
                techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT2_CITY;
            } else if (pack.reliability_class == "3 - місто") {
                techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT3_CITY;
            } else if (pack.reliability_class == "1 - село"
                    || pack.reliability_class == "1, 2 - село"
                    || pack.reliability_class == "1, 2, 3 - село") {
                techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT1_LAND;
            } else if (pack.reliability_class == "2 - село"
                    || pack.reliability_class == "2, 3 - село") {
                techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT2_LAND;
            } else if (pack.reliability_class == "3 - село") {
                techCondObj.categoryRef.code = ENPowerReliabilityCategory.CAT3_LAND;
            }

            if (pack.tension_point == null) {
                throw new EnergyproSystemException("\n"
                        + "\n Не вказано напругу в точці приєднання!!!");
            }

            if (pack.tension_point.doubleValue() <= 400) {
                techCondObj.powerPointRef.code = ENConnectionPowerPoint.TENSION_04;
            } else if (pack.tension_point.doubleValue() <= 10000) {
                techCondObj.powerPointRef.code = ENConnectionPowerPoint.TENSION_6_10;
            } else if (pack.tension_point.doubleValue() <= 35000) {
                techCondObj.powerPointRef.code = ENConnectionPowerPoint.TENSION_27_35;
            } else if (pack.tension_point.doubleValue() > 35000) {
                techCondObj.powerPointRef.code = ENConnectionPowerPoint.TENSION_110_154;
            }

            if (isTechCondExist) {
                techCondController.save(techCondObj);
            } else {
                servicesObj.techConObjects = new ENTechConditionsObjects();
                servicesObj.techConObjects.code = techCondController
                        .add(techCondObj);
                soDAO.save(servicesObj);
            }

            if (pack.isSea != Integer.MIN_VALUE) {
                tcServicesObj.isSea = pack.isSea;
            }

            if (pack.baseStation != Integer.MIN_VALUE ) {
                tcServicesObj.baseStation = pack.baseStation;
            }

            if (pack.airLine04Ref == null) {
                tcServicesObj.airLine04Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.airLine04Ref.code = pack.airLine04Ref.code;}

            if (pack.cableLine04Ref == null) {
                tcServicesObj.cableLine04Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.cableLine04Ref.code = pack.cableLine04Ref.code;}

            if (pack.trRef == null) {
                tcServicesObj.trRef.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.trRef.code = pack.trRef.code;}

            if (pack.s04Ref == null) {
                tcServicesObj.s04Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.s04Ref.code = pack.s04Ref.code;}

            if (pack.airLine10Ref == null) {
                tcServicesObj.airLine10Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.airLine10Ref.code = pack.airLine10Ref.code;}

            if (pack.cableLine10Ref == null) {
                tcServicesObj.cableLine10Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.cableLine10Ref.code = pack.cableLine10Ref.code;}

            if (pack.s35Ref == null) {
                tcServicesObj.s35Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.s35Ref.code = pack.s35Ref.code;}

            if (pack.airLine150Ref == null) {
                tcServicesObj.airLine150Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.airLine150Ref.code = pack.airLine150Ref.code;}

            if (pack.cableLine150Ref == null) {
                tcServicesObj.cableLine150Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.cableLine150Ref.code = pack.cableLine150Ref.code;}

            if (pack.s150Ref == null) {
                tcServicesObj.s150Ref.code = Integer.MIN_VALUE;}
            else {
                tcServicesObj.s150Ref.code = pack.s150Ref.code;}


            /** !!!!!!!! 18.04.2013 +++ наверное надо проверить, а потом добавлять!?!?!? */

            ENTechConditionsServicesFilter tcFilter = new ENTechConditionsServicesFilter();
            tcFilter.cnPackCode = pack.packCode;
            tcFilter.cnSubsystemTypeRef.code = pack.subsystemRef.code;
            tcFilter.conditionSQL = " entechconditionsservcs.connectionkindrefcode in (" +
                    + ENConnectionKind.STANDART + ", " + ENConnectionKind.NO_STANDART + ")";

            String contractNumbers = "";

            int tcArr[] = tcDao.getFilteredCodeArray(tcFilter, 0, -1);
            if (tcArr.length > 0) {
                if (tcArr.length == 1) {
                    this.save(tcServicesObj, false);
                    tcServicesObjCode = tcArr[0];

                } else {
                    for (int g = 0; g < tcArr.length; g++) {
                        ENTechConditionsServices exTc = tcDao.getObject(tcArr[g]);

                        if (contractNumbers.equals("")) {
                            contractNumbers = exTc.contractNumber;
                        } else {
                            contractNumbers = contractNumbers + ", " + exTc.contractNumber;
                        }
                    }

                    throw new EnergyproSystemException("\n" +
                            "\n Помилка при визначенні договору!!!" +
                            "\n Пакет № = " + pack.packCode + " вже зв’язаний з договорами на приєднання: " + contractNumbers);
                }

            } else {
                if (isTcsExist)
                  {
                    this.save(tcServicesObj, false);
                    tcServicesObjCode = tcServicesObj.code;
                  }
                else {tcServicesObjCode = this.add(tcServicesObj, false);}
            }


            ENServicesObject soObj = soDAO.getObject(soCode);
            if (soObj.contractTypeRef.code == ENServicesContractType.CONNECTION)
            {
                if (!isTcsExist)
                {//создаем связку между договорами, если тип договора не о Подготовке ТУ, а о Присоединении
                    ENServicesObject2TechCondtnsServices so2tcs = new ENServicesObject2TechCondtnsServices();
                    so2tcs.servicesObjectRef.code = soCode;
                    so2tcs.techCondServRef.code = tcServicesObjCode;
                    so2tcsDao.add(so2tcs);
                }
            }
            else if (soObj.contractTypeRef.code == ENServicesContractType.TY)
            {
                //Неправильно присваивать старому договору о подготовке ТУ тип
                //ПРИСОЕДИНЕНИЕ, если существует связанный договор РЕАЛИЗАЦИИ или ПРОЕКТИРОВАНИЯ
                if (!isTcsExist)
                {
                    tcsFilter.techCondServicesType.code = ENTechConditionsServicesType.DESIGN;
                    tcsCodeArray = tcDao.getFilteredCodeArray(tcsFilter, 0, -1);
                    if (tcsCodeArray.length == 0)
                    {soObj.contractTypeRef.code = ENServicesContractType.CONNECTION;}
                  }

                /** 22.04.2013 +++ статус договора и сумму в коменты... */
                ENServicesContractStatusDAO statusDAO = new ENServicesContractStatusDAO(
                        getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

                soObj.commentServicesGen = soObj.commentServicesGen + "\n" +
                        " Стан договору про підготовку ТУ: " + statusDAO.getObject(soObj.contractStatusRef.code).name +
                        ", сума за договором: " + soObj.contractServicesSumma;

                /** 17.04.2013 +++ с проведенными пока непонятно, что делать !?!?!?!? */
                if (soObj.statusRef.code == ENServicesObjectStatus.GOOD) {
                    soObj.contractStatusRef.code = ENServicesContractStatus.BUDGETAPPROVED;
                }

                soDAO.save(soObj);
            }

            // добавление контрагента....
            ENContragentDAO contrAgentDAO = new ENContragentDAO(
                    getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

            ENContragentFilter contrAgentFilter = new ENContragentFilter();
            contrAgentFilter.conditionSQL = " encontragent.techcondservicesrefcod = " +
              tcServicesObjCode;
            int[] contrAgentCodeArray = contrAgentDAO.getFilteredCodeArray(contrAgentFilter, 0, -1);

            if (contrAgentCodeArray.length == 0)
            {
                ENContragent contrAgent = new ENContragent();

                contrAgent.techConObjects.code = servicesObj.techConObjects.code;
                contrAgent.techCondServicesRef.code = tcServicesObjCode;

                if (servicesObj.basisType != null) {
                    contrAgent.basisType.code = servicesObj.basisType.intValue();
                }
                contrAgent.contragentType.code = tcServicesObj.contragentTypeRef.code;

                contrAgent.contragentName = pack.name;
                contrAgent.contragentAddress = servicesObj.contragentAddress;
                contrAgent.contragentAddressWork = servicesObj.contragentAddressWork;
                contrAgent.contragentPosition = servicesObj.contragentPosition;
                contrAgent.contragentOkpo = servicesObj.contragentOkpo;
                contrAgent.contragentBankAccount = servicesObj.contragentBankAccount;
                contrAgent.contragentBankName = servicesObj.contragentBankName;
                contrAgent.contragentBankMfo = servicesObj.contragentBankMfo;
                contrAgent.contragentBossName = servicesObj.contragentBossName;
                contrAgent.contragentPassport = servicesObj.contragentPassport;
                contrAgent.warrantDate = servicesObj.warrantDate;
                contrAgent.warrantNumber = servicesObj.warrantNumber;
                contrAgent.warrantFIO = servicesObj.warrantFIO;

                if (servicesObj.basisType != null) {
                    contrAgent.basisType.code = servicesObj.basisType.intValue();
                } else {
                    /** SUPP-15073... 07.04.2014 +++ по умолчанию - на основании паспорта... */
                    contrAgent.basisType.code = ENBasisType.PASSPORT;
                }

            /*
            ENWarrantDAO wDAO = new ENWarrantDAO(getUserProfile(),
                    getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
            contrAgent.warrantPassport = wDAO
                    .getObject(servicesObj.warrantRef.code).passport;
            contrAgent.warrantAddress = wDAO
                    .getObject(servicesObj.warrantRef.code).address;
             */

            int contrAgentCode = contrAgentDAO.add(contrAgent);

            }

            if (tcServicesObjCode == Integer.MIN_VALUE) {
                throw new EnergyproSystemException(
                        "\n\nPRIC-155 Помилка при створенні договору на стандартне приєднання!");
            }

            return tcServicesObjCode;

        } catch (DatasourceConnectException e) {
            throw new EnergyproSystemException(
                    "Can't addTechConditionsServicesByPack!", e);
        } catch (PersistenceException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (NamingException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (RemoteException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } catch (CreateException e) {
            throw new EnergyproSystemException(e.getMessage(), e);
        } finally {
            closeConnection();
        }
    }

} // end of EJB Controller for ENTechConditionsServices

