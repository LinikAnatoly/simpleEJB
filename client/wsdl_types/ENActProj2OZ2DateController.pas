unit ENActProj2OZ2DateController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActProj2OZ2Controller
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENActProj2OZ2Date            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActProj2OZ2DateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActProj2OZ2Date = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
//???
    FENActProjRef : ENActProj2OZ2Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property ENActProjRef : ENActProj2OZ2Ref read FENActProjRef write FENActProjRef;
  end;

{
  ENActProj2OZ2DateFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateGen : TXSDate;
//???
    FENActProjRef : ENActProj2OZ2Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property ENActProjRef : ENActProj2OZ2Ref read FENActProjRef write FENActProjRef;
  end;
 }

  ENActProj2OZ2DateFilter = class(ENActProj2OZ2Date)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActProj2OZ2DateShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FENActProjRefCode : Integer;
    FENActProjRefNumberGen : WideString;
    FENActProjRefDateGen : TXSDate;
    FENActProjRefSummaGen : TXSDecimal;
    FENActProjRefUserGen : WideString;
    FENActProjRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;

    property ENActProjRefCode : Integer read FENActProjRefCode write FENActProjRefCode;
    property ENActProjRefNumberGen : WideString read FENActProjRefNumberGen write FENActProjRefNumberGen;
    property ENActProjRefDateGen : TXSDate read FENActProjRefDateGen write FENActProjRefDateGen;
    property ENActProjRefSummaGen : TXSDecimal read FENActProjRefSummaGen write FENActProjRefSummaGen;
    property ENActProjRefUserGen : WideString read FENActProjRefUserGen write FENActProjRefUserGen;
    property ENActProjRefDateEdit : TXSDate read FENActProjRefDateEdit write FENActProjRefDateEdit;
  end;

  ArrayOfENActProj2OZ2DateShort = array of ENActProj2OZ2DateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActProj2OZ2DateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActProj2OZ2DateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActProj2OZ2DateShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActProj2OZ2DateController/message/
  // soapAction: http://ksoe.org/ENActProj2OZ2DateController/action/ENActProj2OZ2DateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActProj2OZ2DateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActProj2OZ2DateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActProj2OZ2DateControllerSoapPort = interface(IInvokable)
  ['{106D2F4D-67C4-42B1-8594-2D3F6E6D3EC4}']
    function add(const aENActProj2OZ2Date: ENActProj2OZ2Date): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActProj2OZ2Date: ENActProj2OZ2Date); stdcall;
    function getObject(const anObjectCode: Integer): ENActProj2OZ2Date; stdcall;
    function getList: ENActProj2OZ2DateShortList; stdcall;
    function getFilteredList(const aENActProj2OZ2DateFilter: ENActProj2OZ2DateFilter): ENActProj2OZ2DateShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActProj2OZ2DateShortList; stdcall;
    function getScrollableFilteredList(const aENActProj2OZ2DateFilter: ENActProj2OZ2DateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActProj2OZ2DateShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActProj2OZ2DateShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActProj2OZ2DateFilter: ENActProj2OZ2DateFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActProj2OZ2DateShort; stdcall;
  end;


implementation

  destructor ENActProj2OZ2Date.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FENActProjRef) then
      ENActProjRef.Free;
    inherited Destroy;
  end;

{
  destructor ENActProj2OZ2DateFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FENActProjRef) then
      ENActProjRef.Free;
    inherited Destroy;
  end;
}

  destructor ENActProj2OZ2DateFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActProj2OZ2DateShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FENActProjRefDateGen) then
      ENActProjRefDateGen.Free;
    if Assigned(FENActProjRefSummaGen) then
      ENActProjRefSummaGen.Free;
    if Assigned(FENActProjRefDateEdit) then
      ENActProjRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENActProj2OZ2DateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActProj2OZ2Date, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2Date');
  RemClassRegistry.RegisterXSClass(ENActProj2OZ2DateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2DateRef');
  RemClassRegistry.RegisterXSClass(ENActProj2OZ2DateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2DateFilter');
  RemClassRegistry.RegisterXSClass(ENActProj2OZ2DateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2DateShort');
  RemClassRegistry.RegisterXSClass(ENActProj2OZ2DateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActProj2OZ2DateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActProj2OZ2DateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActProj2OZ2DateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActProj2OZ2DateControllerSoapPort), 'http://ksoe.org/ENActProj2OZ2DateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActProj2OZ2DateControllerSoapPort), 'http://ksoe.org/ENActProj2OZ2DateController/action/ENActProj2OZ2DateController.%operationName%');


end.
