unit ENSzBrigadeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
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

  ENSzBrigade            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSzBrigadeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSzBrigade = class(TRemotable)
  private
    Fcode : Integer;
    Fnazv : WideString;
    Fceh_nazv : WideString;
    Fmain_podr_nazv : WideString;
    FsizCode : Integer;
    FpodrId : Integer;
    FcehId : Integer;
    Fquantity : Integer;
    FmolCode : WideString;
    FmolName : WideString;
    FstatusCode : Integer;
//???
    Felement : ENElement;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property nazv : WideString read Fnazv write Fnazv;
    property ceh_nazv : WideString read Fceh_nazv write Fceh_nazv;
    property main_podr_nazv : WideString read Fmain_podr_nazv write Fmain_podr_nazv;
    property  sizCode : Integer read FsizCode write FsizCode;
    property  podrId : Integer read FpodrId write FpodrId;
    property  cehId : Integer read FcehId write FcehId;
    property  quantity : Integer read Fquantity write Fquantity;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property  statusCode : Integer read FstatusCode write FstatusCode;
    property element : ENElement read Felement write Felement;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;

{
  ENSzBrigadeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fnazv : WideString;
    Fceh_nazv : WideString;
    Fmain_podr_nazv : WideString;
    FsizCode : Integer;
    FpodrId : Integer;
    FcehId : Integer;
    Fquantity : Integer;
    FmolCode : WideString;
    FmolName : WideString;
    FstatusCode : Integer;
//???
    Felement : ENElement;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property nazv : WideString read Fnazv write Fnazv;
    property ceh_nazv : WideString read Fceh_nazv write Fceh_nazv;
    property main_podr_nazv : WideString read Fmain_podr_nazv write Fmain_podr_nazv;
    property  sizCode : Integer read FsizCode write FsizCode;
    property  podrId : Integer read FpodrId write FpodrId;
    property  cehId : Integer read FcehId write FcehId;
    property  quantity : Integer read Fquantity write Fquantity;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property  statusCode : Integer read FstatusCode write FstatusCode;
    property element : ENElement read Felement write Felement;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;
}

  ENSzBrigadeFilter = class(ENSzBrigade)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSzBrigadeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnazv : WideString;
    Fceh_nazv : WideString;
    Fmain_podr_nazv : WideString;
    FsizCode : Integer;
    FpodrId : Integer;
    FcehId : Integer;
    Fquantity : Integer;
    FmolCode : WideString;
    FmolName : WideString;
    FstatusCode : Integer;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property nazv : WideString read Fnazv write Fnazv;
    property ceh_nazv : WideString read Fceh_nazv write Fceh_nazv;
    property main_podr_nazv : WideString read Fmain_podr_nazv write Fmain_podr_nazv;
    property  sizCode : Integer read FsizCode write FsizCode;
    property  podrId : Integer read FpodrId write FpodrId;
    property  cehId : Integer read FcehId write FcehId;
    property  quantity : Integer read Fquantity write Fquantity;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property  statusCode : Integer read FstatusCode write FstatusCode;

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
  end;

  ArrayOfENSzBrigadeShort = array of ENSzBrigadeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSzBrigadeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSzBrigadeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSzBrigadeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSzBrigadeController/message/
  // soapAction: http://ksoe.org/ENSzBrigadeController/action/ENSzBrigadeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSzBrigadeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSzBrigadeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSzBrigadeControllerSoapPort = interface(IInvokable)
  ['{8675D50D-9FFF-4254-8F23-2239BF2BE184}']
    function add(const aENSzBrigade: ENSzBrigade): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSzBrigade: ENSzBrigade); stdcall;
    function getObject(const anObjectCode: Integer): ENSzBrigade; stdcall;
    function getList: ENSzBrigadeShortList; stdcall;
    function getFilteredList(const aENSzBrigadeFilter: ENSzBrigadeFilter): ENSzBrigadeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSzBrigadeShortList; stdcall;
    function getScrollableFilteredList(const aENSzBrigadeFilter: ENSzBrigadeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSzBrigadeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSzBrigadeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSzBrigadeFilter: ENSzBrigadeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSzBrigadeShort; stdcall;
  end;


implementation

  destructor ENSzBrigade.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSzBrigadeFilter.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSzBrigadeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSzBrigadeShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENSzBrigadeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSzBrigade, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSzBrigade');
  RemClassRegistry.RegisterXSClass(ENSzBrigadeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSzBrigadeRef');
  RemClassRegistry.RegisterXSClass(ENSzBrigadeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSzBrigadeFilter');
  RemClassRegistry.RegisterXSClass(ENSzBrigadeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSzBrigadeShort');
  RemClassRegistry.RegisterXSClass(ENSzBrigadeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSzBrigadeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSzBrigadeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSzBrigadeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSzBrigadeControllerSoapPort), 'http://ksoe.org/ENSzBrigadeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSzBrigadeControllerSoapPort), 'http://ksoe.org/ENSzBrigadeController/action/ENSzBrigadeController.%operationName%');


end.
