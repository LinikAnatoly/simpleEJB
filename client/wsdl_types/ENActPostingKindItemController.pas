unit ENActPostingKindItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActPostingKindController
   ,ENActPostingTypeSumController
   ,ENActPostingFormController
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

  ENActPostingKindItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingKindItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingKindItem = class(TRemotable)
  private
    Fcode : Integer;
    FcehKt : WideString;
    FaccountKt : WideString;
    FkauKt : WideString;
    FcehDt : WideString;
    FaccountDt : WideString;
    FkauDt : WideString;
    FsummaGen : TXSDecimal;
    FplusMinus : WideString;
    Fdescription : WideString;
//???
    FENActPostingKind : ENActPostingKind;
//???
    FENActPostingTypeSum : ENActPostingTypeSum;
//???
    FENActPostingForm : ENActPostingForm;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property cehKt : WideString read FcehKt write FcehKt;
    property accountKt : WideString read FaccountKt write FaccountKt;
    property kauKt : WideString read FkauKt write FkauKt;
    property cehDt : WideString read FcehDt write FcehDt;
    property accountDt : WideString read FaccountDt write FaccountDt;
    property kauDt : WideString read FkauDt write FkauDt;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property plusMinus : WideString read FplusMinus write FplusMinus;
    property description : WideString read Fdescription write Fdescription;
    property ENActPostingKind : ENActPostingKind read FENActPostingKind write FENActPostingKind;
    property ENActPostingTypeSum : ENActPostingTypeSum read FENActPostingTypeSum write FENActPostingTypeSum;
    property ENActPostingForm : ENActPostingForm read FENActPostingForm write FENActPostingForm;
  end;

{
  ENActPostingKindItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcehKt : WideString;
    FaccountKt : WideString;
    FkauKt : WideString;
    FcehDt : WideString;
    FaccountDt : WideString;
    FkauDt : WideString;
    FsummaGen : TXSDecimal;
    FplusMinus : WideString;
    Fdescription : WideString;
//???
    FENActPostingKind : ENActPostingKind;
//???
    FENActPostingTypeSum : ENActPostingTypeSum;
//???
    FENActPostingForm : ENActPostingForm;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property cehKt : WideString read FcehKt write FcehKt;
    property accountKt : WideString read FaccountKt write FaccountKt;
    property kauKt : WideString read FkauKt write FkauKt;
    property cehDt : WideString read FcehDt write FcehDt;
    property accountDt : WideString read FaccountDt write FaccountDt;
    property kauDt : WideString read FkauDt write FkauDt;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property plusMinus : WideString read FplusMinus write FplusMinus;
    property description : WideString read Fdescription write Fdescription;
    property ENActPostingKind : ENActPostingKind read FENActPostingKind write FENActPostingKind;
    property ENActPostingTypeSum : ENActPostingTypeSum read FENActPostingTypeSum write FENActPostingTypeSum;
    property ENActPostingForm : ENActPostingForm read FENActPostingForm write FENActPostingForm;
  end;
}

  ENActPostingKindItemFilter = class(ENActPostingKindItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActPostingKindItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcehKt : WideString;
    FaccountKt : WideString;
    FkauKt : WideString;
    FcehDt : WideString;
    FaccountDt : WideString;
    FkauDt : WideString;
    FsummaGen : TXSDecimal;
    FplusMinus : WideString;
    Fdescription : WideString;
    FENActPostingKindCode : Integer;
    FENActPostingKindNumberGen : WideString;
    FENActPostingKindName : WideString;
    FENActPostingKindDateTemplate : TXSDateTime;
    FENActPostingKindAccount_expense : WideString;
    FENActPostingKindKau_expense : WideString;
    FENActPostingKindAccount_closing : WideString;
    FENActPostingKindKau_closing : WideString;
    FENActPostingKindTypeOperMatetialsAct : WideString;
    FENActPostingKindTypeOperMatetialsOrder : WideString;
    FENActPostingKindTypeOperCountersAct : WideString;
    FENActPostingTypeSumCode : Integer;
    FENActPostingTypeSumName : WideString;
    FENActPostingFormCode : Integer;
    FENActPostingFormName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property cehKt : WideString read FcehKt write FcehKt;
    property accountKt : WideString read FaccountKt write FaccountKt;
    property kauKt : WideString read FkauKt write FkauKt;
    property cehDt : WideString read FcehDt write FcehDt;
    property accountDt : WideString read FaccountDt write FaccountDt;
    property kauDt : WideString read FkauDt write FkauDt;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property plusMinus : WideString read FplusMinus write FplusMinus;
    property description : WideString read Fdescription write Fdescription;

    property ENActPostingKindCode : Integer read FENActPostingKindCode write FENActPostingKindCode;
    property ENActPostingKindNumberGen : WideString read FENActPostingKindNumberGen write FENActPostingKindNumberGen;
    property ENActPostingKindName : WideString read FENActPostingKindName write FENActPostingKindName;
    property ENActPostingKindDateTemplate : TXSDateTime read FENActPostingKindDateTemplate write FENActPostingKindDateTemplate;
    property ENActPostingKindAccount_expense : WideString read FENActPostingKindAccount_expense write FENActPostingKindAccount_expense;
    property ENActPostingKindKau_expense : WideString read FENActPostingKindKau_expense write FENActPostingKindKau_expense;
    property ENActPostingKindAccount_closing : WideString read FENActPostingKindAccount_closing write FENActPostingKindAccount_closing;
    property ENActPostingKindKau_closing : WideString read FENActPostingKindKau_closing write FENActPostingKindKau_closing;
    property ENActPostingKindTypeOperMatetialsAct : WideString read FENActPostingKindTypeOperMatetialsAct write FENActPostingKindTypeOperMatetialsAct;
    property ENActPostingKindTypeOperMatetialsOrder : WideString read FENActPostingKindTypeOperMatetialsOrder write FENActPostingKindTypeOperMatetialsOrder;
    property ENActPostingKindTypeOperCountersAct : WideString read FENActPostingKindTypeOperCountersAct write FENActPostingKindTypeOperCountersAct;
    property ENActPostingTypeSumCode : Integer read FENActPostingTypeSumCode write FENActPostingTypeSumCode;
    property ENActPostingTypeSumName : WideString read FENActPostingTypeSumName write FENActPostingTypeSumName;
    property ENActPostingFormCode : Integer read FENActPostingFormCode write FENActPostingFormCode;
    property ENActPostingFormName : WideString read FENActPostingFormName write FENActPostingFormName;
  end;

  ArrayOfENActPostingKindItemShort = array of ENActPostingKindItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActPostingKindItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActPostingKindItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActPostingKindItemShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActPostingKindItemController/message/
  // soapAction: http://ksoe.org/ENActPostingKindItemController/action/ENActPostingKindItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActPostingKindItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActPostingKindItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActPostingKindItemControllerSoapPort = interface(IInvokable)
  ['{2FDB102A-CAD9-4D4F-80D7-C22886226BAD}']
    function add(const aENActPostingKindItem: ENActPostingKindItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActPostingKindItem: ENActPostingKindItem); stdcall;
    function getObject(const anObjectCode: Integer): ENActPostingKindItem; stdcall;
    function getList: ENActPostingKindItemShortList; stdcall;
    function getFilteredList(const aENActPostingKindItemFilter: ENActPostingKindItemFilter): ENActPostingKindItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActPostingKindItemShortList; stdcall;
    function getScrollableFilteredList(const aENActPostingKindItemFilter: ENActPostingKindItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingKindItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingKindItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActPostingKindItemFilter: ENActPostingKindItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActPostingKindItemShort; stdcall;
  end;


implementation

  destructor ENActPostingKindItem.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FENActPostingKind) then
      ENActPostingKind.Free;
    if Assigned(FENActPostingTypeSum) then
      ENActPostingTypeSum.Free;
    if Assigned(FENActPostingForm) then
      ENActPostingForm.Free;
    inherited Destroy;
  end;

{
  destructor ENActPostingKindItemFilter.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FENActPostingKind) then
      ENActPostingKind.Free;
    if Assigned(FENActPostingTypeSum) then
      ENActPostingTypeSum.Free;
    if Assigned(FENActPostingForm) then
      ENActPostingForm.Free;
    inherited Destroy;
  end;
}

  destructor ENActPostingKindItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActPostingKindItemShort.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FENActPostingKindDateTemplate) then
      ENActPostingKindDateTemplate.Free;
    inherited Destroy;
  end;

  destructor ENActPostingKindItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActPostingKindItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindItem');
  RemClassRegistry.RegisterXSClass(ENActPostingKindItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindItemRef');
  RemClassRegistry.RegisterXSClass(ENActPostingKindItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindItemFilter');
  RemClassRegistry.RegisterXSClass(ENActPostingKindItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindItemShort');
  RemClassRegistry.RegisterXSClass(ENActPostingKindItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActPostingKindItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActPostingKindItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActPostingKindItemControllerSoapPort), 'http://ksoe.org/ENActPostingKindItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActPostingKindItemControllerSoapPort), 'http://ksoe.org/ENActPostingKindItemController/action/ENActPostingKindItemController.%operationName%');


end.
