unit ENSOProj2SOConnController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  ENSOProj2SOConn            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOProj2SOConnRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSOProj2SOConn = class(TRemotable)
  private
    Fcode : Integer;
//???
    FSOProjRef : ENServicesObjectRef;
//???
    FSOConnRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property SOProjRef : ENServicesObjectRef read FSOProjRef write FSOProjRef;
    property SOConnRef : ENServicesObjectRef read FSOConnRef write FSOConnRef;
  end;

{
  ENSOProj2SOConnFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FSOProjRef : ENServicesObjectRef;
//???
    FSOConnRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property SOProjRef : ENServicesObjectRef read FSOProjRef write FSOProjRef;
    property SOConnRef : ENServicesObjectRef read FSOConnRef write FSOConnRef;
  end;
}

  ENSOProj2SOConnFilter = class(ENSOProj2SOConn)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSOProj2SOConnShort = class(TRemotable)
  private
    Fcode : Integer;
    FSOProjRefCode : Integer;
    FSOProjRefContractNumber : WideString;
    FSOProjRefContractDate : TXSDate;
    FSOProjRefName : WideString;
    FSOProjRefPartnerCode : WideString;
    FSOProjRefFinDocCode : WideString;
    FSOProjRefFinDocID : Integer;
    FSOProjRefCommentGen : WideString;
    FSOProjRefContractNumberServices : WideString;
    FSOProjRefContractDateServices : TXSDate;
    FSOProjRefContragentName : WideString;
    FSOProjRefContragentAddress : WideString;
    FSOProjRefContragentAddressWork : WideString;
    FSOProjRefContragentOkpo : WideString;
    FSOProjRefContragentBankAccount : WideString;
    FSOProjRefContragentBankName : WideString;
    FSOProjRefContragentBankMfo : WideString;
    FSOProjRefContragentBossName : WideString;
    FSOProjRefContragentPassport : WideString;
    FSOProjRefContractServicesSumma : TXSDecimal;
    FSOProjRefContractServicesPower : TXSDecimal;
    FSOProjRefCommentServicesGen : WideString;
    FSOProjRefContractServicesDistance : TXSDecimal;
    FSOProjRefContractServicesDay : TXSDecimal;
    FSOProjRefUserGen : WideString;
    FSOProjRefDateEdit : TXSDate;
    FSOProjRefWarrantDate : TXSDate;
    FSOProjRefWarrantNumber : WideString;
    FSOProjRefWarrantFIO : WideString;
    FSOProjRefRegionalType : Integer;
    FSOProjRefBasisType : TXSDecimal;
    FSOProjRefContragentPosition : WideString;
    FSOProjRefExecuteWorkDate : TXSDate;
    FSOProjRefTimeStart : TXSDateTime;
    FSOProjRefTimeFinal : TXSDateTime;
    FSOProjRefContragentPhoneNumber : WideString;
    FSOProjRefExecutorPhoneNumber : WideString;
    FSOProjRefContragentObjectWork : WideString;
    FSOProjRefIsNoPay : Integer;
    FSOProjRefIsCustomerMaterials : Integer;
    FSOProjRefPayDate : TXSDate;
    FSOProjRefFinPayFormCode : Integer;
    FSOProjRefFinPayFormName : WideString;
    FSOProjRefPartnerId : Integer;
    FSOProjRefPayDetail : WideString;
    FSOProjRefActTransferNumber : WideString;
    FSOProjRefActTransferDate : TXSDate;
    FSOProjRefResposible : WideString;
    FSOProjRefResposiblePosition : WideString;
    FSOProjRefResposibleTabNumber : WideString;
    FSOProjRefPrevContractStatus : Integer;
    FSOProjRefReconnectionTU : Integer;
    FSOProjRefPersonalAccountCode : Integer;
    FSOProjRefPersonalAccountNumber : WideString;
    FSOProjRefTabNumber : WideString;
    FSOProjRefCitiesList : WideString;
    FSOProjRefLineLength : TXSDecimal;
    FSOProjRefProjectCode : WideString;
    FSOProjRefCnPackCode : Integer;
    FSOProjRefDfPackCode : Integer;
    FSOProjRefCountersZoneType : Integer;
    FSOProjRefAxPartnerCode : WideString;
    FSOProjRefAxPartnerName : WideString;
    FSOProjRefAxContractNumber : WideString;
    FSOProjRefAxContractDate : TXSDate;
    FSOProjRefAxContractCode : WideString;
    FSOProjRefAxContractId : WideString;
    FSOProjRefAxContractCommentGen : WideString;
    FSOConnRefCode : Integer;
    FSOConnRefContractNumber : WideString;
    FSOConnRefContractDate : TXSDate;
    FSOConnRefName : WideString;
    FSOConnRefPartnerCode : WideString;
    FSOConnRefFinDocCode : WideString;
    FSOConnRefFinDocID : Integer;
    FSOConnRefCommentGen : WideString;
    FSOConnRefContractNumberServices : WideString;
    FSOConnRefContractDateServices : TXSDate;
    FSOConnRefContragentName : WideString;
    FSOConnRefContragentAddress : WideString;
    FSOConnRefContragentAddressWork : WideString;
    FSOConnRefContragentOkpo : WideString;
    FSOConnRefContragentBankAccount : WideString;
    FSOConnRefContragentBankName : WideString;
    FSOConnRefContragentBankMfo : WideString;
    FSOConnRefContragentBossName : WideString;
    FSOConnRefContragentPassport : WideString;
    FSOConnRefContractServicesSumma : TXSDecimal;
    FSOConnRefContractServicesPower : TXSDecimal;
    FSOConnRefCommentServicesGen : WideString;
    FSOConnRefContractServicesDistance : TXSDecimal;
    FSOConnRefContractServicesDay : TXSDecimal;
    FSOConnRefUserGen : WideString;
    FSOConnRefDateEdit : TXSDate;
    FSOConnRefWarrantDate : TXSDate;
    FSOConnRefWarrantNumber : WideString;
    FSOConnRefWarrantFIO : WideString;
    FSOConnRefRegionalType : Integer;
    FSOConnRefBasisType : TXSDecimal;
    FSOConnRefContragentPosition : WideString;
    FSOConnRefExecuteWorkDate : TXSDate;
    FSOConnRefTimeStart : TXSDateTime;
    FSOConnRefTimeFinal : TXSDateTime;
    FSOConnRefContragentPhoneNumber : WideString;
    FSOConnRefExecutorPhoneNumber : WideString;
    FSOConnRefContragentObjectWork : WideString;
    FSOConnRefIsNoPay : Integer;
    FSOConnRefIsCustomerMaterials : Integer;
    FSOConnRefPayDate : TXSDate;
    FSOConnRefFinPayFormCode : Integer;
    FSOConnRefFinPayFormName : WideString;
    FSOConnRefPartnerId : Integer;
    FSOConnRefPayDetail : WideString;
    FSOConnRefActTransferNumber : WideString;
    FSOConnRefActTransferDate : TXSDate;
    FSOConnRefResposible : WideString;
    FSOConnRefResposiblePosition : WideString;
    FSOConnRefResposibleTabNumber : WideString;
    FSOConnRefPrevContractStatus : Integer;
    FSOConnRefReconnectionTU : Integer;
    FSOConnRefPersonalAccountCode : Integer;
    FSOConnRefPersonalAccountNumber : WideString;
    FSOConnRefTabNumber : WideString;
    FSOConnRefCitiesList : WideString;
    FSOConnRefLineLength : TXSDecimal;
    FSOConnRefProjectCode : WideString;
    FSOConnRefCnPackCode : Integer;
    FSOConnRefDfPackCode : Integer;
    FSOConnRefCountersZoneType : Integer;
    FSOConnRefAxPartnerCode : WideString;
    FSOConnRefAxPartnerName : WideString;
    FSOConnRefAxContractNumber : WideString;
    FSOConnRefAxContractDate : TXSDate;
    FSOConnRefAxContractCode : WideString;
    FSOConnRefAxContractId : WideString;
    FSOConnRefAxContractCommentGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property SOProjRefCode : Integer read FSOProjRefCode write FSOProjRefCode;
    property SOProjRefContractNumber : WideString read FSOProjRefContractNumber write FSOProjRefContractNumber;
    property SOProjRefContractDate : TXSDate read FSOProjRefContractDate write FSOProjRefContractDate;
    property SOProjRefName : WideString read FSOProjRefName write FSOProjRefName;
    property SOProjRefPartnerCode : WideString read FSOProjRefPartnerCode write FSOProjRefPartnerCode;
    property SOProjRefFinDocCode : WideString read FSOProjRefFinDocCode write FSOProjRefFinDocCode;
    property SOProjRefFinDocID : Integer read FSOProjRefFinDocID write FSOProjRefFinDocID;
    property SOProjRefCommentGen : WideString read FSOProjRefCommentGen write FSOProjRefCommentGen;
    property SOProjRefContractNumberServices : WideString read FSOProjRefContractNumberServices write FSOProjRefContractNumberServices;
    property SOProjRefContractDateServices : TXSDate read FSOProjRefContractDateServices write FSOProjRefContractDateServices;
    property SOProjRefContragentName : WideString read FSOProjRefContragentName write FSOProjRefContragentName;
    property SOProjRefContragentAddress : WideString read FSOProjRefContragentAddress write FSOProjRefContragentAddress;
    property SOProjRefContragentAddressWork : WideString read FSOProjRefContragentAddressWork write FSOProjRefContragentAddressWork;
    property SOProjRefContragentOkpo : WideString read FSOProjRefContragentOkpo write FSOProjRefContragentOkpo;
    property SOProjRefContragentBankAccount : WideString read FSOProjRefContragentBankAccount write FSOProjRefContragentBankAccount;
    property SOProjRefContragentBankName : WideString read FSOProjRefContragentBankName write FSOProjRefContragentBankName;
    property SOProjRefContragentBankMfo : WideString read FSOProjRefContragentBankMfo write FSOProjRefContragentBankMfo;
    property SOProjRefContragentBossName : WideString read FSOProjRefContragentBossName write FSOProjRefContragentBossName;
    property SOProjRefContragentPassport : WideString read FSOProjRefContragentPassport write FSOProjRefContragentPassport;
    property SOProjRefContractServicesSumma : TXSDecimal read FSOProjRefContractServicesSumma write FSOProjRefContractServicesSumma;
    property SOProjRefContractServicesPower : TXSDecimal read FSOProjRefContractServicesPower write FSOProjRefContractServicesPower;
    property SOProjRefCommentServicesGen : WideString read FSOProjRefCommentServicesGen write FSOProjRefCommentServicesGen;
    property SOProjRefContractServicesDistance : TXSDecimal read FSOProjRefContractServicesDistance write FSOProjRefContractServicesDistance;
    property SOProjRefContractServicesDay : TXSDecimal read FSOProjRefContractServicesDay write FSOProjRefContractServicesDay;
    property SOProjRefUserGen : WideString read FSOProjRefUserGen write FSOProjRefUserGen;
    property SOProjRefDateEdit : TXSDate read FSOProjRefDateEdit write FSOProjRefDateEdit;
    property SOProjRefWarrantDate : TXSDate read FSOProjRefWarrantDate write FSOProjRefWarrantDate;
    property SOProjRefWarrantNumber : WideString read FSOProjRefWarrantNumber write FSOProjRefWarrantNumber;
    property SOProjRefWarrantFIO : WideString read FSOProjRefWarrantFIO write FSOProjRefWarrantFIO;
    property SOProjRefRegionalType : Integer read FSOProjRefRegionalType write FSOProjRefRegionalType;
    property SOProjRefBasisType : TXSDecimal read FSOProjRefBasisType write FSOProjRefBasisType;
    property SOProjRefContragentPosition : WideString read FSOProjRefContragentPosition write FSOProjRefContragentPosition;
    property SOProjRefExecuteWorkDate : TXSDate read FSOProjRefExecuteWorkDate write FSOProjRefExecuteWorkDate;
    property SOProjRefTimeStart : TXSDateTime read FSOProjRefTimeStart write FSOProjRefTimeStart;
    property SOProjRefTimeFinal : TXSDateTime read FSOProjRefTimeFinal write FSOProjRefTimeFinal;
    property SOProjRefContragentPhoneNumber : WideString read FSOProjRefContragentPhoneNumber write FSOProjRefContragentPhoneNumber;
    property SOProjRefExecutorPhoneNumber : WideString read FSOProjRefExecutorPhoneNumber write FSOProjRefExecutorPhoneNumber;
    property SOProjRefContragentObjectWork : WideString read FSOProjRefContragentObjectWork write FSOProjRefContragentObjectWork;
    property SOProjRefIsNoPay : Integer read FSOProjRefIsNoPay write FSOProjRefIsNoPay;
    property SOProjRefIsCustomerMaterials : Integer read FSOProjRefIsCustomerMaterials write FSOProjRefIsCustomerMaterials;
    property SOProjRefPayDate : TXSDate read FSOProjRefPayDate write FSOProjRefPayDate;
    property SOProjRefFinPayFormCode : Integer read FSOProjRefFinPayFormCode write FSOProjRefFinPayFormCode;
    property SOProjRefFinPayFormName : WideString read FSOProjRefFinPayFormName write FSOProjRefFinPayFormName;
    property SOProjRefPartnerId : Integer read FSOProjRefPartnerId write FSOProjRefPartnerId;
    property SOProjRefPayDetail : WideString read FSOProjRefPayDetail write FSOProjRefPayDetail;
    property SOProjRefActTransferNumber : WideString read FSOProjRefActTransferNumber write FSOProjRefActTransferNumber;
    property SOProjRefActTransferDate : TXSDate read FSOProjRefActTransferDate write FSOProjRefActTransferDate;
    property SOProjRefResposible : WideString read FSOProjRefResposible write FSOProjRefResposible;
    property SOProjRefResposiblePosition : WideString read FSOProjRefResposiblePosition write FSOProjRefResposiblePosition;
    property SOProjRefResposibleTabNumber : WideString read FSOProjRefResposibleTabNumber write FSOProjRefResposibleTabNumber;
    property SOProjRefPrevContractStatus : Integer read FSOProjRefPrevContractStatus write FSOProjRefPrevContractStatus;
    property SOProjRefReconnectionTU : Integer read FSOProjRefReconnectionTU write FSOProjRefReconnectionTU;
    property SOProjRefPersonalAccountCode : Integer read FSOProjRefPersonalAccountCode write FSOProjRefPersonalAccountCode;
    property SOProjRefPersonalAccountNumber : WideString read FSOProjRefPersonalAccountNumber write FSOProjRefPersonalAccountNumber;
    property SOProjRefTabNumber : WideString read FSOProjRefTabNumber write FSOProjRefTabNumber;
    property SOProjRefCitiesList : WideString read FSOProjRefCitiesList write FSOProjRefCitiesList;
    property SOProjRefLineLength : TXSDecimal read FSOProjRefLineLength write FSOProjRefLineLength;
    property SOProjRefProjectCode : WideString read FSOProjRefProjectCode write FSOProjRefProjectCode;
    property SOProjRefCnPackCode : Integer read FSOProjRefCnPackCode write FSOProjRefCnPackCode;
    property SOProjRefDfPackCode : Integer read FSOProjRefDfPackCode write FSOProjRefDfPackCode;
    property SOProjRefCountersZoneType : Integer read FSOProjRefCountersZoneType write FSOProjRefCountersZoneType;
    property SOProjRefAxPartnerCode : WideString read FSOProjRefAxPartnerCode write FSOProjRefAxPartnerCode;
    property SOProjRefAxPartnerName : WideString read FSOProjRefAxPartnerName write FSOProjRefAxPartnerName;
    property SOProjRefAxContractNumber : WideString read FSOProjRefAxContractNumber write FSOProjRefAxContractNumber;
    property SOProjRefAxContractDate : TXSDate read FSOProjRefAxContractDate write FSOProjRefAxContractDate;
    property SOProjRefAxContractCode : WideString read FSOProjRefAxContractCode write FSOProjRefAxContractCode;
    property SOProjRefAxContractId : WideString read FSOProjRefAxContractId write FSOProjRefAxContractId;
    property SOProjRefAxContractCommentGen : WideString read FSOProjRefAxContractCommentGen write FSOProjRefAxContractCommentGen;
    property SOConnRefCode : Integer read FSOConnRefCode write FSOConnRefCode;
    property SOConnRefContractNumber : WideString read FSOConnRefContractNumber write FSOConnRefContractNumber;
    property SOConnRefContractDate : TXSDate read FSOConnRefContractDate write FSOConnRefContractDate;
    property SOConnRefName : WideString read FSOConnRefName write FSOConnRefName;
    property SOConnRefPartnerCode : WideString read FSOConnRefPartnerCode write FSOConnRefPartnerCode;
    property SOConnRefFinDocCode : WideString read FSOConnRefFinDocCode write FSOConnRefFinDocCode;
    property SOConnRefFinDocID : Integer read FSOConnRefFinDocID write FSOConnRefFinDocID;
    property SOConnRefCommentGen : WideString read FSOConnRefCommentGen write FSOConnRefCommentGen;
    property SOConnRefContractNumberServices : WideString read FSOConnRefContractNumberServices write FSOConnRefContractNumberServices;
    property SOConnRefContractDateServices : TXSDate read FSOConnRefContractDateServices write FSOConnRefContractDateServices;
    property SOConnRefContragentName : WideString read FSOConnRefContragentName write FSOConnRefContragentName;
    property SOConnRefContragentAddress : WideString read FSOConnRefContragentAddress write FSOConnRefContragentAddress;
    property SOConnRefContragentAddressWork : WideString read FSOConnRefContragentAddressWork write FSOConnRefContragentAddressWork;
    property SOConnRefContragentOkpo : WideString read FSOConnRefContragentOkpo write FSOConnRefContragentOkpo;
    property SOConnRefContragentBankAccount : WideString read FSOConnRefContragentBankAccount write FSOConnRefContragentBankAccount;
    property SOConnRefContragentBankName : WideString read FSOConnRefContragentBankName write FSOConnRefContragentBankName;
    property SOConnRefContragentBankMfo : WideString read FSOConnRefContragentBankMfo write FSOConnRefContragentBankMfo;
    property SOConnRefContragentBossName : WideString read FSOConnRefContragentBossName write FSOConnRefContragentBossName;
    property SOConnRefContragentPassport : WideString read FSOConnRefContragentPassport write FSOConnRefContragentPassport;
    property SOConnRefContractServicesSumma : TXSDecimal read FSOConnRefContractServicesSumma write FSOConnRefContractServicesSumma;
    property SOConnRefContractServicesPower : TXSDecimal read FSOConnRefContractServicesPower write FSOConnRefContractServicesPower;
    property SOConnRefCommentServicesGen : WideString read FSOConnRefCommentServicesGen write FSOConnRefCommentServicesGen;
    property SOConnRefContractServicesDistance : TXSDecimal read FSOConnRefContractServicesDistance write FSOConnRefContractServicesDistance;
    property SOConnRefContractServicesDay : TXSDecimal read FSOConnRefContractServicesDay write FSOConnRefContractServicesDay;
    property SOConnRefUserGen : WideString read FSOConnRefUserGen write FSOConnRefUserGen;
    property SOConnRefDateEdit : TXSDate read FSOConnRefDateEdit write FSOConnRefDateEdit;
    property SOConnRefWarrantDate : TXSDate read FSOConnRefWarrantDate write FSOConnRefWarrantDate;
    property SOConnRefWarrantNumber : WideString read FSOConnRefWarrantNumber write FSOConnRefWarrantNumber;
    property SOConnRefWarrantFIO : WideString read FSOConnRefWarrantFIO write FSOConnRefWarrantFIO;
    property SOConnRefRegionalType : Integer read FSOConnRefRegionalType write FSOConnRefRegionalType;
    property SOConnRefBasisType : TXSDecimal read FSOConnRefBasisType write FSOConnRefBasisType;
    property SOConnRefContragentPosition : WideString read FSOConnRefContragentPosition write FSOConnRefContragentPosition;
    property SOConnRefExecuteWorkDate : TXSDate read FSOConnRefExecuteWorkDate write FSOConnRefExecuteWorkDate;
    property SOConnRefTimeStart : TXSDateTime read FSOConnRefTimeStart write FSOConnRefTimeStart;
    property SOConnRefTimeFinal : TXSDateTime read FSOConnRefTimeFinal write FSOConnRefTimeFinal;
    property SOConnRefContragentPhoneNumber : WideString read FSOConnRefContragentPhoneNumber write FSOConnRefContragentPhoneNumber;
    property SOConnRefExecutorPhoneNumber : WideString read FSOConnRefExecutorPhoneNumber write FSOConnRefExecutorPhoneNumber;
    property SOConnRefContragentObjectWork : WideString read FSOConnRefContragentObjectWork write FSOConnRefContragentObjectWork;
    property SOConnRefIsNoPay : Integer read FSOConnRefIsNoPay write FSOConnRefIsNoPay;
    property SOConnRefIsCustomerMaterials : Integer read FSOConnRefIsCustomerMaterials write FSOConnRefIsCustomerMaterials;
    property SOConnRefPayDate : TXSDate read FSOConnRefPayDate write FSOConnRefPayDate;
    property SOConnRefFinPayFormCode : Integer read FSOConnRefFinPayFormCode write FSOConnRefFinPayFormCode;
    property SOConnRefFinPayFormName : WideString read FSOConnRefFinPayFormName write FSOConnRefFinPayFormName;
    property SOConnRefPartnerId : Integer read FSOConnRefPartnerId write FSOConnRefPartnerId;
    property SOConnRefPayDetail : WideString read FSOConnRefPayDetail write FSOConnRefPayDetail;
    property SOConnRefActTransferNumber : WideString read FSOConnRefActTransferNumber write FSOConnRefActTransferNumber;
    property SOConnRefActTransferDate : TXSDate read FSOConnRefActTransferDate write FSOConnRefActTransferDate;
    property SOConnRefResposible : WideString read FSOConnRefResposible write FSOConnRefResposible;
    property SOConnRefResposiblePosition : WideString read FSOConnRefResposiblePosition write FSOConnRefResposiblePosition;
    property SOConnRefResposibleTabNumber : WideString read FSOConnRefResposibleTabNumber write FSOConnRefResposibleTabNumber;
    property SOConnRefPrevContractStatus : Integer read FSOConnRefPrevContractStatus write FSOConnRefPrevContractStatus;
    property SOConnRefReconnectionTU : Integer read FSOConnRefReconnectionTU write FSOConnRefReconnectionTU;
    property SOConnRefPersonalAccountCode : Integer read FSOConnRefPersonalAccountCode write FSOConnRefPersonalAccountCode;
    property SOConnRefPersonalAccountNumber : WideString read FSOConnRefPersonalAccountNumber write FSOConnRefPersonalAccountNumber;
    property SOConnRefTabNumber : WideString read FSOConnRefTabNumber write FSOConnRefTabNumber;
    property SOConnRefCitiesList : WideString read FSOConnRefCitiesList write FSOConnRefCitiesList;
    property SOConnRefLineLength : TXSDecimal read FSOConnRefLineLength write FSOConnRefLineLength;
    property SOConnRefProjectCode : WideString read FSOConnRefProjectCode write FSOConnRefProjectCode;
    property SOConnRefCnPackCode : Integer read FSOConnRefCnPackCode write FSOConnRefCnPackCode;
    property SOConnRefDfPackCode : Integer read FSOConnRefDfPackCode write FSOConnRefDfPackCode;
    property SOConnRefCountersZoneType : Integer read FSOConnRefCountersZoneType write FSOConnRefCountersZoneType;
    property SOConnRefAxPartnerCode : WideString read FSOConnRefAxPartnerCode write FSOConnRefAxPartnerCode;
    property SOConnRefAxPartnerName : WideString read FSOConnRefAxPartnerName write FSOConnRefAxPartnerName;
    property SOConnRefAxContractNumber : WideString read FSOConnRefAxContractNumber write FSOConnRefAxContractNumber;
    property SOConnRefAxContractDate : TXSDate read FSOConnRefAxContractDate write FSOConnRefAxContractDate;
    property SOConnRefAxContractCode : WideString read FSOConnRefAxContractCode write FSOConnRefAxContractCode;
    property SOConnRefAxContractId : WideString read FSOConnRefAxContractId write FSOConnRefAxContractId;
    property SOConnRefAxContractCommentGen : WideString read FSOConnRefAxContractCommentGen write FSOConnRefAxContractCommentGen;
  end;

  ArrayOfENSOProj2SOConnShort = array of ENSOProj2SOConnShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSOProj2SOConnShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSOProj2SOConnShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSOProj2SOConnShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSOProj2SOConnController/message/
  // soapAction: http://ksoe.org/ENSOProj2SOConnController/action/ENSOProj2SOConnController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSOProj2SOConnControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSOProj2SOConnController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSOProj2SOConnControllerSoapPort = interface(IInvokable)
  ['{E49D14A7-541F-4150-B8E4-BD6CEB3E0304}']
    function add(const aENSOProj2SOConn: ENSOProj2SOConn): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSOProj2SOConn: ENSOProj2SOConn); stdcall;
    function getObject(const anObjectCode: Integer): ENSOProj2SOConn; stdcall;
    function getList: ENSOProj2SOConnShortList; stdcall;
    function getFilteredList(const aENSOProj2SOConnFilter: ENSOProj2SOConnFilter): ENSOProj2SOConnShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSOProj2SOConnShortList; stdcall;
    function getScrollableFilteredList(const aENSOProj2SOConnFilter: ENSOProj2SOConnFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSOProj2SOConnShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSOProj2SOConnShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSOProj2SOConnFilter: ENSOProj2SOConnFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSOProj2SOConnShort; stdcall;
  end;


implementation

  destructor ENSOProj2SOConn.Destroy;
  begin
    if Assigned(FSOProjRef) then
      SOProjRef.Free;
    if Assigned(FSOConnRef) then
      SOConnRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSOProj2SOConnFilter.Destroy;
  begin
    if Assigned(FSOProjRef) then
      SOProjRef.Free;
    if Assigned(FSOConnRef) then
      SOConnRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSOProj2SOConnFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSOProj2SOConnShort.Destroy;
  begin
    if Assigned(FSOProjRefContractDate) then
      SOProjRefContractDate.Free;
    if Assigned(FSOProjRefContractDateServices) then
      SOProjRefContractDateServices.Free;
    if Assigned(FSOProjRefContractServicesSumma) then
      SOProjRefContractServicesSumma.Free;
    if Assigned(FSOProjRefContractServicesPower) then
      SOProjRefContractServicesPower.Free;
    if Assigned(FSOProjRefContractServicesDistance) then
      SOProjRefContractServicesDistance.Free;
    if Assigned(FSOProjRefContractServicesDay) then
      SOProjRefContractServicesDay.Free;
    if Assigned(FSOProjRefDateEdit) then
      SOProjRefDateEdit.Free;
    if Assigned(FSOProjRefWarrantDate) then
      SOProjRefWarrantDate.Free;
    if Assigned(FSOProjRefBasisType) then
      SOProjRefBasisType.Free;
    if Assigned(FSOProjRefExecuteWorkDate) then
      SOProjRefExecuteWorkDate.Free;
    if Assigned(FSOProjRefTimeStart) then
      SOProjRefTimeStart.Free;
    if Assigned(FSOProjRefTimeFinal) then
      SOProjRefTimeFinal.Free;
    if Assigned(FSOProjRefPayDate) then
      SOProjRefPayDate.Free;
    if Assigned(FSOProjRefActTransferDate) then
      SOProjRefActTransferDate.Free;
    if Assigned(FSOProjRefLineLength) then
      SOProjRefLineLength.Free;
    if Assigned(FSOProjRefAxContractDate) then
      SOProjRefAxContractDate.Free;
    if Assigned(FSOConnRefContractDate) then
      SOConnRefContractDate.Free;
    if Assigned(FSOConnRefContractDateServices) then
      SOConnRefContractDateServices.Free;
    if Assigned(FSOConnRefContractServicesSumma) then
      SOConnRefContractServicesSumma.Free;
    if Assigned(FSOConnRefContractServicesPower) then
      SOConnRefContractServicesPower.Free;
    if Assigned(FSOConnRefContractServicesDistance) then
      SOConnRefContractServicesDistance.Free;
    if Assigned(FSOConnRefContractServicesDay) then
      SOConnRefContractServicesDay.Free;
    if Assigned(FSOConnRefDateEdit) then
      SOConnRefDateEdit.Free;
    if Assigned(FSOConnRefWarrantDate) then
      SOConnRefWarrantDate.Free;
    if Assigned(FSOConnRefBasisType) then
      SOConnRefBasisType.Free;
    if Assigned(FSOConnRefExecuteWorkDate) then
      SOConnRefExecuteWorkDate.Free;
    if Assigned(FSOConnRefTimeStart) then
      SOConnRefTimeStart.Free;
    if Assigned(FSOConnRefTimeFinal) then
      SOConnRefTimeFinal.Free;
    if Assigned(FSOConnRefPayDate) then
      SOConnRefPayDate.Free;
    if Assigned(FSOConnRefActTransferDate) then
      SOConnRefActTransferDate.Free;
    if Assigned(FSOConnRefLineLength) then
      SOConnRefLineLength.Free;
    if Assigned(FSOConnRefAxContractDate) then
      SOConnRefAxContractDate.Free;
    inherited Destroy;
  end;

  destructor ENSOProj2SOConnShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(ENSOProj2SOConn, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOProj2SOConn');
  RemClassRegistry.RegisterXSClass(ENSOProj2SOConnRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOProj2SOConnRef');
  RemClassRegistry.RegisterXSClass(ENSOProj2SOConnFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOProj2SOConnFilter');
  RemClassRegistry.RegisterXSClass(ENSOProj2SOConnShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOProj2SOConnShort');
  RemClassRegistry.RegisterXSClass(ENSOProj2SOConnShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSOProj2SOConnShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSOProj2SOConnShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSOProj2SOConnShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSOProj2SOConnControllerSoapPort), 'http://ksoe.org/ENSOProj2SOConnController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSOProj2SOConnControllerSoapPort), 'http://ksoe.org/ENSOProj2SOConnController/action/ENSOProj2SOConnController.%operationName%');


end.
