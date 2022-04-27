unit ENAct2DFDocController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActController
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

  ENAct2DFDoc            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2DFDocRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2DFDoc = class(TRemotable)
  private
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property actRef : ENActRef read FactRef write FactRef;
  end;

{
  ENAct2DFDocFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property actRef : ENActRef read FactRef write FactRef;
  end;
}

  ENAct2DFDocFilter = class(ENAct2DFDoc)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAct2DFDocShort = class(TRemotable)
  private
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinMolCode : WideString;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
    FactRefMolCodeObject : WideString;
    FactRefCheckedByAccountant : TXSBoolean;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property  dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property  dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinMolCode : WideString read FactRefFinMolCode write FactRefFinMolCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
    property actRefMolCodeObject : WideString read FactRefMolCodeObject write FactRefMolCodeObject;
    property actRefCheckedByAccountant : TXSBoolean read FactRefCheckedByAccountant write FactRefCheckedByAccountant;
  end;

  ArrayOfENAct2DFDocShort = array of ENAct2DFDocShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2DFDocShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2DFDocShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2DFDocShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2DFDocController/message/
  // soapAction: http://ksoe.org/ENAct2DFDocController/action/ENAct2DFDocController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2DFDocControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2DFDocController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2DFDocControllerSoapPort = interface(IInvokable)
  ['{431D8B88-7E2E-4495-A209-DF9417A6104C}']
    function add(const aENAct2DFDoc: ENAct2DFDoc): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2DFDoc: ENAct2DFDoc); stdcall;
    function getObject(const anObjectCode: Integer): ENAct2DFDoc; stdcall;
    function getList: ENAct2DFDocShortList; stdcall;
    function getFilteredList(const aENAct2DFDocFilter: ENAct2DFDocFilter): ENAct2DFDocShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2DFDocShortList; stdcall;
    function getScrollableFilteredList(const aENAct2DFDocFilter: ENAct2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2DFDocShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2DFDocShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAct2DFDocFilter: ENAct2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAct2DFDocShort; stdcall;
  end;


implementation

  destructor ENAct2DFDoc.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{
  destructor ENAct2DFDocFilter.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;
}

  destructor ENAct2DFDocFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENAct2DFDocShort.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENAct2DFDocShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2DFDoc, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDoc');
  RemClassRegistry.RegisterXSClass(ENAct2DFDocRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocRef');
  RemClassRegistry.RegisterXSClass(ENAct2DFDocFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocFilter');
  RemClassRegistry.RegisterXSClass(ENAct2DFDocShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocShort');
  RemClassRegistry.RegisterXSClass(ENAct2DFDocShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2DFDocShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2DFDocShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2DFDocControllerSoapPort), 'http://ksoe.org/ENAct2DFDocController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2DFDocControllerSoapPort), 'http://ksoe.org/ENAct2DFDocController/action/ENAct2DFDocController.%operationName%');


end.
