unit ENPowerReliabilityCategoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENSettleTypeController
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

  ENPowerReliabilityCategory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPowerReliabilityCategoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPowerReliabilityCategory = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fcoef : TXSDecimal;
//???
    FsettleTypeRef : ENSettleTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property coef : TXSDecimal read Fcoef write Fcoef;
    property settleTypeRef : ENSettleTypeRef read FsettleTypeRef write FsettleTypeRef;
  end;

{
  ENPowerReliabilityCategoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fcoef : TXSDecimal;
//???
    FsettleTypeRef : ENSettleTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property coef : TXSDecimal read Fcoef write Fcoef;
    property settleTypeRef : ENSettleTypeRef read FsettleTypeRef write FsettleTypeRef;
  end;
}

  ENPowerReliabilityCategoryFilter = class(ENPowerReliabilityCategory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPowerReliabilityCategoryShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fcoef : TXSDecimal;
    FsettleTypeRefCode : Integer;
    FsettleTypeRefName : WideString;
    FsettleTypeRefCoef : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property coef : TXSDecimal read Fcoef write Fcoef;

    property settleTypeRefCode : Integer read FsettleTypeRefCode write FsettleTypeRefCode;
    property settleTypeRefName : WideString read FsettleTypeRefName write FsettleTypeRefName;
    property settleTypeRefCoef : TXSDecimal read FsettleTypeRefCoef write FsettleTypeRefCoef;
  end;

  ArrayOfENPowerReliabilityCategoryShort = array of ENPowerReliabilityCategoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPowerReliabilityCategoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPowerReliabilityCategoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPowerReliabilityCategoryShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPowerReliabilityCategoryController/message/
  // soapAction: http://ksoe.org/ENPowerReliabilityCategoryController/action/ENPowerReliabilityCategoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPowerReliabilityCategoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPowerReliabilityCategoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPowerReliabilityCategoryControllerSoapPort = interface(IInvokable)
  ['{E00950FB-CD64-4171-B962-F69CCBEAFD69}']
    function add(const aENPowerReliabilityCategory: ENPowerReliabilityCategory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPowerReliabilityCategory: ENPowerReliabilityCategory); stdcall;
    function getObject(const anObjectCode: Integer): ENPowerReliabilityCategory; stdcall;
    function getList: ENPowerReliabilityCategoryShortList; stdcall;
    function getFilteredList(const aENPowerReliabilityCategoryFilter: ENPowerReliabilityCategoryFilter): ENPowerReliabilityCategoryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPowerReliabilityCategoryShortList; stdcall;
    function getScrollableFilteredList(const aENPowerReliabilityCategoryFilter: ENPowerReliabilityCategoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPowerReliabilityCategoryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPowerReliabilityCategoryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPowerReliabilityCategoryFilter: ENPowerReliabilityCategoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPowerReliabilityCategoryShort; stdcall;
  end;


implementation

  destructor ENPowerReliabilityCategory.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    if Assigned(FsettleTypeRef) then
      settleTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPowerReliabilityCategoryFilter.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    if Assigned(FsettleTypeRef) then
      settleTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPowerReliabilityCategoryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPowerReliabilityCategoryShort.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    if Assigned(FsettleTypeRefCoef) then
      settleTypeRefCoef.Free;
    inherited Destroy;
  end;

  destructor ENPowerReliabilityCategoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPowerReliabilityCategory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPowerReliabilityCategory');
  RemClassRegistry.RegisterXSClass(ENPowerReliabilityCategoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPowerReliabilityCategoryRef');
  RemClassRegistry.RegisterXSClass(ENPowerReliabilityCategoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPowerReliabilityCategoryFilter');
  RemClassRegistry.RegisterXSClass(ENPowerReliabilityCategoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPowerReliabilityCategoryShort');
  RemClassRegistry.RegisterXSClass(ENPowerReliabilityCategoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPowerReliabilityCategoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPowerReliabilityCategoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPowerReliabilityCategoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPowerReliabilityCategoryControllerSoapPort), 'http://ksoe.org/ENPowerReliabilityCategoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPowerReliabilityCategoryControllerSoapPort), 'http://ksoe.org/ENPowerReliabilityCategoryController/action/ENPowerReliabilityCategoryController.%operationName%');


end.
