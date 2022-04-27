unit ENFuelInventarizationController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENFuelInventarizationStatusController
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

  ENFuelInventarization            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInventarizationRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInventarization = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDateTime;
    FmolCode : WideString;
    FmolName : WideString;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FstatusRef : ENFuelInventarizationStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENFuelInventarizationStatusRef read FstatusRef write FstatusRef;
  end;

{
  ENFuelInventarizationFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : DateTime;
    FmolCode : WideString;
    FmolName : WideString;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FstatusRef : ENFuelInventarizationStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : DateTime;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENFuelInventarizationStatusRef read FstatusRef write FstatusRef;
  end;
}

  ENFuelInventarizationFilter = class(ENFuelInventarization)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelInventarizationShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDateTime;
    FmolCode : WideString;
    FmolName : WideString;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
  end;

  ArrayOfENFuelInventarizationShort = array of ENFuelInventarizationShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelInventarizationShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelInventarizationShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelInventarizationShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelInventarizationController/message/
  // soapAction: http://ksoe.org/ENFuelInventarizationController/action/ENFuelInventarizationController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelInventarizationControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelInventarizationController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelInventarizationControllerSoapPort = interface(IInvokable)
 ['{56C3281F-BAEB-4466-BBB5-42780592ED7C}']
    function add(const aENFuelInventarization: ENFuelInventarization): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelInventarization: ENFuelInventarization); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelInventarization; stdcall;
    function getList: ENFuelInventarizationShortList; stdcall;
    function getFilteredList(const aENFuelInventarizationFilter: ENFuelInventarizationFilter): ENFuelInventarizationShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationShortList; stdcall;
    function getScrollableFilteredList(const aENFuelInventarizationFilter: ENFuelInventarizationFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelInventarizationFilter: ENFuelInventarizationFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelInventarizationShort; stdcall;
    procedure generateInventarizationItems(const aENFuelInventarization: ENFuelInventarization); stdcall;
    procedure removeInventarizationItems(const anObjectCode : Integer); stdcall;
    procedure reserveItems(const anObjectCode : Integer); stdcall;
    procedure removeReserveItems(const anObjectCode : Integer); stdcall;
    procedure closeInventarization(const anObjectCode : Integer); stdcall;
    procedure cancelCloseInventarization(const anObjectCode : Integer); stdcall;

  end;


implementation

  destructor ENFuelInventarization.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelInventarizationFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelInventarizationFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelInventarizationShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENFuelInventarizationShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelInventarization, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarization');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationRef');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationFilter');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationShort');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelInventarizationShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelInventarizationShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelInventarizationControllerSoapPort), 'http://ksoe.org/ENFuelInventarizationController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelInventarizationControllerSoapPort), 'http://ksoe.org/ENFuelInventarizationController/action/ENFuelInventarizationController.%operationName%');


end.
