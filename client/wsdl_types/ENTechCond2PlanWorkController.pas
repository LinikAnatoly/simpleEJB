unit ENTechCond2PlanWorkController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTechConditionsServicesController 
   ,ENPlanWorkController 
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

  ENTechCond2PlanWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechCond2PlanWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechCond2PlanWork = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FtechConServicesRef : ENTechConditionsServicesRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property techConServicesRef : ENTechConditionsServicesRef read FtechConServicesRef write FtechConServicesRef; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;
  
{
  ENTechCond2PlanWorkFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FtechConServicesRef : ENTechConditionsServicesRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property techConServicesRef : ENTechConditionsServicesRef read FtechConServicesRef write FtechConServicesRef; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;
}

  ENTechCond2PlanWorkFilter = class(ENTechCond2PlanWork)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTechCond2PlanWorkShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtechConServicesRefCode : Integer; 
    FtechConServicesRefContractNumber : WideString;
    FtechConServicesRefContractDate : TXSDate;
    FtechConServicesRefFinContractNumber : WideString;
    FtechConServicesRefFinContractDate : TXSDate;
    FtechConServicesRefPartnerName : WideString;
    FtechConServicesRefPartnerCode : WideString;
    FtechConServicesRefFinDocCode : WideString;
    FtechConServicesRefFinDocID : Integer; 
    FtechConServicesRefFinCommentGen : WideString;
    FtechConServicesRefContragentName : WideString;
    FtechConServicesRefContragentAddress : WideString;
    FtechConServicesRefContragentAddressWork : WideString;
    FtechConServicesRefContragentOkpo : WideString;
    FtechConServicesRefContragentBankAccount : WideString;
    FtechConServicesRefContragentBankName : WideString;
    FtechConServicesRefContragentBankMfo : WideString;
    FtechConServicesRefContragentBossName : WideString;
    FtechConServicesRefContragentPassport : WideString;
    FtechConServicesRefTyServicesSumma : TXSDecimal;
    FtechConServicesRefTyServicesPower : TXSDecimal;
    FtechConServicesRefCommentServicesGen : WideString;
    FtechConServicesRefUserGen : WideString;
    FtechConServicesRefDateEdit : TXSDate;
    FtechConServicesRefWarrantDate : TXSDate;
    FtechConServicesRefWarrantNumber : WideString;
    FtechConServicesRefWarrantFIO : WideString;
    FtechConServicesRefWarrantPassport : WideString;
    FplanRefCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property techConServicesRefCode : Integer read FtechConServicesRefCode write FtechConServicesRefCode; 
    property techConServicesRefContractNumber : WideString read FtechConServicesRefContractNumber write FtechConServicesRefContractNumber; 
    property techConServicesRefContractDate : TXSDate read FtechConServicesRefContractDate write FtechConServicesRefContractDate; 
    property techConServicesRefFinContractNumber : WideString read FtechConServicesRefFinContractNumber write FtechConServicesRefFinContractNumber; 
    property techConServicesRefFinContractDate : TXSDate read FtechConServicesRefFinContractDate write FtechConServicesRefFinContractDate; 
    property techConServicesRefPartnerName : WideString read FtechConServicesRefPartnerName write FtechConServicesRefPartnerName; 
    property techConServicesRefPartnerCode : WideString read FtechConServicesRefPartnerCode write FtechConServicesRefPartnerCode; 
    property techConServicesRefFinDocCode : WideString read FtechConServicesRefFinDocCode write FtechConServicesRefFinDocCode; 
    property techConServicesRefFinDocID : Integer read FtechConServicesRefFinDocID write FtechConServicesRefFinDocID; 
    property techConServicesRefFinCommentGen : WideString read FtechConServicesRefFinCommentGen write FtechConServicesRefFinCommentGen; 
    property techConServicesRefContragentName : WideString read FtechConServicesRefContragentName write FtechConServicesRefContragentName; 
    property techConServicesRefContragentAddress : WideString read FtechConServicesRefContragentAddress write FtechConServicesRefContragentAddress; 
    property techConServicesRefContragentAddressWork : WideString read FtechConServicesRefContragentAddressWork write FtechConServicesRefContragentAddressWork; 
    property techConServicesRefContragentOkpo : WideString read FtechConServicesRefContragentOkpo write FtechConServicesRefContragentOkpo; 
    property techConServicesRefContragentBankAccount : WideString read FtechConServicesRefContragentBankAccount write FtechConServicesRefContragentBankAccount; 
    property techConServicesRefContragentBankName : WideString read FtechConServicesRefContragentBankName write FtechConServicesRefContragentBankName; 
    property techConServicesRefContragentBankMfo : WideString read FtechConServicesRefContragentBankMfo write FtechConServicesRefContragentBankMfo; 
    property techConServicesRefContragentBossName : WideString read FtechConServicesRefContragentBossName write FtechConServicesRefContragentBossName; 
    property techConServicesRefContragentPassport : WideString read FtechConServicesRefContragentPassport write FtechConServicesRefContragentPassport; 
    property techConServicesRefTyServicesSumma : TXSDecimal read FtechConServicesRefTyServicesSumma write FtechConServicesRefTyServicesSumma; 
    property techConServicesRefTyServicesPower : TXSDecimal read FtechConServicesRefTyServicesPower write FtechConServicesRefTyServicesPower; 
    property techConServicesRefCommentServicesGen : WideString read FtechConServicesRefCommentServicesGen write FtechConServicesRefCommentServicesGen; 
    property techConServicesRefUserGen : WideString read FtechConServicesRefUserGen write FtechConServicesRefUserGen; 
    property techConServicesRefDateEdit : TXSDate read FtechConServicesRefDateEdit write FtechConServicesRefDateEdit; 
    property techConServicesRefWarrantDate : TXSDate read FtechConServicesRefWarrantDate write FtechConServicesRefWarrantDate; 
    property techConServicesRefWarrantNumber : WideString read FtechConServicesRefWarrantNumber write FtechConServicesRefWarrantNumber; 
    property techConServicesRefWarrantFIO : WideString read FtechConServicesRefWarrantFIO write FtechConServicesRefWarrantFIO; 
    property techConServicesRefWarrantPassport : WideString read FtechConServicesRefWarrantPassport write FtechConServicesRefWarrantPassport; 
    property planRefCode : Integer read FplanRefCode write FplanRefCode; //ENPlanWorkRef read FplanRefCode write FplanRefCode; 
  end;

  ArrayOfENTechCond2PlanWorkShort = array of ENTechCond2PlanWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechCond2PlanWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechCond2PlanWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechCond2PlanWorkShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechCond2PlanWorkController/message/
  // soapAction: http://ksoe.org/ENTechCond2PlanWorkController/action/ENTechCond2PlanWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechCond2PlanWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechCond2PlanWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechCond2PlanWorkControllerSoapPort = interface(IInvokable)
  ['{22da22da-22da-22da-22da-22da22da22da}']
    function  add(const aENTechCond2PlanWork: ENTechCond2PlanWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechCond2PlanWork: ENTechCond2PlanWork); stdcall;
    function  getObject(const anObjectCode: Integer): ENTechCond2PlanWork; stdcall;
    function  getList: ENTechCond2PlanWorkShortList; stdcall;
    function  getFilteredList(const aENTechCond2PlanWorkFilter: ENTechCond2PlanWorkFilter): ENTechCond2PlanWorkShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechCond2PlanWorkShortList; stdcall;
    function  getScrollableFilteredList(const aENTechCond2PlanWorkFilter: ENTechCond2PlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechCond2PlanWorkShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechCond2PlanWorkShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTechCond2PlanWorkFilter: ENTechCond2PlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTechCond2PlanWork.Destroy;
  begin
    if Assigned(FtechConServicesRef) then
      techConServicesRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTechCond2PlanWorkFilter.Destroy;
  begin
    if Assigned(FtechConServicesRef) then
      techConServicesRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTechCond2PlanWorkFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTechCond2PlanWorkShort.Destroy;
  begin
    if Assigned(FtechConServicesRefContractDate) then
      techConServicesRefContractDate.Free;
    if Assigned(FtechConServicesRefFinContractDate) then
      techConServicesRefFinContractDate.Free;
    if Assigned(FtechConServicesRefTyServicesSumma) then
      techConServicesRefTyServicesSumma.Free;
    if Assigned(FtechConServicesRefTyServicesPower) then
      techConServicesRefTyServicesPower.Free;
    if Assigned(FtechConServicesRefDateEdit) then
      techConServicesRefDateEdit.Free;
    if Assigned(FtechConServicesRefWarrantDate) then
      techConServicesRefWarrantDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENTechCond2PlanWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechCond2PlanWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCond2PlanWork');
  RemClassRegistry.RegisterXSClass(ENTechCond2PlanWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCond2PlanWorkRef');
  RemClassRegistry.RegisterXSClass(ENTechCond2PlanWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCond2PlanWorkFilter');
  RemClassRegistry.RegisterXSClass(ENTechCond2PlanWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCond2PlanWorkShort');
  RemClassRegistry.RegisterXSClass(ENTechCond2PlanWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCond2PlanWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechCond2PlanWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechCond2PlanWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechCond2PlanWorkControllerSoapPort), 'http://ksoe.org/ENTechCond2PlanWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechCond2PlanWorkControllerSoapPort), 'http://ksoe.org/ENTechCond2PlanWorkController/action/ENTechCond2PlanWorkController.%operationName%');


end.
