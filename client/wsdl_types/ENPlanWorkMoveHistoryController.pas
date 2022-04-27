unit ENPlanWorkMoveHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkMoveReasonController 
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

  ENPlanWorkMoveHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkMoveHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkMoveHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FyearGen : Integer; 
    FmonthGen : Integer; 
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Freason : ENPlanWorkMoveReason;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  yearGen : Integer read FyearGen write FyearGen; 
    property  monthGen : Integer read FmonthGen write FmonthGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property reason : ENPlanWorkMoveReason read Freason write Freason; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;

  ENPlanWorkMoveHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateGen : TXSDate;
    FyearGen : Integer; 
    FmonthGen : Integer; 
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Freason : ENPlanWorkMoveReason;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  yearGen : Integer read FyearGen write FyearGen; 
    property  monthGen : Integer read FmonthGen write FmonthGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property reason : ENPlanWorkMoveReason read Freason write Freason; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;


  ENPlanWorkMoveHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FyearGen : Integer; 
    FmonthGen : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FreasonCode : Integer; 
    FreasonName : WideString;
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  yearGen : Integer read FyearGen write FyearGen; 
    property  monthGen : Integer read FmonthGen write FmonthGen; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property reasonCode : Integer read FreasonCode write FreasonCode; 
    property reasonName : WideString read FreasonName write FreasonName; 
    property planRefCode : Integer read FplanRefCode write FplanRefCode; 
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen; 
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
  end;

  ArrayOfENPlanWorkMoveHistoryShort = array of ENPlanWorkMoveHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkMoveHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkMoveHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkMoveHistoryShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkMoveHistoryController/message/
  // soapAction: http://ksoe.org/ENPlanWorkMoveHistoryController/action/ENPlanWorkMoveHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkMoveHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkMoveHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkMoveHistoryControllerSoapPort = interface(IInvokable)
  ['{74A90754-C4D4-4B02-A155-87E55F346CF5}']
    function  add(const aENPlanWorkMoveHistory: ENPlanWorkMoveHistory; const isChangeForm : Boolean): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkMoveHistory: ENPlanWorkMoveHistory); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkMoveHistory; stdcall;
    function  getList: ENPlanWorkMoveHistoryShortList; stdcall;
    function  getFilteredList(const aENPlanWorkMoveHistoryFilter: ENPlanWorkMoveHistoryFilter): ENPlanWorkMoveHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkMoveHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkMoveHistoryFilter: ENPlanWorkMoveHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkMoveHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkMoveHistoryShortList; stdcall;
  end; 


implementation

  destructor ENPlanWorkMoveHistory.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Freason) then
      reason.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
  
  destructor ENPlanWorkMoveHistoryFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Freason) then
      reason.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENPlanWorkMoveHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveHistory');
  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveHistoryRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveHistoryShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkMoveHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkMoveHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkMoveHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkMoveHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkMoveHistoryControllerSoapPort), 'http://ksoe.org/ENPlanWorkMoveHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkMoveHistoryControllerSoapPort), 'http://ksoe.org/ENPlanWorkMoveHistoryController/action/ENPlanWorkMoveHistoryController.%operationName%');


end.
