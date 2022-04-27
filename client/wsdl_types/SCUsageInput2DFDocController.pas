unit SCUsageInput2DFDocController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,SCUsageInputController
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

  SCUsageInput2DFDoc            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInput2DFDocRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInput2DFDoc = class(TRemotable)
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
    FscUsageInputRef : SCUsageInputRef;
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
    property scUsageInputRef : SCUsageInputRef read FscUsageInputRef write FscUsageInputRef;
  end;

{
  SCUsageInput2DFDocFilter = class(TRemotable)
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
    FscUsageInputRef : SCUsageInputRef;
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
    property scUsageInputRef : SCUsageInputRef read FscUsageInputRef write FscUsageInputRef;
  end;
}

  SCUsageInput2DFDocFilter = class(SCUsageInput2DFDoc)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCUsageInput2DFDocShort = class(TRemotable)
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
    FscUsageInputRefCode : Integer;
    FscUsageInputRefNumberDoc : WideString;
    FscUsageInputRefDateGen : TXSDate;
    FscUsageInputRefDateStart : TXSDate;
    FscUsageInputRefDateFinal : TXSDate;
    FscUsageInputRefMolCode : WideString;
    FscUsageInputRefMolName : WideString;
    FscUsageInputRefDateEdit : TXSDateTime;
    FscUsageInputRefMolCodeCounter : WideString;
    FscUsageInputRefMolNameCounter : WideString;
    FscUsageInputRefUserGen : WideString;
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

    property scUsageInputRefCode : Integer read FscUsageInputRefCode write FscUsageInputRefCode;
    property scUsageInputRefNumberDoc : WideString read FscUsageInputRefNumberDoc write FscUsageInputRefNumberDoc;
    property scUsageInputRefDateGen : TXSDate read FscUsageInputRefDateGen write FscUsageInputRefDateGen;
    property scUsageInputRefDateStart : TXSDate read FscUsageInputRefDateStart write FscUsageInputRefDateStart;
    property scUsageInputRefDateFinal : TXSDate read FscUsageInputRefDateFinal write FscUsageInputRefDateFinal;
    property scUsageInputRefMolCode : WideString read FscUsageInputRefMolCode write FscUsageInputRefMolCode;
    property scUsageInputRefMolName : WideString read FscUsageInputRefMolName write FscUsageInputRefMolName;
    property scUsageInputRefDateEdit : TXSDateTime read FscUsageInputRefDateEdit write FscUsageInputRefDateEdit;
    property scUsageInputRefMolCodeCounter : WideString read FscUsageInputRefMolCodeCounter write FscUsageInputRefMolCodeCounter;
    property scUsageInputRefMolNameCounter : WideString read FscUsageInputRefMolNameCounter write FscUsageInputRefMolNameCounter;
    property scUsageInputRefUserGen : WideString read FscUsageInputRefUserGen write FscUsageInputRefUserGen;
  end;

  ArrayOfSCUsageInput2DFDocShort = array of SCUsageInput2DFDocShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInput2DFDocShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInput2DFDocShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInput2DFDocShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInput2DFDocController/message/
  // soapAction: http://ksoe.org/SCUsageInput2DFDocController/action/SCUsageInput2DFDocController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInput2DFDocControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInput2DFDocController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInput2DFDocControllerSoapPort = interface(IInvokable)
  ['{0E00EE36-3532-417A-B662-47B3C544FA18}']
    function add(const aSCUsageInput2DFDoc: SCUsageInput2DFDoc): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCUsageInput2DFDoc: SCUsageInput2DFDoc); stdcall;
    function getObject(const anObjectCode: Integer): SCUsageInput2DFDoc; stdcall;
    function getList: SCUsageInput2DFDocShortList; stdcall;
    function getFilteredList(const aSCUsageInput2DFDocFilter: SCUsageInput2DFDocFilter): SCUsageInput2DFDocShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInput2DFDocShortList; stdcall;
    function getScrollableFilteredList(const aSCUsageInput2DFDocFilter: SCUsageInput2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInput2DFDocShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInput2DFDocShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCUsageInput2DFDocFilter: SCUsageInput2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCUsageInput2DFDocShort; stdcall;
  end;


implementation

  destructor SCUsageInput2DFDoc.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FscUsageInputRef) then
      scUsageInputRef.Free;
    inherited Destroy;
  end;

{
  destructor SCUsageInput2DFDocFilter.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FscUsageInputRef) then
      scUsageInputRef.Free;
    inherited Destroy;
  end;
}

  destructor SCUsageInput2DFDocFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor SCUsageInput2DFDocShort.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FscUsageInputRefDateGen) then
      scUsageInputRefDateGen.Free;
    if Assigned(FscUsageInputRefDateStart) then
      scUsageInputRefDateStart.Free;
    if Assigned(FscUsageInputRefDateFinal) then
      scUsageInputRefDateFinal.Free;
    if Assigned(FscUsageInputRefDateEdit) then
      scUsageInputRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor SCUsageInput2DFDocShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInput2DFDoc, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInput2DFDoc');
  RemClassRegistry.RegisterXSClass(SCUsageInput2DFDocRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInput2DFDocRef');
  RemClassRegistry.RegisterXSClass(SCUsageInput2DFDocFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInput2DFDocFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInput2DFDocShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInput2DFDocShort');
  RemClassRegistry.RegisterXSClass(SCUsageInput2DFDocShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInput2DFDocShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInput2DFDocShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInput2DFDocShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInput2DFDocControllerSoapPort), 'http://ksoe.org/SCUsageInput2DFDocController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInput2DFDocControllerSoapPort), 'http://ksoe.org/SCUsageInput2DFDocController/action/SCUsageInput2DFDocController.%operationName%');


end.
