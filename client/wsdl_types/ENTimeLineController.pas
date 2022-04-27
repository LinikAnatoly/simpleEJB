unit ENTimeLineController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENServicesObjectController 
   ,TKVirtualBrigadeController 
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

  ENTimeLine            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTimeLineRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTimeLine = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FtimeStart : TXSDateTime;	
    FtimeFinal : TXSDateTime;	
    FtimeMoveToObject : TXSDateTime;	
    FtimeMoveOfObject : TXSDateTime;	
//???
    FservicesObjectRef : ENServicesObject;
//???
    FvirtualBrigadeRef : TKVirtualBrigade;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property timeMoveToObject : TXSDateTime read FtimeMoveToObject write FtimeMoveToObject;	
    property timeMoveOfObject : TXSDateTime read FtimeMoveOfObject write FtimeMoveOfObject;	
    property servicesObjectRef : ENServicesObject read FservicesObjectRef write FservicesObjectRef; 
    property virtualBrigadeRef : TKVirtualBrigade read FvirtualBrigadeRef write FvirtualBrigadeRef; 
  end;
  
{
  ENTimeLineFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateGen : TXSDate;
    FtimeStart : DateTime; 
    FtimeFinal : DateTime; 
    FtimeMoveToObject : DateTime; 
    FtimeMoveOfObject : DateTime; 
//???
    FservicesObjectRef : ENServicesObject;
//???
    FvirtualBrigadeRef : TKVirtualBrigade;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property timeStart : DateTime; 
    property timeFinal : DateTime; 
    property timeMoveToObject : DateTime; 
    property timeMoveOfObject : DateTime; 
    property servicesObjectRef : ENServicesObject read FservicesObjectRef write FservicesObjectRef; 
    property virtualBrigadeRef : TKVirtualBrigade read FvirtualBrigadeRef write FvirtualBrigadeRef; 
  end;
}

  ENTimeLineFilter = class(ENTimeLine)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTimeLineShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;	
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FtimeMoveToObject : TXSDateTime;
    FtimeMoveOfObject : TXSDateTime;
    FservicesObjectRefCode : Integer; 
    FservicesObjectRefContractNumber : WideString;
    FservicesObjectRefContractDate : TXSDate;
    FservicesObjectRefName : WideString;
    FservicesObjectRefPartnerCode : WideString;
    FservicesObjectRefFinDocCode : WideString;
    FservicesObjectRefFinDocID : Integer; 
    FservicesObjectRefCommentGen : WideString;
    FservicesObjectRefContractNumberServices : WideString;
    FservicesObjectRefContractDateServices : TXSDate;
    FservicesObjectRefContragentName : WideString;
    FservicesObjectRefContragentAddress : WideString;
    FservicesObjectRefContragentAddressWork : WideString;
    FservicesObjectRefContragentOkpo : WideString;
    FservicesObjectRefContragentBankAccount : WideString;
    FservicesObjectRefContragentBankName : WideString;
    FservicesObjectRefContragentBankMfo : WideString;
    FservicesObjectRefContragentBossName : WideString;
    FservicesObjectRefContragentPassport : WideString;
    FservicesObjectRefContractServicesSumma : TXSDecimal;
    FservicesObjectRefContractServicesPower : TXSDecimal;
    FservicesObjectRefCommentServicesGen : WideString;
    FservicesObjectRefContractServicesDistance : TXSDecimal;
    FservicesObjectRefContractServicesDay : TXSDecimal;
    FservicesObjectRefUserGen : WideString;
    FservicesObjectRefDateEdit : TXSDate;
    FservicesObjectRefWarrantDate : TXSDate;
    FservicesObjectRefWarrantNumber : WideString;
    FservicesObjectRefWarrantFIO : WideString;
    FservicesObjectRefRegionalType : Integer; 
    FservicesObjectRefBasisType : TXSDecimal;
    FservicesObjectRefContragentPosition : WideString;
    FservicesObjectRefExecuteWorkDate : TXSDate;
    FservicesObjectRefTimeStart : TXSDateTime;	
    FservicesObjectRefTimeFinal : TXSDateTime;	
    FservicesObjectRefContragentPhoneNumber : WideString;
    FservicesObjectRefExecutorPhoneNumber : WideString;
    FvirtualBrigadeRefCode : Integer;
    /////
    FplanCode : Integer;
    FvirtualBrigadeRefNameCompound : WideString;
    Fclassifications : WideString;
    FservicesObjectRefContractStatusName : WideString;
    FservicesObjectRefBuhStatusName : WideString;
    /////
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;	
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;	
    property timeMoveToObject : TXSDateTime read FtimeMoveToObject write FtimeMoveToObject;	
    property timeMoveOfObject : TXSDateTime read FtimeMoveOfObject write FtimeMoveOfObject;	

    property servicesObjectRefCode : Integer read FservicesObjectRefCode write FservicesObjectRefCode; 
    property servicesObjectRefContractNumber : WideString read FservicesObjectRefContractNumber write FservicesObjectRefContractNumber; 
    property servicesObjectRefContractDate : TXSDate read FservicesObjectRefContractDate write FservicesObjectRefContractDate; 
    property servicesObjectRefName : WideString read FservicesObjectRefName write FservicesObjectRefName; 
    property servicesObjectRefPartnerCode : WideString read FservicesObjectRefPartnerCode write FservicesObjectRefPartnerCode; 
    property servicesObjectRefFinDocCode : WideString read FservicesObjectRefFinDocCode write FservicesObjectRefFinDocCode; 
    property servicesObjectRefFinDocID : Integer read FservicesObjectRefFinDocID write FservicesObjectRefFinDocID; 
    property servicesObjectRefCommentGen : WideString read FservicesObjectRefCommentGen write FservicesObjectRefCommentGen; 
    property servicesObjectRefContractNumberServices : WideString read FservicesObjectRefContractNumberServices write FservicesObjectRefContractNumberServices; 
    property servicesObjectRefContractDateServices : TXSDate read FservicesObjectRefContractDateServices write FservicesObjectRefContractDateServices; 
    property servicesObjectRefContragentName : WideString read FservicesObjectRefContragentName write FservicesObjectRefContragentName; 
    property servicesObjectRefContragentAddress : WideString read FservicesObjectRefContragentAddress write FservicesObjectRefContragentAddress; 
    property servicesObjectRefContragentAddressWork : WideString read FservicesObjectRefContragentAddressWork write FservicesObjectRefContragentAddressWork; 
    property servicesObjectRefContragentOkpo : WideString read FservicesObjectRefContragentOkpo write FservicesObjectRefContragentOkpo; 
    property servicesObjectRefContragentBankAccount : WideString read FservicesObjectRefContragentBankAccount write FservicesObjectRefContragentBankAccount; 
    property servicesObjectRefContragentBankName : WideString read FservicesObjectRefContragentBankName write FservicesObjectRefContragentBankName; 
    property servicesObjectRefContragentBankMfo : WideString read FservicesObjectRefContragentBankMfo write FservicesObjectRefContragentBankMfo; 
    property servicesObjectRefContragentBossName : WideString read FservicesObjectRefContragentBossName write FservicesObjectRefContragentBossName; 
    property servicesObjectRefContragentPassport : WideString read FservicesObjectRefContragentPassport write FservicesObjectRefContragentPassport; 
    property servicesObjectRefContractServicesSumma : TXSDecimal read FservicesObjectRefContractServicesSumma write FservicesObjectRefContractServicesSumma; 
    property servicesObjectRefContractServicesPower : TXSDecimal read FservicesObjectRefContractServicesPower write FservicesObjectRefContractServicesPower; 
    property servicesObjectRefCommentServicesGen : WideString read FservicesObjectRefCommentServicesGen write FservicesObjectRefCommentServicesGen; 
    property servicesObjectRefContractServicesDistance : TXSDecimal read FservicesObjectRefContractServicesDistance write FservicesObjectRefContractServicesDistance; 
    property servicesObjectRefContractServicesDay : TXSDecimal read FservicesObjectRefContractServicesDay write FservicesObjectRefContractServicesDay; 
    property servicesObjectRefUserGen : WideString read FservicesObjectRefUserGen write FservicesObjectRefUserGen; 
    property servicesObjectRefDateEdit : TXSDate read FservicesObjectRefDateEdit write FservicesObjectRefDateEdit; 
    property servicesObjectRefWarrantDate : TXSDate read FservicesObjectRefWarrantDate write FservicesObjectRefWarrantDate; 
    property servicesObjectRefWarrantNumber : WideString read FservicesObjectRefWarrantNumber write FservicesObjectRefWarrantNumber; 
    property servicesObjectRefWarrantFIO : WideString read FservicesObjectRefWarrantFIO write FservicesObjectRefWarrantFIO; 
    property servicesObjectRefRegionalType : Integer read FservicesObjectRefRegionalType write FservicesObjectRefRegionalType; 
    property servicesObjectRefBasisType : TXSDecimal read FservicesObjectRefBasisType write FservicesObjectRefBasisType; 
    property servicesObjectRefContragentPosition : WideString read FservicesObjectRefContragentPosition write FservicesObjectRefContragentPosition; 
    property servicesObjectRefExecuteWorkDate : TXSDate read FservicesObjectRefExecuteWorkDate write FservicesObjectRefExecuteWorkDate; 
    property servicesObjectRefTimeStart : TXSDateTime read FservicesObjectRefTimeStart write FservicesObjectRefTimeStart; 
    property servicesObjectRefTimeFinal : TXSDateTime read FservicesObjectRefTimeFinal write FservicesObjectRefTimeFinal; 
    property servicesObjectRefContragentPhoneNumber : WideString read FservicesObjectRefContragentPhoneNumber write FservicesObjectRefContragentPhoneNumber; 
    property servicesObjectRefExecutorPhoneNumber : WideString read FservicesObjectRefExecutorPhoneNumber write FservicesObjectRefExecutorPhoneNumber; 
    property virtualBrigadeRefCode : Integer read FvirtualBrigadeRefCode write FvirtualBrigadeRefCode; //TKVirtualBrigadeRef read FvirtualBrigadeRefCode write FvirtualBrigadeRefCode;
    /////
    property planCode : Integer read FplanCode write FplanCode;
    property virtualBrigadeRefNameCompound : WideString read FvirtualBrigadeRefNameCompound write FvirtualBrigadeRefNameCompound;
    property classifications : WideString read Fclassifications write Fclassifications;
    property servicesObjectRefContractStatusName : WideString read FservicesObjectRefContractStatusName write FservicesObjectRefContractStatusName;
    property servicesObjectRefBuhStatusName : WideString read FservicesObjectRefBuhStatusName write FservicesObjectRefBuhStatusName;
    /////
  end;

  ArrayOfENTimeLineShort = array of ENTimeLineShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTimeLineShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTimeLineShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTimeLineShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTimeLineController/message/
  // soapAction: http://ksoe.org/ENTimeLineController/action/ENTimeLineController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTimeLineControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTimeLineController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTimeLineControllerSoapPort = interface(IInvokable)
  ['{578d578d-578d-578d-578d-578d578d578d}']
    function  add(const aENTimeLine: ENTimeLine): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTimeLine: ENTimeLine); stdcall;
    function  getObject(const anObjectCode: Integer): ENTimeLine; stdcall;
    function  getList: ENTimeLineShortList; stdcall;
    function  getFilteredList(const aENTimeLineFilter: ENTimeLineFilter): ENTimeLineShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTimeLineShortList; stdcall;
    function  getScrollableFilteredList(const aENTimeLineFilter: ENTimeLineFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTimeLineShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTimeLineShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTimeLineFilter: ENTimeLineFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function  getScrollableFilteredListForPlanning(const aENTimeLineFilter: ENTimeLineFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTimeLineShortList; stdcall;
    //
    function  addTimeLine( const servicesObject : ENServicesObject; timeLineList : ArrayOfENTimeLineShort) : Integer; stdcall;
    procedure removeTimeLine(const servicesObject: ENServicesObject); stdcall;
  end; 


implementation

  destructor ENTimeLine.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FtimeMoveToObject) then
      timeMoveToObject.Free;
    if Assigned(FtimeMoveOfObject) then
      timeMoveOfObject.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FvirtualBrigadeRef) then
      virtualBrigadeRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTimeLineFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FtimeMoveToObject) then
      timeMoveToObject.Free;
    if Assigned(FtimeMoveOfObject) then
      timeMoveOfObject.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FvirtualBrigadeRef) then
      virtualBrigadeRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTimeLineFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTimeLineShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FtimeMoveToObject) then
      timeMoveToObject.Free;
    if Assigned(FtimeMoveOfObject) then
      timeMoveOfObject.Free;
    if Assigned(FservicesObjectRefContractDate) then
      servicesObjectRefContractDate.Free;
    if Assigned(FservicesObjectRefContractDateServices) then
      servicesObjectRefContractDateServices.Free;
    if Assigned(FservicesObjectRefContractServicesSumma) then
      servicesObjectRefContractServicesSumma.Free;
    if Assigned(FservicesObjectRefContractServicesPower) then
      servicesObjectRefContractServicesPower.Free;
    if Assigned(FservicesObjectRefContractServicesDistance) then
      servicesObjectRefContractServicesDistance.Free;
    if Assigned(FservicesObjectRefContractServicesDay) then
      servicesObjectRefContractServicesDay.Free;
    if Assigned(FservicesObjectRefDateEdit) then
      servicesObjectRefDateEdit.Free;
    if Assigned(FservicesObjectRefWarrantDate) then
      servicesObjectRefWarrantDate.Free;
    if Assigned(FservicesObjectRefBasisType) then
      servicesObjectRefBasisType.Free;
    if Assigned(FservicesObjectRefExecuteWorkDate) then
      servicesObjectRefExecuteWorkDate.Free;
    if Assigned(FservicesObjectRefTimeStart) then
      servicesObjectRefTimeStart.Free;
    if Assigned(FservicesObjectRefTimeFinal) then
      servicesObjectRefTimeFinal.Free;
    inherited Destroy;
  end; 
  
  destructor ENTimeLineShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTimeLine, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTimeLine');
  RemClassRegistry.RegisterXSClass(ENTimeLineRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTimeLineRef');
  RemClassRegistry.RegisterXSClass(ENTimeLineFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTimeLineFilter');
  RemClassRegistry.RegisterXSClass(ENTimeLineShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTimeLineShort');
  RemClassRegistry.RegisterXSClass(ENTimeLineShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTimeLineShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTimeLineShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTimeLineShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTimeLineControllerSoapPort), 'http://ksoe.org/ENTimeLineController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTimeLineControllerSoapPort), 'http://ksoe.org/ENTimeLineController/action/ENTimeLineController.%operationName%');


end.
