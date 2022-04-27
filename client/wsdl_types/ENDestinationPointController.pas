unit ENDestinationPointController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController
   ,ENDepartmentController
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

  ENDestinationPoint            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDestinationPointRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDestinationPoint = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FdateEdit : TXSDateTime;	
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FelementRef : ENElementRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef; 
  end;
  
{
  ENDestinationPointFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FdateEdit : DateTime; 
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : DateTime; 
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property elementRef : ENElementRef read FelementRef write FelementRef; 
  end;
}

  ENDestinationPointFilter = class(ENDestinationPoint)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENDestinationPointShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FelementRefCode : Integer;
    FdepartmentRefCode : Integer; 
    FdepartmentRefShortName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property userGen : WideString read FuserGen write FuserGen;
    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode; 
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
  end;

  ArrayOfENDestinationPointShort = array of ENDestinationPointShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDestinationPointShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDestinationPointShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDestinationPointShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDestinationPointController/message/
  // soapAction: http://ksoe.org/ENDestinationPointController/action/ENDestinationPointController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDestinationPointControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDestinationPointController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDestinationPointControllerSoapPort = interface(IInvokable)
  ['{1c3b1c3b-1c3b-1c3b-1c3b-1c3b1c3b1c3b}']
    function  add(const aENDestinationPoint: ENDestinationPoint): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDestinationPoint: ENDestinationPoint); stdcall;
    function  getObject(const anObjectCode: Integer): ENDestinationPoint; stdcall;
    function  getList: ENDestinationPointShortList; stdcall;
    function  getFilteredList(const aENDestinationPointFilter: ENDestinationPointFilter): ENDestinationPointShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDestinationPointShortList; stdcall;
    function  getScrollableFilteredList(const aENDestinationPointFilter: ENDestinationPointFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDestinationPointShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDestinationPointShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENDestinationPointFilter: ENDestinationPointFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENDestinationPoint.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENDestinationPointFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENDestinationPointFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENDestinationPointShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENDestinationPointShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDestinationPoint, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPoint');
  RemClassRegistry.RegisterXSClass(ENDestinationPointRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPointRef');
  RemClassRegistry.RegisterXSClass(ENDestinationPointFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPointFilter');
  RemClassRegistry.RegisterXSClass(ENDestinationPointShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPointShort');
  RemClassRegistry.RegisterXSClass(ENDestinationPointShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPointShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDestinationPointShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDestinationPointShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDestinationPointControllerSoapPort), 'http://ksoe.org/ENDestinationPointController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDestinationPointControllerSoapPort), 'http://ksoe.org/ENDestinationPointController/action/ENDestinationPointController.%operationName%');


end.
