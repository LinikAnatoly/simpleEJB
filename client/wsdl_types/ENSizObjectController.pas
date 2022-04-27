unit ENSizObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENElementController
  , ENDepartmentController
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

  ENSizObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSizObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSizObject = class(TRemotable)
  private
    Fcode : Integer;
    FtabNumber : WideString;
    Fprofesion : WideString;
    Ffio : WideString;
    FsizCode : Integer;
    FstatusCode : Integer;
    Fgender : Integer;
    Fgrowth : TXSDecimal;
    FsizeClothing : TXSDecimal;
    FsizeShoes : TXSDecimal;
    FsizeHead : TXSDecimal;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property profesion : WideString read Fprofesion write Fprofesion;
    property fio : WideString read Ffio write Ffio;
    property sizCode : Integer read FsizCode write FsizCode;
    property statusCode : Integer read FstatusCode write FstatusCode;
    property gender : Integer read Fgender write Fgender;
    property growth : TXSDecimal read Fgrowth write Fgrowth;
    property sizeClothing : TXSDecimal read FsizeClothing write FsizeClothing;
    property sizeShoes : TXSDecimal read FsizeShoes write FsizeShoes;
    property sizeHead : TXSDecimal read FsizeHead write FsizeHead;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;

{
  ENSizObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FtabNumber : WideString;
    Fprofesion : WideString;
    Ffio : WideString;
    FsizCode : Integer;
    FstatusCode : Integer;
    Fgender : Integer;
    Fgrowth : TXSDecimal;
    FsizeClothing : TXSDecimal;
    FsizeShoes : TXSDecimal;
    FsizeHead : TXSDecimal;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property profesion : WideString read Fprofesion write Fprofesion;
    property fio : WideString read Ffio write Ffio;
    property sizCode : Integer read FsizCode write FsizCode;
    property statusCode : Integer read FstatusCode write FstatusCode;
    property gender : Integer read Fgender write Fgender;
    property growth : TXSDecimal read Fgrowth write Fgrowth;
    property sizeClothing : TXSDecimal read FsizeClothing write FsizeClothing;
    property sizeShoes : TXSDecimal read FsizeShoes write FsizeShoes;
    property sizeHead : TXSDecimal read FsizeHead write FsizeHead;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;
}

  ENSizObjectFilter = class(ENSizObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSizObjectShort = class(TRemotable)
  private
    Fcode : Integer;
    FtabNumber : WideString;
    Fprofesion : WideString;
    Ffio : WideString;
    FsizCode : Integer;
    FstatusCode : Integer;
    Fgender : Integer;
    Fgrowth : TXSDecimal;
    FsizeClothing : TXSDecimal;
    FsizeShoes : TXSDecimal;
    FsizeHead : TXSDecimal;
    FelementCode : Integer;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FdepartmentRefRenCode : Integer;
    FdepartmentRefShpzBalans : WideString;
    FdepartmentRefKau_table_id_1884 : Integer;
    FdepartmentRefKau_1884 : WideString;
    FdepartmentRefName_1884 : WideString;
    FdepartmentRefHrmorganizationid : WideString;
    FrenName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property profesion : WideString read Fprofesion write Fprofesion;
    property fio : WideString read Ffio write Ffio;
    property  sizCode : Integer read FsizCode write FsizCode;
    property  statusCode : Integer read FstatusCode write FstatusCode;
    property  gender : Integer read Fgender write Fgender;
    property growth : TXSDecimal read Fgrowth write Fgrowth;
    property sizeClothing : TXSDecimal read FsizeClothing write FsizeClothing;
    property sizeShoes : TXSDecimal read FsizeShoes write FsizeShoes;
    property sizeHead : TXSDecimal read FsizeHead write FsizeHead;

    property elementCode : Integer read FelementCode write FelementCode;
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property departmentRefRenCode : Integer read FdepartmentRefRenCode write FdepartmentRefRenCode;
    property departmentRefShpzBalans : WideString read FdepartmentRefShpzBalans write FdepartmentRefShpzBalans;
    property departmentRefKau_table_id_1884 : Integer read FdepartmentRefKau_table_id_1884 write FdepartmentRefKau_table_id_1884;
    property departmentRefKau_1884 : WideString read FdepartmentRefKau_1884 write FdepartmentRefKau_1884;
    property departmentRefName_1884 : WideString read FdepartmentRefName_1884 write FdepartmentRefName_1884;
    property departmentRefHrmorganizationid : WideString read FdepartmentRefHrmorganizationid write FdepartmentRefHrmorganizationid;
    property renName : WideString read FrenName write FrenName;
  end;

  ArrayOfENSizObjectShort = array of ENSizObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSizObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSizObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSizObjectShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSizObjectController/message/
  // soapAction: http://ksoe.org/ENSizObjectController/action/ENSizObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSizObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSizObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSizObjectControllerSoapPort = interface(IInvokable)
  ['{6D015311-2441-4C42-A06D-1CD8C930F6C6}']
    function add(const aENSizObject: ENSizObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSizObject: ENSizObject); stdcall;
    function getObject(const anObjectCode: Integer): ENSizObject; stdcall;
    function getList: ENSizObjectShortList; stdcall;
    function getFilteredList(const aENSizObjectFilter: ENSizObjectFilter): ENSizObjectShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSizObjectShortList; stdcall;
    function getScrollableFilteredList(const aENSizObjectFilter: ENSizObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSizObjectShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSizObjectShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSizObjectFilter: ENSizObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSizObjectShort; stdcall;
    procedure updateStaffPosition(const soCode: Integer; const tabNumber: string); stdcall;
  end;


implementation

  destructor ENSizObject.Destroy;
  begin
    if Assigned(Fgrowth) then
      growth.Free;
    if Assigned(FsizeClothing) then
      sizeClothing.Free;
    if Assigned(FsizeShoes) then
      sizeShoes.Free;
    if Assigned(FsizeHead) then
      sizeHead.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSizObjectFilter.Destroy;
  begin
    if Assigned(Fgrowth) then
      growth.Free;
    if Assigned(FsizeClothing) then
      sizeClothing.Free;
    if Assigned(FsizeShoes) then
      sizeShoes.Free;
    if Assigned(FsizeHead) then
      sizeHead.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSizObjectFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSizObjectShort.Destroy;
  begin
    if Assigned(Fgrowth) then
      growth.Free;
    if Assigned(FsizeClothing) then
      sizeClothing.Free;
    if Assigned(FsizeShoes) then
      sizeShoes.Free;
    if Assigned(FsizeHead) then
      sizeHead.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENSizObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSizObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizObject');
  RemClassRegistry.RegisterXSClass(ENSizObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizObjectRef');
  RemClassRegistry.RegisterXSClass(ENSizObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizObjectFilter');
  RemClassRegistry.RegisterXSClass(ENSizObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizObjectShort');
  RemClassRegistry.RegisterXSClass(ENSizObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSizObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSizObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSizObjectControllerSoapPort), 'http://ksoe.org/ENSizObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSizObjectControllerSoapPort), 'http://ksoe.org/ENSizObjectController/action/ENSizObjectController.%operationName%');


end.
