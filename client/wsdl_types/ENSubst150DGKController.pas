unit ENSubst150DGKController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,TKMaterialsController
   ,ENHighVoltHardwareTypeController
   ,ENSubst150CellController
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

  ENSubst150DGK            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150DGKRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150DGK = class(TRemotable)
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
  end;

{
  ENSubst150DGKFilter = class(TRemotable)
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
  end;
}

  ENSubst150DGKFilter = class(ENSubst150DGK)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150DGKShort = class(TRemotable)
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
  end;

  ArrayOfENSubst150DGKShort = array of ENSubst150DGKShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150DGKShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150DGKShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150DGKShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150DGKController/message/
  // soapAction: http://ksoe.org/ENSubst150DGKController/action/ENSubst150DGKController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150DGKControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150DGKController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150DGKControllerSoapPort = interface(IInvokable)
  ['{AC484F7D-BEC9-4C62-B100-5E72C352D116}']
    function add(const aENSubst150DGK: ENSubst150DGK): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150DGK: ENSubst150DGK); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150DGK; stdcall;
    function getList: ENSubst150DGKShortList; stdcall;
    function getFilteredList(const aENSubst150DGKFilter: ENSubst150DGKFilter): ENSubst150DGKShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DGKShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150DGKFilter: ENSubst150DGKFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DGKShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DGKShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150DGKFilter: ENSubst150DGKFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150DGKShort; stdcall;
  end;


implementation

  destructor ENSubst150DGK.Destroy;
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
    inherited Destroy;
  end;

{
  destructor ENSubst150DGKFilter.Destroy;
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
    inherited Destroy;
  end;
}

  destructor ENSubst150DGKFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150DGKShort.Destroy;
  begin
    if Assigned(FcurrentNominal) then
      currentNominal.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    inherited Destroy;
  end;

  destructor ENSubst150DGKShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150DGK, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DGK');
  RemClassRegistry.RegisterXSClass(ENSubst150DGKRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DGKRef');
  RemClassRegistry.RegisterXSClass(ENSubst150DGKFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DGKFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150DGKShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DGKShort');
  RemClassRegistry.RegisterXSClass(ENSubst150DGKShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DGKShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150DGKShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150DGKShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150DGKControllerSoapPort), 'http://ksoe.org/ENSubst150DGKController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150DGKControllerSoapPort), 'http://ksoe.org/ENSubst150DGKController/action/ENSubst150DGKController.%operationName%');


end.
