unit RQMaterialsGroupController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   //,RQMaterialsGroupController 
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

  RQMaterialsGroup            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMaterialsGroupRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMaterialsGroup = class(TRemotable)
  private
    Fcode : Integer; 
    FoutCode : Integer; 
    Fname : WideString;
    FdateDelete : TXSDate;
    Fmodify_time : Int64;
//???
    FparentRef : RQMaterialsGroupRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  outCode : Integer read FoutCode write FoutCode; 
    property name : WideString read Fname write Fname;
    property dateDelete : TXSDate read FdateDelete write FdateDelete;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property parentRef : RQMaterialsGroupRef read FparentRef write FparentRef; 
  end;

  RQMaterialsGroupFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FoutCode : Integer; 
    Fname : WideString;
    FdateDelete : TXSDate;
    Fmodify_time : Int64;
//???
    FparentRef : RQMaterialsGroupRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  outCode : Integer read FoutCode write FoutCode; 
    property name : WideString read Fname write Fname;
    property dateDelete : TXSDate read FdateDelete write FdateDelete;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property parentRef : RQMaterialsGroupRef read FparentRef write FparentRef; 
  end;


  RQMaterialsGroupShort = class(TRemotable)
  private
    Fcode : Integer; 
    FoutCode : Integer; 
    Fname : WideString;
    FparentRefCode : Integer; 
    FparentRefOutCode : Integer; 
    FparentRefName : WideString;
    FchildCount : Integer;
  published
    property  code : Integer read Fcode write Fcode; 
    property  outCode : Integer read FoutCode write FoutCode; 
    property name : WideString read Fname write Fname;

    property parentRefCode : Integer read FparentRefCode write FparentRefCode; 
    property parentRefOutCode : Integer read FparentRefOutCode write FparentRefOutCode; 
    property parentRefName : WideString read FparentRefName write FparentRefName;
    property childCount : Integer read FchildCount write FchildCount; 
  end;

  ArrayOfRQMaterialsGroupShort = array of RQMaterialsGroupShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQMaterialsGroupShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQMaterialsGroupShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQMaterialsGroupShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQMaterialsGroupController/message/
  // soapAction: http://ksoe.org/RQMaterialsGroupController/action/RQMaterialsGroupController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQMaterialsGroupControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQMaterialsGroupController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQMaterialsGroupControllerSoapPort = interface(IInvokable)
  ['{343b343b-343b-343b-343b-343b343b343b}']
    function  add(const aRQMaterialsGroup: RQMaterialsGroup): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQMaterialsGroup: RQMaterialsGroup); stdcall;
    function  getObject(const anObjectCode: Integer): RQMaterialsGroup; stdcall;
    function  getList: RQMaterialsGroupShortList; stdcall;
    function  getFilteredList(const aRQMaterialsGroupFilter: RQMaterialsGroupFilter): RQMaterialsGroupShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQMaterialsGroupShortList; stdcall;
    function  getScrollableFilteredList(const aRQMaterialsGroupFilter: RQMaterialsGroupFilter; const aFromPosition: Integer; const aQuantity: Integer): RQMaterialsGroupShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQMaterialsGroupShortList; stdcall;
  end; 


implementation

  destructor RQMaterialsGroup.Destroy;
  begin
    if Assigned(FdateDelete) then
      dateDelete.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;
  
  destructor RQMaterialsGroupFilter.Destroy;
  begin
    if Assigned(FdateDelete) then
      dateDelete.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor RQMaterialsGroupShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQMaterialsGroup, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsGroup');
  RemClassRegistry.RegisterXSClass(RQMaterialsGroupRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsGroupRef');
  RemClassRegistry.RegisterXSClass(RQMaterialsGroupFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsGroupFilter');
  RemClassRegistry.RegisterXSClass(RQMaterialsGroupShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsGroupShort');
  RemClassRegistry.RegisterXSClass(RQMaterialsGroupShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsGroupShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQMaterialsGroupShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQMaterialsGroupShort');

  InvRegistry.RegisterInterface(TypeInfo(RQMaterialsGroupControllerSoapPort), 'http://ksoe.org/RQMaterialsGroupController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQMaterialsGroupControllerSoapPort), 'http://ksoe.org/RQMaterialsGroupController/action/RQMaterialsGroupController.%operationName%');


end.
