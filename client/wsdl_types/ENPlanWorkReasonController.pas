unit ENPlanWorkReasonController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENManagementController 
   ,ENPlanWorkReasonTypeController 
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

  ENPlanWorkReason            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkReasonRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkReason = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FnumberGen : WideString;
    Fname : WideString;
    FcommentGen : WideString;
    FdateEdit : TXSDateTime;	
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    Fmanagement : ENManagement;
//???
    FreasonType : ENPlanWorkReasonType;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property management : ENManagement read Fmanagement write Fmanagement; 
    property reasonType : ENPlanWorkReasonType read FreasonType write FreasonType; 
  end;
  
{
  ENPlanWorkReasonFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateGen : TXSDate;
    FnumberGen : WideString;
    Fname : WideString;
    FcommentGen : WideString;
    FdateEdit : DateTime; 
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    Fmanagement : ENManagement;
//???
    FreasonType : ENPlanWorkReasonType;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : DateTime; 
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property management : ENManagement read Fmanagement write Fmanagement; 
    property reasonType : ENPlanWorkReasonType read FreasonType write FreasonType; 
  end;
}

  ENPlanWorkReasonFilter = class(ENPlanWorkReason)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPlanWorkReasonShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;	
    FnumberGen : WideString;
    Fname : WideString;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FmanagementCode : Integer; 
    FmanagementName : WideString;
    FreasonTypeCode : Integer; 
    FreasonTypeName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property userGen : WideString read FuserGen write FuserGen;

    property managementCode : Integer read FmanagementCode write FmanagementCode; 
    property managementName : WideString read FmanagementName write FmanagementName; 
    property reasonTypeCode : Integer read FreasonTypeCode write FreasonTypeCode; 
    property reasonTypeName : WideString read FreasonTypeName write FreasonTypeName; 
  end;

  ArrayOfENPlanWorkReasonShort = array of ENPlanWorkReasonShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkReasonShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkReasonShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkReasonShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkReasonController/message/
  // soapAction: http://ksoe.org/ENPlanWorkReasonController/action/ENPlanWorkReasonController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkReasonControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkReasonController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkReasonControllerSoapPort = interface(IInvokable)
  ['{1c9f1c9f-1c9f-1c9f-1c9f-1c9f1c9f1c9f}']
    function  add(const aENPlanWorkReason: ENPlanWorkReason): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkReason: ENPlanWorkReason); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkReason; stdcall;
    function  getList: ENPlanWorkReasonShortList; stdcall;
    function  getFilteredList(const aENPlanWorkReasonFilter: ENPlanWorkReasonFilter): ENPlanWorkReasonShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkReasonShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkReasonFilter: ENPlanWorkReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkReasonShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkReasonShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPlanWorkReasonFilter: ENPlanWorkReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENPlanWorkReason.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmanagement) then
      management.Free;
    if Assigned(FreasonType) then
      reasonType.Free;
    inherited Destroy;
  end;

{  
  destructor ENPlanWorkReasonFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmanagement) then
      management.Free;
    if Assigned(FreasonType) then
      reasonType.Free;
    inherited Destroy;
  end; 
}

  destructor ENPlanWorkReasonFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPlanWorkReasonShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENPlanWorkReasonShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkReason, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReason');
  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkReasonShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkReasonShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkReasonControllerSoapPort), 'http://ksoe.org/ENPlanWorkReasonController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkReasonControllerSoapPort), 'http://ksoe.org/ENPlanWorkReasonController/action/ENPlanWorkReasonController.%operationName%');


end.
