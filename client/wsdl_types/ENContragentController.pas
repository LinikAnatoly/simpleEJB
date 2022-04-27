unit ENContragentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTechConditionsObjectsController 
   ,ENBasisTypeController 
   ,ENTechConditionsServicesController 
   ,ENServicesContragentTypeController 
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENContragent            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContragentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContragent = class(TRemotable)
  private
    Fcode : Integer; 
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentAddressWork : WideString;
    FcontragentPosition : WideString;
    FcontragentOkpo : WideString;
    FcontragentBankAccount : WideString;
    FcontragentBankName : WideString;
    FcontragentBankMfo : WideString;
    FcontragentBossName : WideString;
    FcontragentPassport : WideString;
    FwarrantDate : TXSDate;
    FwarrantNumber : WideString;
    FwarrantFIO : WideString;
    FwarrantPassport : WideString;
    FwarrantAddress : WideString;
    FtechConditionsItem : WideString;
//???
    FtechConObjects : ENTechConditionsObjects;
//???
    FbasisType : ENBasisType;
//???
    FtechCondServicesRef : ENTechConditionsServicesRef;
//???
    FcontragentType : ENServicesContragentType;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentAddressWork : WideString read FcontragentAddressWork write FcontragentAddressWork;
    property contragentPosition : WideString read FcontragentPosition write FcontragentPosition;
    property contragentOkpo : WideString read FcontragentOkpo write FcontragentOkpo;
    property contragentBankAccount : WideString read FcontragentBankAccount write FcontragentBankAccount;
    property contragentBankName : WideString read FcontragentBankName write FcontragentBankName;
    property contragentBankMfo : WideString read FcontragentBankMfo write FcontragentBankMfo;
    property contragentBossName : WideString read FcontragentBossName write FcontragentBossName;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property warrantDate : TXSDate read FwarrantDate write FwarrantDate;
    property warrantNumber : WideString read FwarrantNumber write FwarrantNumber;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property warrantPassport : WideString read FwarrantPassport write FwarrantPassport;
    property warrantAddress : WideString read FwarrantAddress write FwarrantAddress;
    property techConditionsItem : WideString read FtechConditionsItem write FtechConditionsItem;
    property techConObjects : ENTechConditionsObjects read FtechConObjects write FtechConObjects; 
    property basisType : ENBasisType read FbasisType write FbasisType; 
    property techCondServicesRef : ENTechConditionsServicesRef read FtechCondServicesRef write FtechCondServicesRef; 
    property contragentType : ENServicesContragentType read FcontragentType write FcontragentType; 
  end;
  
{
  ENContragentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentAddressWork : WideString;
    FcontragentPosition : WideString;
    FcontragentOkpo : WideString;
    FcontragentBankAccount : WideString;
    FcontragentBankName : WideString;
    FcontragentBankMfo : WideString;
    FcontragentBossName : WideString;
    FcontragentPassport : WideString;
    FwarrantDate : TXSDate;
    FwarrantNumber : WideString;
    FwarrantFIO : WideString;
    FwarrantPassport : WideString;
    FwarrantAddress : WideString;
    FtechConditionsItem : WideString;
//???
    FtechConObjects : ENTechConditionsObjects;
//???
    FbasisType : ENBasisType;
//???
    FtechCondServicesRef : ENTechConditionsServicesRef;
//???
    FcontragentType : ENServicesContragentType;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentAddressWork : WideString read FcontragentAddressWork write FcontragentAddressWork;
    property contragentPosition : WideString read FcontragentPosition write FcontragentPosition;
    property contragentOkpo : WideString read FcontragentOkpo write FcontragentOkpo;
    property contragentBankAccount : WideString read FcontragentBankAccount write FcontragentBankAccount;
    property contragentBankName : WideString read FcontragentBankName write FcontragentBankName;
    property contragentBankMfo : WideString read FcontragentBankMfo write FcontragentBankMfo;
    property contragentBossName : WideString read FcontragentBossName write FcontragentBossName;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property warrantDate : TXSDate read FwarrantDate write FwarrantDate;
    property warrantNumber : WideString read FwarrantNumber write FwarrantNumber;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property warrantPassport : WideString read FwarrantPassport write FwarrantPassport;
    property warrantAddress : WideString read FwarrantAddress write FwarrantAddress;
    property techConditionsItem : WideString read FtechConditionsItem write FtechConditionsItem;
    property techConObjects : ENTechConditionsObjects read FtechConObjects write FtechConObjects; 
    property basisType : ENBasisType read FbasisType write FbasisType; 
    property techCondServicesRef : ENTechConditionsServicesRef read FtechCondServicesRef write FtechCondServicesRef; 
    property contragentType : ENServicesContragentType read FcontragentType write FcontragentType; 
  end;
}

  ENContragentFilter = class(ENContragent)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENContragentShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentAddressWork : WideString;
    FcontragentPosition : WideString;
    FcontragentOkpo : WideString;
    FcontragentBankAccount : WideString;
    FcontragentBankName : WideString;
    FcontragentBankMfo : WideString;
    FcontragentBossName : WideString;
    FcontragentPassport : WideString;
    FwarrantDate : TXSDate;	
    FwarrantNumber : WideString;
    FwarrantFIO : WideString;
    FwarrantPassport : WideString;
    FwarrantAddress : WideString;
    FtechConditionsItem : WideString;
    FtechConObjectsCode : Integer; 
    FtechConObjectsNumberGen : WideString;
    FtechConObjectsDateGen : TXSDate;
    FtechConObjectsCustomer : WideString;
    FtechConObjectsBuilding : WideString;
    FtechConObjectsAddress : WideString;
    FtechConObjectsTyCurrentPower : TXSDecimal;
    FtechConObjectsTyServicesPower : TXSDecimal;
    FbasisTypeCode : Integer; 
    FbasisTypeName : WideString;
    FtechCondServicesRefCode : Integer; 
    FtechCondServicesRefContractNumber : WideString;
    FtechCondServicesRefContractDate : TXSDate;
    FtechCondServicesRefFinContractNumber : WideString;
    FtechCondServicesRefFinContractDate : TXSDate;
    FtechCondServicesRefPartnerName : WideString;
    FtechCondServicesRefPartnerCode : WideString;
    FtechCondServicesRefFinDocCode : WideString;
    FtechCondServicesRefFinDocID : Integer; 
    FtechCondServicesRefFinCommentGen : WideString;
    FtechCondServicesRefTySummaGen : TXSDecimal;
    FtechCondServicesRefTySummaVat : TXSDecimal;
    FtechCondServicesRefTyServicesSumma : TXSDecimal;
    FtechCondServicesRefTyServicesPower : TXSDecimal;
    FtechCondServicesRefCommentServicesGen : WideString;
    FtechCondServicesRefUserGen : WideString;
    FtechCondServicesRefDateEdit : TXSDate;
    FtechCondServicesRefCnPackCode : Integer; 
    FcontragentTypeCode : Integer; 
    FcontragentTypeName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentAddressWork : WideString read FcontragentAddressWork write FcontragentAddressWork;
    property contragentPosition : WideString read FcontragentPosition write FcontragentPosition;
    property contragentOkpo : WideString read FcontragentOkpo write FcontragentOkpo;
    property contragentBankAccount : WideString read FcontragentBankAccount write FcontragentBankAccount;
    property contragentBankName : WideString read FcontragentBankName write FcontragentBankName;
    property contragentBankMfo : WideString read FcontragentBankMfo write FcontragentBankMfo;
    property contragentBossName : WideString read FcontragentBossName write FcontragentBossName;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property warrantDate : TXSDate read FwarrantDate write FwarrantDate;
    property warrantNumber : WideString read FwarrantNumber write FwarrantNumber;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property warrantPassport : WideString read FwarrantPassport write FwarrantPassport;
    property warrantAddress : WideString read FwarrantAddress write FwarrantAddress;
    property techConditionsItem : WideString read FtechConditionsItem write FtechConditionsItem;

    property techConObjectsCode : Integer read FtechConObjectsCode write FtechConObjectsCode; 
    property techConObjectsNumberGen : WideString read FtechConObjectsNumberGen write FtechConObjectsNumberGen; 
    property techConObjectsDateGen : TXSDate read FtechConObjectsDateGen write FtechConObjectsDateGen; 
    property techConObjectsCustomer : WideString read FtechConObjectsCustomer write FtechConObjectsCustomer; 
    property techConObjectsBuilding : WideString read FtechConObjectsBuilding write FtechConObjectsBuilding; 
    property techConObjectsAddress : WideString read FtechConObjectsAddress write FtechConObjectsAddress; 
    property techConObjectsTyCurrentPower : TXSDecimal read FtechConObjectsTyCurrentPower write FtechConObjectsTyCurrentPower; 
    property techConObjectsTyServicesPower : TXSDecimal read FtechConObjectsTyServicesPower write FtechConObjectsTyServicesPower; 
    property basisTypeCode : Integer read FbasisTypeCode write FbasisTypeCode; 
    property basisTypeName : WideString read FbasisTypeName write FbasisTypeName; 
    property techCondServicesRefCode : Integer read FtechCondServicesRefCode write FtechCondServicesRefCode; 
    property techCondServicesRefContractNumber : WideString read FtechCondServicesRefContractNumber write FtechCondServicesRefContractNumber; 
    property techCondServicesRefContractDate : TXSDate read FtechCondServicesRefContractDate write FtechCondServicesRefContractDate; 
    property techCondServicesRefFinContractNumber : WideString read FtechCondServicesRefFinContractNumber write FtechCondServicesRefFinContractNumber; 
    property techCondServicesRefFinContractDate : TXSDate read FtechCondServicesRefFinContractDate write FtechCondServicesRefFinContractDate; 
    property techCondServicesRefPartnerName : WideString read FtechCondServicesRefPartnerName write FtechCondServicesRefPartnerName; 
    property techCondServicesRefPartnerCode : WideString read FtechCondServicesRefPartnerCode write FtechCondServicesRefPartnerCode; 
    property techCondServicesRefFinDocCode : WideString read FtechCondServicesRefFinDocCode write FtechCondServicesRefFinDocCode; 
    property techCondServicesRefFinDocID : Integer read FtechCondServicesRefFinDocID write FtechCondServicesRefFinDocID; 
    property techCondServicesRefFinCommentGen : WideString read FtechCondServicesRefFinCommentGen write FtechCondServicesRefFinCommentGen; 
    property techCondServicesRefTySummaGen : TXSDecimal read FtechCondServicesRefTySummaGen write FtechCondServicesRefTySummaGen; 
    property techCondServicesRefTySummaVat : TXSDecimal read FtechCondServicesRefTySummaVat write FtechCondServicesRefTySummaVat; 
    property techCondServicesRefTyServicesSumma : TXSDecimal read FtechCondServicesRefTyServicesSumma write FtechCondServicesRefTyServicesSumma; 
    property techCondServicesRefTyServicesPower : TXSDecimal read FtechCondServicesRefTyServicesPower write FtechCondServicesRefTyServicesPower; 
    property techCondServicesRefCommentServicesGen : WideString read FtechCondServicesRefCommentServicesGen write FtechCondServicesRefCommentServicesGen; 
    property techCondServicesRefUserGen : WideString read FtechCondServicesRefUserGen write FtechCondServicesRefUserGen; 
    property techCondServicesRefDateEdit : TXSDate read FtechCondServicesRefDateEdit write FtechCondServicesRefDateEdit; 
    property techCondServicesRefCnPackCode : Integer read FtechCondServicesRefCnPackCode write FtechCondServicesRefCnPackCode; 
    property contragentTypeCode : Integer read FcontragentTypeCode write FcontragentTypeCode; 
    property contragentTypeName : WideString read FcontragentTypeName write FcontragentTypeName; 
  end;

  ArrayOfENContragentShort = array of ENContragentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENContragentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENContragentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENContragentShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENContragentController/message/
  // soapAction: http://ksoe.org/ENContragentController/action/ENContragentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENContragentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENContragentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENContragentControllerSoapPort = interface(IInvokable)
  ['{1a4f1a4f-1a4f-1a4f-1a4f-1a4f1a4f1a4f}']
    function  add(const aENContragent: ENContragent): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENContragent: ENContragent); stdcall;
    function  getObject(const anObjectCode: Integer): ENContragent; stdcall;
    function  getList: ENContragentShortList; stdcall;
    function  getFilteredList(const aENContragentFilter: ENContragentFilter): ENContragentShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENContragentShortList; stdcall;
    function  getScrollableFilteredList(const aENContragentFilter: ENContragentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENContragentShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENContragentShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENContragentFilter: ENContragentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENContragent.Destroy;
  begin
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FtechConObjects) then
      techConObjects.Free;
    if Assigned(FbasisType) then
      basisType.Free;
    if Assigned(FtechCondServicesRef) then
      techCondServicesRef.Free;
    if Assigned(FcontragentType) then
      contragentType.Free;
    inherited Destroy;
  end;

{  
  destructor ENContragentFilter.Destroy;
  begin
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FtechConObjects) then
      techConObjects.Free;
    if Assigned(FbasisType) then
      basisType.Free;
    if Assigned(FtechCondServicesRef) then
      techCondServicesRef.Free;
    if Assigned(FcontragentType) then
      contragentType.Free;
    inherited Destroy;
  end; 
}

  destructor ENContragentFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENContragentShort.Destroy;
  begin
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FtechConObjectsDateGen) then
      techConObjectsDateGen.Free;
    if Assigned(FtechConObjectsTyCurrentPower) then
      techConObjectsTyCurrentPower.Free;
    if Assigned(FtechConObjectsTyServicesPower) then
      techConObjectsTyServicesPower.Free;
    if Assigned(FtechCondServicesRefContractDate) then
      techCondServicesRefContractDate.Free;
    if Assigned(FtechCondServicesRefFinContractDate) then
      techCondServicesRefFinContractDate.Free;
    if Assigned(FtechCondServicesRefTySummaGen) then
      techCondServicesRefTySummaGen.Free;
    if Assigned(FtechCondServicesRefTySummaVat) then
      techCondServicesRefTySummaVat.Free;
    if Assigned(FtechCondServicesRefTyServicesSumma) then
      techCondServicesRefTyServicesSumma.Free;
    if Assigned(FtechCondServicesRefTyServicesPower) then
      techCondServicesRefTyServicesPower.Free;
    if Assigned(FtechCondServicesRefDateEdit) then
      techCondServicesRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENContragentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENContragent, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContragent');
  RemClassRegistry.RegisterXSClass(ENContragentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContragentRef');
  RemClassRegistry.RegisterXSClass(ENContragentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContragentFilter');
  RemClassRegistry.RegisterXSClass(ENContragentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContragentShort');
  RemClassRegistry.RegisterXSClass(ENContragentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContragentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENContragentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENContragentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENContragentControllerSoapPort), 'http://ksoe.org/ENContragentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENContragentControllerSoapPort), 'http://ksoe.org/ENContragentController/action/ENContragentController.%operationName%');


end.
