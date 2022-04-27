unit RQBudgetItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQBudgetController
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

  RQBudgetItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBudgetItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBudgetItem = class(TRemotable)
  private
    Fcode : Integer;
    Fddscode : WideString;
    FddscodeName : WideString;
    FsumGen : TXSDecimal;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FbufgetRef : RQBudgetRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property ddscode : WideString read Fddscode write Fddscode;
    property ddscodeName : WideString read FddscodeName write FddscodeName;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property bufgetRef : RQBudgetRef read FbufgetRef write FbufgetRef;
  end;

{
  RQBudgetItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fddscode : WideString;
    FddscodeName : WideString;
    FsumGen : TXSDecimal;
    FdateEdit : DateTime;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FbufgetRef : RQBudgetRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property ddscode : WideString read Fddscode write Fddscode;
    property ddscodeName : WideString read FddscodeName write FddscodeName;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property dateEdit : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property bufgetRef : RQBudgetRef read FbufgetRef write FbufgetRef;
  end;
}

  RQBudgetItemFilter = class(RQBudgetItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQBudgetItemShort = class(TRemotable)
  private
    Fcode : Integer;
    Fddscode : WideString;
    FddscodeName : WideString;
    FsumGen : TXSDecimal;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FbufgetRefCode : Integer;
    FbufgetRefNumberGen : WideString;
    FbufgetRefDateGen : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property ddscode : WideString read Fddscode write Fddscode;
    property ddscodeName : WideString read FddscodeName write FddscodeName;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;

    property bufgetRefCode : Integer read FbufgetRefCode write FbufgetRefCode;
    property bufgetRefNumberGen : WideString read FbufgetRefNumberGen write FbufgetRefNumberGen;
    property bufgetRefDateGen : TXSDate read FbufgetRefDateGen write FbufgetRefDateGen;
  end;

  ArrayOfRQBudgetItemShort = array of RQBudgetItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBudgetItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBudgetItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBudgetItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBudgetItemController/message/
  // soapAction: http://ksoe.org/RQBudgetItemController/action/RQBudgetItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBudgetItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBudgetItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBudgetItemControllerSoapPort = interface(IInvokable)
  ['{13A9870A-510E-4C46-818B-D3B423CCCB64}']
    function add(const aRQBudgetItem: RQBudgetItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBudgetItem: RQBudgetItem); stdcall;
    function getObject(const anObjectCode: Integer): RQBudgetItem; stdcall;
    function getList: RQBudgetItemShortList; stdcall;
    function getFilteredList(const aRQBudgetItemFilter: RQBudgetItemFilter): RQBudgetItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBudgetItemShortList; stdcall;
    function getScrollableFilteredList(const aRQBudgetItemFilter: RQBudgetItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBudgetItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBudgetItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQBudgetItemFilter: RQBudgetItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQBudgetItemShort; stdcall;
  end;


implementation

  destructor RQBudgetItem.Destroy;
  begin
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FbufgetRef) then
      bufgetRef.Free;
    inherited Destroy;
  end;

{
  destructor RQBudgetItemFilter.Destroy;
  begin
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FbufgetRef) then
      bufgetRef.Free;
    inherited Destroy;
  end;
}

  destructor RQBudgetItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQBudgetItemShort.Destroy;
  begin
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FbufgetRefDateGen) then
      bufgetRefDateGen.Free;
    inherited Destroy;
  end;

  destructor RQBudgetItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBudgetItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetItem');
  RemClassRegistry.RegisterXSClass(RQBudgetItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetItemRef');
  RemClassRegistry.RegisterXSClass(RQBudgetItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetItemFilter');
  RemClassRegistry.RegisterXSClass(RQBudgetItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetItemShort');
  RemClassRegistry.RegisterXSClass(RQBudgetItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBudgetItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBudgetItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBudgetItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBudgetItemControllerSoapPort), 'http://ksoe.org/RQBudgetItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBudgetItemControllerSoapPort), 'http://ksoe.org/RQBudgetItemController/action/RQBudgetItemController.%operationName%');


end.
