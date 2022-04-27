unit FKProvObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2;

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

  FKProvObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FKProvObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FKProvObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fuser_name : WideString;
    Fday_prov : Integer; 
    Fdt_prov : TXSDate;
    Fbal_ceh : WideString;
    Fbal_sch : WideString;
    Fbal_sub_sch : WideString;
    Fbal_kau : WideString;
    Fkor_ceh : WideString;
    Fkor_sch : WideString;
    Fkor_sub_sch : WideString;
    Fkor_kau : WideString;
    Fsumma : TXSDecimal;
    Fprimechan : WideString;
    Fdoc_id : Integer; 
    Fid : Integer; 
    Ftask_id : Integer; 
    Ftask_owner : WideString;
    Foper_id : Integer; 
    Fdt_vvod : TXSDate;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property user_name : WideString read Fuser_name write Fuser_name;
    property  day_prov : Integer read Fday_prov write Fday_prov; 
    property dt_prov : TXSDate read Fdt_prov write Fdt_prov;
    property bal_ceh : WideString read Fbal_ceh write Fbal_ceh;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property bal_sub_sch : WideString read Fbal_sub_sch write Fbal_sub_sch;
    property bal_kau : WideString read Fbal_kau write Fbal_kau;
    property kor_ceh : WideString read Fkor_ceh write Fkor_ceh;
    property kor_sch : WideString read Fkor_sch write Fkor_sch;
    property kor_sub_sch : WideString read Fkor_sub_sch write Fkor_sub_sch;
    property kor_kau : WideString read Fkor_kau write Fkor_kau;
    property summa : TXSDecimal read Fsumma write Fsumma; 
    property primechan : WideString read Fprimechan write Fprimechan;
    property  doc_id : Integer read Fdoc_id write Fdoc_id; 
    property  id : Integer read Fid write Fid; 
    property  task_id : Integer read Ftask_id write Ftask_id; 
    property task_owner : WideString read Ftask_owner write Ftask_owner;
    property  oper_id : Integer read Foper_id write Foper_id; 
    property dt_vvod : TXSDate read Fdt_vvod write Fdt_vvod;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;
  
{
  FKProvObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fuser_name : WideString;
    Fday_prov : Integer; 
    Fdt_prov : TXSDate;
    Fbal_ceh : WideString;
    Fbal_sch : WideString;
    Fbal_sub_sch : WideString;
    Fbal_kau : WideString;
    Fkor_ceh : WideString;
    Fkor_sch : WideString;
    Fkor_sub_sch : WideString;
    Fkor_kau : WideString;
    Fsumma : TXSDecimal;
    Fprimechan : WideString;
    Fdoc_id : Integer; 
    Fid : Integer; 
    Ftask_id : Integer; 
    Ftask_owner : WideString;
    Foper_id : Integer; 
    Fdt_vvod : TXSDate;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property user_name : WideString read Fuser_name write Fuser_name;
    property  day_prov : Integer read Fday_prov write Fday_prov; 
    property dt_prov : TXSDate read Fdt_prov write Fdt_prov;
    property bal_ceh : WideString read Fbal_ceh write Fbal_ceh;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property bal_sub_sch : WideString read Fbal_sub_sch write Fbal_sub_sch;
    property bal_kau : WideString read Fbal_kau write Fbal_kau;
    property kor_ceh : WideString read Fkor_ceh write Fkor_ceh;
    property kor_sch : WideString read Fkor_sch write Fkor_sch;
    property kor_sub_sch : WideString read Fkor_sub_sch write Fkor_sub_sch;
    property kor_kau : WideString read Fkor_kau write Fkor_kau;
    property summa : TXSDecimal read Fsumma write Fsumma; 
    property primechan : WideString read Fprimechan write Fprimechan;
    property  doc_id : Integer read Fdoc_id write Fdoc_id; 
    property  id : Integer read Fid write Fid; 
    property  task_id : Integer read Ftask_id write Ftask_id; 
    property task_owner : WideString read Ftask_owner write Ftask_owner;
    property  oper_id : Integer read Foper_id write Foper_id; 
    property dt_vvod : TXSDate read Fdt_vvod write Fdt_vvod;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;
}

  FKProvObjectFilter = class(FKProvObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  FKProvObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fuser_name : WideString;
    Fday_prov : Integer; 
    Fdt_prov : TXSDate;	
    Fbal_ceh : WideString;
    Fbal_sch : WideString;
    Fbal_sub_sch : WideString;
    Fbal_kau : WideString;
    Fkor_ceh : WideString;
    Fkor_sch : WideString;
    Fkor_sub_sch : WideString;
    Fkor_kau : WideString;
    Fsumma : TXSDecimal;
    Fprimechan : WideString;
    Fdoc_id : Integer; 
    Fid : Integer; 
    Ftask_id : Integer; 
    Ftask_owner : WideString;
    Foper_id : Integer; 
    Fdt_vvod : TXSDate;	
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property user_name : WideString read Fuser_name write Fuser_name;
    property  day_prov : Integer read Fday_prov write Fday_prov; 
    property dt_prov : TXSDate read Fdt_prov write Fdt_prov;
    property bal_ceh : WideString read Fbal_ceh write Fbal_ceh;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property bal_sub_sch : WideString read Fbal_sub_sch write Fbal_sub_sch;
    property bal_kau : WideString read Fbal_kau write Fbal_kau;
    property kor_ceh : WideString read Fkor_ceh write Fkor_ceh;
    property kor_sch : WideString read Fkor_sch write Fkor_sch;
    property kor_sub_sch : WideString read Fkor_sub_sch write Fkor_sub_sch;
    property kor_kau : WideString read Fkor_kau write Fkor_kau;
    property summa : TXSDecimal read Fsumma write Fsumma; 
    property primechan : WideString read Fprimechan write Fprimechan;
    property  doc_id : Integer read Fdoc_id write Fdoc_id; 
    property  id : Integer read Fid write Fid; 
    property  task_id : Integer read Ftask_id write Ftask_id; 
    property task_owner : WideString read Ftask_owner write Ftask_owner;
    property  oper_id : Integer read Foper_id write Foper_id; 
    property dt_vvod : TXSDate read Fdt_vvod write Fdt_vvod;

  end;

  ArrayOfFKProvObjectShort = array of FKProvObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FKProvObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFKProvObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFKProvObjectShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  FKProvErrorDetailed = class(TRemotable)
  private
    Fprov_id: Integer;
    Ferr_mes: WideString;
  public
    destructor Destroy; override;
  published
    property prov_id: Integer read Fprov_id write Fprov_id;
    property err_mes: WideString read Ferr_mes write Ferr_mes;
  end;

  ArrayOfFKProvErrorDetailed = array of FKProvErrorDetailed;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FKProvErrorDetailedShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFKProvErrorDetailed;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFKProvErrorDetailed read Flist write Flist;
  end;

  FKBadProv = class(FKProvObject)
  private
    FdetailedList: FKProvErrorDetailedShortList;
  public
    destructor Destroy; override;
  published
    property detailedList: FKProvErrorDetailedShortList read FdetailedList write FdetailedList;
  end;

  ArrayOfFKBadProv = array of FKBadProv;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FKBadProvShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFKBadProv;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFKBadProv read Flist write Flist;
  end;

  FKProvResult = class(TRemotable)
  private
    FpartId: Integer;
    FbadProvList: FKBadProvShortList;
  public
    destructor Destroy; override;
  published
    property partId: Integer read FpartId write FpartId;
    property badProvList: FKBadProvShortList read FbadProvList write FbadProvList;
  end;  

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FKProvObjectController/message/
  // soapAction: http://ksoe.org/FKProvObjectController/action/FKProvObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FKProvObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FKProvObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FKProvObjectControllerSoapPort = interface(IInvokable)
  ['{40ec40ec-40ec-40ec-40ec-40ec40ec40ec}']
    function  add(const aFKProvObject: FKProvObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFKProvObject: FKProvObject); stdcall;
    function  getObject(const anObjectCode: Integer): FKProvObject; stdcall;
    function  getList: FKProvObjectShortList; stdcall;
    function  getFilteredList(const aFKProvObjectFilter: FKProvObjectFilter): FKProvObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FKProvObjectShortList; stdcall;
    function  getScrollableFilteredList(const aFKProvObjectFilter: FKProvObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): FKProvObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FKProvObjectShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aFKProvObjectFilter: FKProvObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function getProvListFromFin(partId: Integer): FKProvObjectShortList; stdcall;
    procedure deleteProv(partId: Integer); stdcall;
  end;


implementation

  destructor FKProvObject.Destroy;
  begin
    if Assigned(Fdt_prov) then
      dt_prov.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fdt_vvod) then
      dt_vvod.Free;
    inherited Destroy;
  end;

{  
  destructor FKProvObjectFilter.Destroy;
  begin
    if Assigned(Fdt_prov) then
      dt_prov.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fdt_vvod) then
      dt_vvod.Free;
    inherited Destroy;
  end; 
}

  destructor FKProvObjectFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor FKProvObjectShort.Destroy;
  begin
    if Assigned(Fdt_prov) then
      dt_prov.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fdt_vvod) then
      dt_vvod.Free;
    inherited Destroy;
  end; 
  
  destructor FKProvObjectShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

{ FKProvErrorDetailed }

destructor FKProvErrorDetailed.Destroy;
begin
  inherited Destroy;
end;

{ FKProvErrorDetailedShortList }

destructor FKProvErrorDetailedShortList.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Flist)-1 do
   if Assigned(Flist[I]) then
     Flist[I].Free;
  SetLength(Flist, 0);
  inherited Destroy;
end;

{ FKBadProv }

destructor FKBadProv.Destroy;
begin
  if Assigned(FdetailedList) then
    FdetailedList.Free;
  inherited Destroy;
end;

{ FKBadProvShortList }

destructor FKBadProvShortList.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Flist)-1 do
   if Assigned(Flist[I]) then
     Flist[I].Free;
  SetLength(Flist, 0);
  inherited Destroy;
end;


{ FKProvResult }

destructor FKProvResult.Destroy;
begin
  if Assigned(FbadProvList) then
    FbadProvList.Free;
  inherited Destroy;
end;

initialization

  RemClassRegistry.RegisterXSClass(FKProvObject, 'http://ksoe.org/EnergyproControllerService/type/', 'FKProvObject');
  RemClassRegistry.RegisterXSClass(FKProvObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FKProvObjectRef');
  RemClassRegistry.RegisterXSClass(FKProvObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FKProvObjectFilter');
  RemClassRegistry.RegisterXSClass(FKProvObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FKProvObjectShort');
  RemClassRegistry.RegisterXSClass(FKProvObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FKProvObjectShortList');
  RemClassRegistry.RegisterXSClass(FKProvResult, 'http://ksoe.org/EnergyproControllerService/type/', 'FKProvResult');

  //RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFKProvObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFKProvObjectShort');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFKProvObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFKProvObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(FKProvObjectControllerSoapPort), 'http://ksoe.org/FKProvObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FKProvObjectControllerSoapPort), 'http://ksoe.org/FKProvObjectController/action/FKProvObjectController.%operationName%');


end.
