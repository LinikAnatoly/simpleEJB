unit ENPlanCorrectHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkController 
   //,ENPlanWorkController
   //,ENPlanWorkController 
   ,ENPlanCorrectReasonController
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

  ENPlanCorrectHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanCorrectHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanCorrectHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;

    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanOldRef : ENPlanWorkRef;
//???
    FplanNewRef : ENPlanWorkRef;
//???
    Freason : ENPlanCorrectReason;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property planOldRef : ENPlanWorkRef read FplanOldRef write FplanOldRef; 
    property planNewRef : ENPlanWorkRef read FplanNewRef write FplanNewRef; 
    property reason : ENPlanCorrectReason read Freason write Freason; 
  end;

  ENPlanCorrectHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;

    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanOldRef : ENPlanWorkRef;
//???
    FplanNewRef : ENPlanWorkRef;
//???
    Freason : ENPlanCorrectReason;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property planOldRef : ENPlanWorkRef read FplanOldRef write FplanOldRef; 
    property planNewRef : ENPlanWorkRef read FplanNewRef write FplanNewRef; 
    property reason : ENPlanCorrectReason read Freason write Freason; 
  end;


  ENPlanCorrectHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanOldRefCode : Integer; 
    FplanOldRefDateGen : TXSDate;
    FplanOldRefYearGen : Integer; 
    FplanOldRefMonthGen : Integer; 
    FplanOldRefUserGen : WideString;
    FplanOldRefDateEdit : TXSDate;
    FplanNewRefCode : Integer; 
    FplanNewRefDateGen : TXSDate;
    FplanNewRefYearGen : Integer; 
    FplanNewRefMonthGen : Integer; 
    FplanNewRefUserGen : WideString;
    FplanNewRefDateEdit : TXSDate;
    FreasonCode : Integer; 
    FreasonName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property planRefCode : Integer read FplanRefCode write FplanRefCode; 
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen; 
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
    property planOldRefCode : Integer read FplanOldRefCode write FplanOldRefCode; 
    property planOldRefDateGen : TXSDate read FplanOldRefDateGen write FplanOldRefDateGen; 
    property planOldRefYearGen : Integer read FplanOldRefYearGen write FplanOldRefYearGen; 
    property planOldRefMonthGen : Integer read FplanOldRefMonthGen write FplanOldRefMonthGen; 
    property planOldRefUserGen : WideString read FplanOldRefUserGen write FplanOldRefUserGen; 
    property planOldRefDateEdit : TXSDate read FplanOldRefDateEdit write FplanOldRefDateEdit; 
    property planNewRefCode : Integer read FplanNewRefCode write FplanNewRefCode; 
    property planNewRefDateGen : TXSDate read FplanNewRefDateGen write FplanNewRefDateGen; 
    property planNewRefYearGen : Integer read FplanNewRefYearGen write FplanNewRefYearGen; 
    property planNewRefMonthGen : Integer read FplanNewRefMonthGen write FplanNewRefMonthGen; 
    property planNewRefUserGen : WideString read FplanNewRefUserGen write FplanNewRefUserGen; 
    property planNewRefDateEdit : TXSDate read FplanNewRefDateEdit write FplanNewRefDateEdit; 
    property reasonCode : Integer read FreasonCode write FreasonCode; 
    property reasonName : WideString read FreasonName write FreasonName; 
  end;

  ArrayOfENPlanCorrectHistoryShort = array of ENPlanCorrectHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanCorrectHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanCorrectHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanCorrectHistoryShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanCorrectHistoryController/message/
  // soapAction: http://ksoe.org/ENPlanCorrectHistoryController/action/ENPlanCorrectHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanCorrectHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanCorrectHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanCorrectHistoryControllerSoapPort = interface(IInvokable)
  ['{CE86DB20-54D4-4A72-AF12-5F19AD432CF8}']
    function  add(const aENPlanCorrectHistory: ENPlanCorrectHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanCorrectHistory: ENPlanCorrectHistory); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanCorrectHistory; stdcall;
    function  getList: ENPlanCorrectHistoryShortList; stdcall;
    function  getFilteredList(const aENPlanCorrectHistoryFilter: ENPlanCorrectHistoryFilter): ENPlanCorrectHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanCorrectHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanCorrectHistoryFilter: ENPlanCorrectHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanCorrectHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanCorrectHistoryShortList; stdcall;
  end; 


implementation

  destructor ENPlanCorrectHistory.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanOldRef) then
      planOldRef.Free;
    if Assigned(FplanNewRef) then
      planNewRef.Free;
    if Assigned(Freason) then
      reason.Free;
    inherited Destroy;
  end;
  
  destructor ENPlanCorrectHistoryFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanOldRef) then
      planOldRef.Free;
    if Assigned(FplanNewRef) then
      planNewRef.Free;
    if Assigned(Freason) then
      reason.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENPlanCorrectHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanCorrectHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectHistory');
  RemClassRegistry.RegisterXSClass(ENPlanCorrectHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectHistoryRef');
  RemClassRegistry.RegisterXSClass(ENPlanCorrectHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENPlanCorrectHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectHistoryShort');
  RemClassRegistry.RegisterXSClass(ENPlanCorrectHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanCorrectHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanCorrectHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanCorrectHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanCorrectHistoryControllerSoapPort), 'http://ksoe.org/ENPlanCorrectHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanCorrectHistoryControllerSoapPort), 'http://ksoe.org/ENPlanCorrectHistoryController/action/ENPlanCorrectHistoryController.%operationName%');


end.
