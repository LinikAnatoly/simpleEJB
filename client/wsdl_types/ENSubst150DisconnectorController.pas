unit ENSubst150DisconnectorController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,TKMaterialsController
   ,ENHighVoltHardwareTypeController
   ,ENSubst150CellController
   ,ENSubst150VRUZRUController
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

  ENSubst150Disconnector            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150DisconnectorRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150Disconnector = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcurrentNominal : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FtypeRef : ENHighVoltHardwareTypeRef;
//???
    FcellRef : ENSubst150CellRef;
//???
    Fsubst150VruZruRef : ENSubst150VRUZRURef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property currentNominal : TXSDecimal read FcurrentNominal write FcurrentNominal;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property cellRef : ENSubst150CellRef read FcellRef write FcellRef;
    property subst150VruZruRef : ENSubst150VRUZRURef read Fsubst150VruZruRef write Fsubst150VruZruRef;
  end;

{
  ENSubst150DisconnectorFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcurrentNominal : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FtypeRef : ENHighVoltHardwareTypeRef;
//???
    FcellRef : ENSubst150CellRef;
//???
    Fsubst150VruZruRef : ENSubst150VRUZRURef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property currentNominal : TXSDecimal read FcurrentNominal write FcurrentNominal;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property cellRef : ENSubst150CellRef read FcellRef write FcellRef;
    property subst150VruZruRef : ENSubst150VRUZRURef read Fsubst150VruZruRef write Fsubst150VruZruRef;
  end;
}

  ENSubst150DisconnectorFilter = class(ENSubst150Disconnector)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150DisconnectorShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcurrentNominal : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FelementCode : Integer;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FtypeRefIsObsolete : Integer;
    FcellRefCode : Integer;
    FcellRefName : WideString;
    FcellRefFactoryNumber : WideString;
    FcellRefCommentGen : WideString;
    FcellRefUserGen : WideString;
    Fsubst150VruZruRefCode : Integer;
    Fsubst150VruZruRefNameDisp : WideString;
    Fsubst150VruZruRefName : WideString;
    Fsubst150VruZruRefInstallDate : TXSDate;
    Fsubst150VruZruRefCommentGen : WideString;
    Fsubst150VruZruRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property currentNominal : TXSDecimal read FcurrentNominal write FcurrentNominal;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;

    property elementCode : Integer read FelementCode write FelementCode;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property typeRefIsObsolete : Integer read FtypeRefIsObsolete write FtypeRefIsObsolete;
    property cellRefCode : Integer read FcellRefCode write FcellRefCode;
    property cellRefName : WideString read FcellRefName write FcellRefName;
    property cellRefFactoryNumber : WideString read FcellRefFactoryNumber write FcellRefFactoryNumber;
    property cellRefCommentGen : WideString read FcellRefCommentGen write FcellRefCommentGen;
    property cellRefUserGen : WideString read FcellRefUserGen write FcellRefUserGen;
    property subst150VruZruRefCode : Integer read Fsubst150VruZruRefCode write Fsubst150VruZruRefCode;
    property subst150VruZruRefNameDisp : WideString read Fsubst150VruZruRefNameDisp write Fsubst150VruZruRefNameDisp;
    property subst150VruZruRefName : WideString read Fsubst150VruZruRefName write Fsubst150VruZruRefName;
    property subst150VruZruRefInstallDate : TXSDate read Fsubst150VruZruRefInstallDate write Fsubst150VruZruRefInstallDate;
    property subst150VruZruRefCommentGen : WideString read Fsubst150VruZruRefCommentGen write Fsubst150VruZruRefCommentGen;
    property subst150VruZruRefUserGen : WideString read Fsubst150VruZruRefUserGen write Fsubst150VruZruRefUserGen;
  end;

  ArrayOfENSubst150DisconnectorShort = array of ENSubst150DisconnectorShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150DisconnectorShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150DisconnectorShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150DisconnectorShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150DisconnectorController/message/
  // soapAction: http://ksoe.org/ENSubst150DisconnectorController/action/ENSubst150DisconnectorController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150DisconnectorControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150DisconnectorController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150DisconnectorControllerSoapPort = interface(IInvokable)
  ['{BF68BA78-0DB5-43F3-A063-D3C56A8CE56B}']
    function add(const aENSubst150Disconnector: ENSubst150Disconnector): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150Disconnector: ENSubst150Disconnector); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150Disconnector; stdcall;
    function getList: ENSubst150DisconnectorShortList; stdcall;
    function getFilteredList(const aENSubst150DisconnectorFilter: ENSubst150DisconnectorFilter): ENSubst150DisconnectorShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DisconnectorShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150DisconnectorFilter: ENSubst150DisconnectorFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DisconnectorShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DisconnectorShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150DisconnectorFilter: ENSubst150DisconnectorFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150DisconnectorShort; stdcall;
  end;


implementation

  destructor ENSubst150Disconnector.Destroy;
  begin
    if Assigned(FcurrentNominal) then
      currentNominal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FcellRef) then
      cellRef.Free;
    if Assigned(Fsubst150VruZruRef) then
      subst150VruZruRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSubst150DisconnectorFilter.Destroy;
  begin
    if Assigned(FcurrentNominal) then
      currentNominal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FcellRef) then
      cellRef.Free;
    if Assigned(Fsubst150VruZruRef) then
      subst150VruZruRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSubst150DisconnectorFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150DisconnectorShort.Destroy;
  begin
    if Assigned(FcurrentNominal) then
      currentNominal.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(Fsubst150VruZruRefInstallDate) then
      subst150VruZruRefInstallDate.Free;
    inherited Destroy;
  end;

  destructor ENSubst150DisconnectorShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150Disconnector, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150Disconnector');
  RemClassRegistry.RegisterXSClass(ENSubst150DisconnectorRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DisconnectorRef');
  RemClassRegistry.RegisterXSClass(ENSubst150DisconnectorFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DisconnectorFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150DisconnectorShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DisconnectorShort');
  RemClassRegistry.RegisterXSClass(ENSubst150DisconnectorShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DisconnectorShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150DisconnectorShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150DisconnectorShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150DisconnectorControllerSoapPort), 'http://ksoe.org/ENSubst150DisconnectorController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150DisconnectorControllerSoapPort), 'http://ksoe.org/ENSubst150DisconnectorController/action/ENSubst150DisconnectorController.%operationName%');


end.
