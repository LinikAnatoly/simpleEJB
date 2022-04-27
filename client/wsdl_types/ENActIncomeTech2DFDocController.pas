unit ENActIncomeTech2DFDocController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActIncomeTechConditionsController
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

  ENActIncomeTech2DFDoc            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeTech2DFDocRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeTech2DFDoc = class(TRemotable)
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
    FactIncomeRef : ENActIncomeTechConditionsRef;
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
    property actIncomeRef : ENActIncomeTechConditionsRef read FactIncomeRef write FactIncomeRef;
  end;

{
  ENActIncomeTech2DFDocFilter = class(TRemotable)
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
    FactIncomeRef : ENActIncomeTechConditionsRef;
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
    property actIncomeRef : ENActIncomeTechConditionsRef read FactIncomeRef write FactIncomeRef;
  end;
}

  ENActIncomeTech2DFDocFilter = class(ENActIncomeTech2DFDoc)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActIncomeTech2DFDocShort = class(TRemotable)
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
    FactIncomeRefCode : Integer;
    FactIncomeRefNumbergen : WideString;
    FactIncomeRefDategen : TXSDate;
    FactIncomeRefActDateStart : TXSDate;
    FactIncomeRefActDateEnd : TXSDate;
    FactIncomeRefSummaGen : TXSDecimal;
    FactIncomeRefSummaVat : TXSDecimal;
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

    property actIncomeRefCode : Integer read FactIncomeRefCode write FactIncomeRefCode;
    property actIncomeRefNumbergen : WideString read FactIncomeRefNumbergen write FactIncomeRefNumbergen;
    property actIncomeRefDategen : TXSDate read FactIncomeRefDategen write FactIncomeRefDategen;
    property actIncomeRefActDateStart : TXSDate read FactIncomeRefActDateStart write FactIncomeRefActDateStart;
    property actIncomeRefActDateEnd : TXSDate read FactIncomeRefActDateEnd write FactIncomeRefActDateEnd;
    property actIncomeRefSummaGen : TXSDecimal read FactIncomeRefSummaGen write FactIncomeRefSummaGen;
    property actIncomeRefSummaVat : TXSDecimal read FactIncomeRefSummaVat write FactIncomeRefSummaVat;
  end;

  ArrayOfENActIncomeTech2DFDocShort = array of ENActIncomeTech2DFDocShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncomeTech2DFDocShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncomeTech2DFDocShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncomeTech2DFDocShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncomeTech2DFDocController/message/
  // soapAction: http://ksoe.org/ENActIncomeTech2DFDocController/action/ENActIncomeTech2DFDocController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncomeTech2DFDocControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncomeTech2DFDocController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncomeTech2DFDocControllerSoapPort = interface(IInvokable)
  ['{DFA6C40C-2A95-4909-B11D-6F83C5D2487D}']
    function add(const aENActIncomeTech2DFDoc: ENActIncomeTech2DFDoc): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActIncomeTech2DFDoc: ENActIncomeTech2DFDoc); stdcall;
    function getObject(const anObjectCode: Integer): ENActIncomeTech2DFDoc; stdcall;
    function getList: ENActIncomeTech2DFDocShortList; stdcall;
    function getFilteredList(const aENActIncomeTech2DFDocFilter: ENActIncomeTech2DFDocFilter): ENActIncomeTech2DFDocShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeTech2DFDocShortList; stdcall;
    function getScrollableFilteredList(const aENActIncomeTech2DFDocFilter: ENActIncomeTech2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeTech2DFDocShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeTech2DFDocShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActIncomeTech2DFDocFilter: ENActIncomeTech2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActIncomeTech2DFDocShort; stdcall;
  end;


implementation

  destructor ENActIncomeTech2DFDoc.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENActIncomeTech2DFDocFilter.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENActIncomeTech2DFDocFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActIncomeTech2DFDocShort.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactIncomeRefDategen) then
      actIncomeRefDategen.Free;
    if Assigned(FactIncomeRefActDateStart) then
      actIncomeRefActDateStart.Free;
    if Assigned(FactIncomeRefActDateEnd) then
      actIncomeRefActDateEnd.Free;
    if Assigned(FactIncomeRefSummaGen) then
      actIncomeRefSummaGen.Free;
    if Assigned(FactIncomeRefSummaVat) then
      actIncomeRefSummaVat.Free;
    inherited Destroy;
  end;

  destructor ENActIncomeTech2DFDocShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncomeTech2DFDoc, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTech2DFDoc');
  RemClassRegistry.RegisterXSClass(ENActIncomeTech2DFDocRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTech2DFDocRef');
  RemClassRegistry.RegisterXSClass(ENActIncomeTech2DFDocFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTech2DFDocFilter');
  RemClassRegistry.RegisterXSClass(ENActIncomeTech2DFDocShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTech2DFDocShort');
  RemClassRegistry.RegisterXSClass(ENActIncomeTech2DFDocShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTech2DFDocShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncomeTech2DFDocShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncomeTech2DFDocShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncomeTech2DFDocControllerSoapPort), 'http://ksoe.org/ENActIncomeTech2DFDocController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncomeTech2DFDocControllerSoapPort), 'http://ksoe.org/ENActIncomeTech2DFDocController/action/ENActIncomeTech2DFDocController.%operationName%');


end.
