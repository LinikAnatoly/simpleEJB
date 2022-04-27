unit ENNormVolumeAVZItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
   ,ENNormativeVolumeAVZController
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

  ENNormVolumeAVZItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENNormVolumeAVZItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENNormVolumeAVZItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountRequired : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FnormativeVolumeRef : ENNormativeVolumeAVZRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countRequired : TXSDecimal read FcountRequired write FcountRequired;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property normativeVolumeRef : ENNormativeVolumeAVZRef read FnormativeVolumeRef write FnormativeVolumeRef;
  end;

{
  ENNormVolumeAVZItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountRequired : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FnormativeVolumeRef : ENNormativeVolumeAVZRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countRequired : TXSDecimal read FcountRequired write FcountRequired;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property normativeVolumeRef : ENNormativeVolumeAVZRef read FnormativeVolumeRef write FnormativeVolumeRef;
  end;
}

  ENNormVolumeAVZItemFilter = class(ENNormVolumeAVZItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENNormVolumeAVZItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountRequired : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FnormativeVolumeRefCode : Integer;
    FnormativeVolumeRefUserGen : WideString;
    FnormativeVolumeRefDateEdit : TXSDateTime;
    FmeasurementCode : Integer;
    FmeasurementName : WideString;
    FnomenclaturNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countRequired : TXSDecimal read FcountRequired write FcountRequired;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property normativeVolumeRefCode : Integer read FnormativeVolumeRefCode write FnormativeVolumeRefCode;
    property normativeVolumeRefUserGen : WideString read FnormativeVolumeRefUserGen write FnormativeVolumeRefUserGen;
    property normativeVolumeRefDateEdit : TXSDateTime read FnormativeVolumeRefDateEdit write FnormativeVolumeRefDateEdit;
    property measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property nomenclaturNumber : WideString read FnomenclaturNumber write FnomenclaturNumber;
  end;

  ArrayOfENNormVolumeAVZItemShort = array of ENNormVolumeAVZItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENNormVolumeAVZItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENNormVolumeAVZItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENNormVolumeAVZItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENNormVolumeAVZItemController/message/
  // soapAction: http://ksoe.org/ENNormVolumeAVZItemController/action/ENNormVolumeAVZItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENNormVolumeAVZItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENNormVolumeAVZItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENNormVolumeAVZItemControllerSoapPort = interface(IInvokable)
  ['{E914F21E-7B62-41F7-9A07-9ADB74C6203F}']
    function add(const aENNormVolumeAVZItem: ENNormVolumeAVZItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENNormVolumeAVZItem: ENNormVolumeAVZItem); stdcall;
    function getObject(const anObjectCode: Integer): ENNormVolumeAVZItem; stdcall;
    function getList: ENNormVolumeAVZItemShortList; stdcall;
    function getFilteredList(const aENNormVolumeAVZItemFilter: ENNormVolumeAVZItemFilter): ENNormVolumeAVZItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENNormVolumeAVZItemShortList; stdcall;
    function getScrollableFilteredList(const aENNormVolumeAVZItemFilter: ENNormVolumeAVZItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENNormVolumeAVZItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENNormVolumeAVZItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENNormVolumeAVZItemFilter: ENNormVolumeAVZItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENNormVolumeAVZItemShort; stdcall;
  end;


implementation

  destructor ENNormVolumeAVZItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountRequired) then
      countRequired.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FnormativeVolumeRef) then
      normativeVolumeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENNormVolumeAVZItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountRequired) then
      countRequired.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FnormativeVolumeRef) then
      normativeVolumeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENNormVolumeAVZItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENNormVolumeAVZItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountRequired) then
      countRequired.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FnormativeVolumeRefDateEdit) then
      normativeVolumeRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENNormVolumeAVZItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENNormVolumeAVZItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormVolumeAVZItem');
  RemClassRegistry.RegisterXSClass(ENNormVolumeAVZItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormVolumeAVZItemRef');
  RemClassRegistry.RegisterXSClass(ENNormVolumeAVZItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormVolumeAVZItemFilter');
  RemClassRegistry.RegisterXSClass(ENNormVolumeAVZItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormVolumeAVZItemShort');
  RemClassRegistry.RegisterXSClass(ENNormVolumeAVZItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormVolumeAVZItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENNormVolumeAVZItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENNormVolumeAVZItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENNormVolumeAVZItemControllerSoapPort), 'http://ksoe.org/ENNormVolumeAVZItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENNormVolumeAVZItemControllerSoapPort), 'http://ksoe.org/ENNormVolumeAVZItemController/action/ENNormVolumeAVZItemController.%operationName%');


end.
