unit ENSubst150VRUZRUController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,ENSubstation150Controller
   ,ENSubst150VRUZRUTypeController
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

  ENSubst150VRUZRU            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150VRUZRURef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150VRUZRU = class(TRemotable)
  private
    Fcode : Integer;
    FnameDisp : WideString;
    Fname : WideString;
    FinstallDate : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FsubstationRef : ENSubstation150Ref;
//???
    FtypeRef : ENSubst150VRUZRUTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property nameDisp : WideString read FnameDisp write FnameDisp;
    property name : WideString read Fname write Fname;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
    property typeRef : ENSubst150VRUZRUTypeRef read FtypeRef write FtypeRef;
  end;

{
  ENSubst150VRUZRUFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnameDisp : WideString;
    Fname : WideString;
    FinstallDate : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FsubstationRef : ENSubstation150Ref;
//???
    FtypeRef : ENSubst150VRUZRUTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property nameDisp : WideString read FnameDisp write FnameDisp;
    property name : WideString read Fname write Fname;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
    property typeRef : ENSubst150VRUZRUTypeRef read FtypeRef write FtypeRef;
  end;
}

  ENSubst150VRUZRUFilter = class(ENSubst150VRUZRU)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150VRUZRUShort = class(TRemotable)
  private
    Fcode : Integer;
    FnameDisp : WideString;
    Fname : WideString;
    FinstallDate : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FelementCode : Integer;
    FsubstationRefCode : Integer;
    FsubstationRefName : WideString;
    FsubstationRefProjectPower : TXSDecimal;
    FsubstationRefOperativeService : WideString;
    FsubstationRefRepairService : WideString;
    FsubstationRefBuhName : WideString;
    FsubstationRefInvNumber : WideString;
    FsubstationRefSizCode : Integer;
    FsubstationRefMolCode : WideString;
    FsubstationRefMolName : WideString;
    FsubstationRefCoeffCategory : TXSDecimal;
    FtypeRefCode : Integer;
    FtypeRefNameDisp : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property nameDisp : WideString read FnameDisp write FnameDisp;
    property name : WideString read Fname write Fname;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;

    property elementCode : Integer read FelementCode write FelementCode;
    property substationRefCode : Integer read FsubstationRefCode write FsubstationRefCode;
    property substationRefName : WideString read FsubstationRefName write FsubstationRefName;
    property substationRefProjectPower : TXSDecimal read FsubstationRefProjectPower write FsubstationRefProjectPower;
    property substationRefOperativeService : WideString read FsubstationRefOperativeService write FsubstationRefOperativeService;
    property substationRefRepairService : WideString read FsubstationRefRepairService write FsubstationRefRepairService;
    property substationRefBuhName : WideString read FsubstationRefBuhName write FsubstationRefBuhName;
    property substationRefInvNumber : WideString read FsubstationRefInvNumber write FsubstationRefInvNumber;
    property substationRefSizCode : Integer read FsubstationRefSizCode write FsubstationRefSizCode;
    property substationRefMolCode : WideString read FsubstationRefMolCode write FsubstationRefMolCode;
    property substationRefMolName : WideString read FsubstationRefMolName write FsubstationRefMolName;
    property substationRefCoeffCategory : TXSDecimal read FsubstationRefCoeffCategory write FsubstationRefCoeffCategory;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefNameDisp : WideString read FtypeRefNameDisp write FtypeRefNameDisp;
  end;

  ArrayOfENSubst150VRUZRUShort = array of ENSubst150VRUZRUShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150VRUZRUShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150VRUZRUShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150VRUZRUShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150VRUZRUController/message/
  // soapAction: http://ksoe.org/ENSubst150VRUZRUController/action/ENSubst150VRUZRUController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150VRUZRUControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150VRUZRUController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150VRUZRUControllerSoapPort = interface(IInvokable)
  ['{90726F34-B56B-46CC-AC50-C5334A43CCF3}']
    function add(const aENSubst150VRUZRU: ENSubst150VRUZRU): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150VRUZRU: ENSubst150VRUZRU); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150VRUZRU; stdcall;
    function getList: ENSubst150VRUZRUShortList; stdcall;
    function getFilteredList(const aENSubst150VRUZRUFilter: ENSubst150VRUZRUFilter): ENSubst150VRUZRUShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150VRUZRUShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150VRUZRUFilter: ENSubst150VRUZRUFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150VRUZRUShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150VRUZRUShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150VRUZRUFilter: ENSubst150VRUZRUFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150VRUZRUShort; stdcall;
  end;


implementation

  destructor ENSubst150VRUZRU.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSubst150VRUZRUFilter.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSubst150VRUZRUFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150VRUZRUShort.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FsubstationRefProjectPower) then
      substationRefProjectPower.Free;
    if Assigned(FsubstationRefCoeffCategory) then
      substationRefCoeffCategory.Free;
    inherited Destroy;
  end;

  destructor ENSubst150VRUZRUShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRU, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRU');
  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRURef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRURef');
  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRUFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRUFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRUShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRUShort');
  RemClassRegistry.RegisterXSClass(ENSubst150VRUZRUShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150VRUZRUShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150VRUZRUShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150VRUZRUShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150VRUZRUControllerSoapPort), 'http://ksoe.org/ENSubst150VRUZRUController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150VRUZRUControllerSoapPort), 'http://ksoe.org/ENSubst150VRUZRUController/action/ENSubst150VRUZRUController.%operationName%');


end.
