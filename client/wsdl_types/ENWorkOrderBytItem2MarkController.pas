unit ENWorkOrderBytItem2MarkController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENWorkOrderBytItemController
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

  ENWorkOrderBytItem2Mark            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytItem2MarkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytItem2Mark = class(TRemotable)
  private
    Fcode : Integer;
    FmarkCode : Integer;
    FmarkName : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FworkOrderBytItemRef : ENWorkOrderBytItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  markCode : Integer read FmarkCode write FmarkCode;
    property markName : WideString read FmarkName write FmarkName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property workOrderBytItemRef : ENWorkOrderBytItemRef read FworkOrderBytItemRef write FworkOrderBytItemRef;
  end;

{
  ENWorkOrderBytItem2MarkFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmarkCode : Integer;
    FmarkName : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FworkOrderBytItemRef : ENWorkOrderBytItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  markCode : Integer read FmarkCode write FmarkCode;
    property markName : WideString read FmarkName write FmarkName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property workOrderBytItemRef : ENWorkOrderBytItemRef read FworkOrderBytItemRef write FworkOrderBytItemRef;
  end;
}

  ENWorkOrderBytItem2MarkFilter = class(ENWorkOrderBytItem2Mark)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENWorkOrderBytItem2MarkShort = class(TRemotable)
  private
    Fcode : Integer;
    FmarkCode : Integer;
    FmarkName : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FworkOrderBytItemRefCode : Integer;
    FworkOrderBytItemRefContractNumberServices : WideString;
    FworkOrderBytItemRefAccountNumber : WideString;
    FworkOrderBytItemRefName : WideString;
    FworkOrderBytItemRefCustomerName : WideString;
    FworkOrderBytItemRefAddress : WideString;
    FworkOrderBytItemRefInvNumber : WideString;
    FworkOrderBytItemRefSerialNumber : WideString;
    FworkOrderBytItemRefSeal : WideString;
    FworkOrderBytItemRefPhone : WideString;
    FworkOrderBytItemRefRpCode : Integer;
    FworkOrderBytItemRefDateCounterInst : TXSDate;
    FworkOrderBytItemRefDateCounterCheck : TXSDate;
    FworkOrderBytItemRefCounterType : WideString;
    FworkOrderBytItemRefClassAccuracy : TXSDecimal;
    FworkOrderBytItemRefCheckperiod : TXSDecimal;
    FworkOrderBytItemRefRpStatusCode : Integer;
    FworkOrderBytItemRefPhasity : TXSDecimal;
    FworkOrderBytItemRefDatecheck : TXSDate;
    FworkOrderBytItemRefCheckperiod1 : TXSDecimal;
    FworkOrderBytItemRefPlacecounter : WideString;
    FworkOrderBytItemRefRpIsWorking : Integer;
    FworkOrderBytItemRefRecordPointName : WideString;
    FworkOrderBytItemRefRouteBytName : WideString;
    FworkOrderBytItemRefRouteBytNumbergen : WideString;
    FworkOrderBytItemRefCommentGen : WideString;
    FworkOrderBytItemRefDateAdd : TXSDateTime;
    FworkOrderBytItemRefDateEdit : TXSDateTime;
    FworkOrderBytItemRefUserAdd : WideString;
    FworkOrderBytItemRefUserEdit : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  markCode : Integer read FmarkCode write FmarkCode;
    property markName : WideString read FmarkName write FmarkName;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property workOrderBytItemRefCode : Integer read FworkOrderBytItemRefCode write FworkOrderBytItemRefCode;
    property workOrderBytItemRefContractNumberServices : WideString read FworkOrderBytItemRefContractNumberServices write FworkOrderBytItemRefContractNumberServices;
    property workOrderBytItemRefAccountNumber : WideString read FworkOrderBytItemRefAccountNumber write FworkOrderBytItemRefAccountNumber;
    property workOrderBytItemRefName : WideString read FworkOrderBytItemRefName write FworkOrderBytItemRefName;
    property workOrderBytItemRefCustomerName : WideString read FworkOrderBytItemRefCustomerName write FworkOrderBytItemRefCustomerName;
    property workOrderBytItemRefAddress : WideString read FworkOrderBytItemRefAddress write FworkOrderBytItemRefAddress;
    property workOrderBytItemRefInvNumber : WideString read FworkOrderBytItemRefInvNumber write FworkOrderBytItemRefInvNumber;
    property workOrderBytItemRefSerialNumber : WideString read FworkOrderBytItemRefSerialNumber write FworkOrderBytItemRefSerialNumber;
    property workOrderBytItemRefSeal : WideString read FworkOrderBytItemRefSeal write FworkOrderBytItemRefSeal;
    property workOrderBytItemRefPhone : WideString read FworkOrderBytItemRefPhone write FworkOrderBytItemRefPhone;
    property workOrderBytItemRefRpCode : Integer read FworkOrderBytItemRefRpCode write FworkOrderBytItemRefRpCode;
    property workOrderBytItemRefDateCounterInst : TXSDate read FworkOrderBytItemRefDateCounterInst write FworkOrderBytItemRefDateCounterInst;
    property workOrderBytItemRefDateCounterCheck : TXSDate read FworkOrderBytItemRefDateCounterCheck write FworkOrderBytItemRefDateCounterCheck;
    property workOrderBytItemRefCounterType : WideString read FworkOrderBytItemRefCounterType write FworkOrderBytItemRefCounterType;
    property workOrderBytItemRefClassAccuracy : TXSDecimal read FworkOrderBytItemRefClassAccuracy write FworkOrderBytItemRefClassAccuracy;
    property workOrderBytItemRefCheckperiod : TXSDecimal read FworkOrderBytItemRefCheckperiod write FworkOrderBytItemRefCheckperiod;
    property workOrderBytItemRefRpStatusCode : Integer read FworkOrderBytItemRefRpStatusCode write FworkOrderBytItemRefRpStatusCode;
    property workOrderBytItemRefPhasity : TXSDecimal read FworkOrderBytItemRefPhasity write FworkOrderBytItemRefPhasity;
    property workOrderBytItemRefDatecheck : TXSDate read FworkOrderBytItemRefDatecheck write FworkOrderBytItemRefDatecheck;
    property workOrderBytItemRefCheckperiod1 : TXSDecimal read FworkOrderBytItemRefCheckperiod1 write FworkOrderBytItemRefCheckperiod1;
    property workOrderBytItemRefPlacecounter : WideString read FworkOrderBytItemRefPlacecounter write FworkOrderBytItemRefPlacecounter;
    property workOrderBytItemRefRpIsWorking : Integer read FworkOrderBytItemRefRpIsWorking write FworkOrderBytItemRefRpIsWorking;
    property workOrderBytItemRefRecordPointName : WideString read FworkOrderBytItemRefRecordPointName write FworkOrderBytItemRefRecordPointName;
    property workOrderBytItemRefRouteBytName : WideString read FworkOrderBytItemRefRouteBytName write FworkOrderBytItemRefRouteBytName;
    property workOrderBytItemRefRouteBytNumbergen : WideString read FworkOrderBytItemRefRouteBytNumbergen write FworkOrderBytItemRefRouteBytNumbergen;
    property workOrderBytItemRefCommentGen : WideString read FworkOrderBytItemRefCommentGen write FworkOrderBytItemRefCommentGen;
    property workOrderBytItemRefDateAdd : TXSDateTime read FworkOrderBytItemRefDateAdd write FworkOrderBytItemRefDateAdd;
    property workOrderBytItemRefDateEdit : TXSDateTime read FworkOrderBytItemRefDateEdit write FworkOrderBytItemRefDateEdit;
    property workOrderBytItemRefUserAdd : WideString read FworkOrderBytItemRefUserAdd write FworkOrderBytItemRefUserAdd;
    property workOrderBytItemRefUserEdit : WideString read FworkOrderBytItemRefUserEdit write FworkOrderBytItemRefUserEdit;
  end;

  ArrayOfENWorkOrderBytItem2MarkShort = array of ENWorkOrderBytItem2MarkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfENWorkOrderBytItem2Mark = array of ENWorkOrderBytItem2Mark;

  ENWorkOrderBytItem2MarkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkOrderBytItem2MarkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkOrderBytItem2MarkShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkOrderBytItem2MarkController/message/
  // soapAction: http://ksoe.org/ENWorkOrderBytItem2MarkController/action/ENWorkOrderBytItem2MarkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkOrderBytItem2MarkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkOrderBytItem2MarkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkOrderBytItem2MarkControllerSoapPort = interface(IInvokable)
  ['{5DA978CC-EB7B-4FEF-BCC7-072A1343D6CA}']
    function add(const aENWorkOrderBytItem2Mark: ENWorkOrderBytItem2Mark): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWorkOrderBytItem2Mark: ENWorkOrderBytItem2Mark); stdcall;
    function getObject(const anObjectCode: Integer): ENWorkOrderBytItem2Mark; stdcall;
    function getList: ENWorkOrderBytItem2MarkShortList; stdcall;
    function getFilteredList(const aENWorkOrderBytItem2MarkFilter: ENWorkOrderBytItem2MarkFilter): ENWorkOrderBytItem2MarkShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItem2MarkShortList; stdcall;
    function getScrollableFilteredList(const aENWorkOrderBytItem2MarkFilter: ENWorkOrderBytItem2MarkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItem2MarkShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytItem2MarkShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWorkOrderBytItem2MarkFilter: ENWorkOrderBytItem2MarkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENWorkOrderBytItem2MarkShort; stdcall;
  end;


implementation

  destructor ENWorkOrderBytItem2Mark.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FworkOrderBytItemRef) then
      workOrderBytItemRef.Free;
    inherited Destroy;
  end;

{
  destructor ENWorkOrderBytItem2MarkFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FworkOrderBytItemRef) then
      workOrderBytItemRef.Free;
    inherited Destroy;
  end;
}

  destructor ENWorkOrderBytItem2MarkFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENWorkOrderBytItem2MarkShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FworkOrderBytItemRefDateCounterInst) then
      workOrderBytItemRefDateCounterInst.Free;
    if Assigned(FworkOrderBytItemRefDateCounterCheck) then
      workOrderBytItemRefDateCounterCheck.Free;
    if Assigned(FworkOrderBytItemRefClassAccuracy) then
      workOrderBytItemRefClassAccuracy.Free;
    if Assigned(FworkOrderBytItemRefCheckperiod) then
      workOrderBytItemRefCheckperiod.Free;
    if Assigned(FworkOrderBytItemRefPhasity) then
      workOrderBytItemRefPhasity.Free;
    if Assigned(FworkOrderBytItemRefDatecheck) then
      workOrderBytItemRefDatecheck.Free;
    if Assigned(FworkOrderBytItemRefCheckperiod1) then
      workOrderBytItemRefCheckperiod1.Free;
    if Assigned(FworkOrderBytItemRefDateAdd) then
      workOrderBytItemRefDateAdd.Free;
    if Assigned(FworkOrderBytItemRefDateEdit) then
      workOrderBytItemRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENWorkOrderBytItem2MarkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItem2Mark, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItem2Mark');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItem2MarkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItem2MarkRef');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItem2MarkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItem2MarkFilter');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItem2MarkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItem2MarkShort');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytItem2MarkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytItem2MarkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkOrderBytItem2MarkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkOrderBytItem2MarkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkOrderBytItem2MarkControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytItem2MarkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkOrderBytItem2MarkControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytItem2MarkController/action/ENWorkOrderBytItem2MarkController.%operationName%');


end.
