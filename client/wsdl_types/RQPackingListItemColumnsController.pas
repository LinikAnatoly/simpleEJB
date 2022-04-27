unit RQPackingListItemColumnsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPackingListItemController
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

  RQPackingListItemColumns            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListItemColumnsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListItemColumns = class(TRemotable)
  private
    Fcode : Integer;
    FnamePallet : WideString;
    FcountOnPallet : TXSDecimal;
    FcolumnNumber : Integer;
//???
    FpackingListItemRef : RQPackingListItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property namePallet : WideString read FnamePallet write FnamePallet;
    property countOnPallet : TXSDecimal read FcountOnPallet write FcountOnPallet;
    property  columnNumber : Integer read FcolumnNumber write FcolumnNumber;
    property packingListItemRef : RQPackingListItemRef read FpackingListItemRef write FpackingListItemRef;
  end;

{
  RQPackingListItemColumnsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnamePallet : WideString;
    FcountOnPallet : TXSDecimal;
    FcolumnNumber : Integer;
//???
    FpackingListItemRef : RQPackingListItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property namePallet : WideString read FnamePallet write FnamePallet;
    property countOnPallet : TXSDecimal read FcountOnPallet write FcountOnPallet;
    property  columnNumber : Integer read FcolumnNumber write FcolumnNumber;
    property packingListItemRef : RQPackingListItemRef read FpackingListItemRef write FpackingListItemRef;
  end;
}

  RQPackingListItemColumnsFilter = class(RQPackingListItemColumns)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPackingListItemColumnsShort = class(TRemotable)
  private
    Fcode : Integer;
    FnamePallet : WideString;
    FcountOnPallet : TXSDecimal;
    FpackingListItemRefCode : Integer;
    FpackingListItemRefMaterialName : WideString;
    FpackingListItemRefNn : WideString;
    FpackingListItemRefMeasurementName : WideString;
    FpackingListItemRefCountGen : TXSDecimal;
    FpackingListItemRefEstimateItemString : WideString;
    FpackingListItemRefUserGen : WideString;
    FpackingListItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property namePallet : WideString read FnamePallet write FnamePallet;
    property countOnPallet : TXSDecimal read FcountOnPallet write FcountOnPallet;

    property packingListItemRefCode : Integer read FpackingListItemRefCode write FpackingListItemRefCode;
    property packingListItemRefMaterialName : WideString read FpackingListItemRefMaterialName write FpackingListItemRefMaterialName;
    property packingListItemRefNn : WideString read FpackingListItemRefNn write FpackingListItemRefNn;
    property packingListItemRefMeasurementName : WideString read FpackingListItemRefMeasurementName write FpackingListItemRefMeasurementName;
    property packingListItemRefCountGen : TXSDecimal read FpackingListItemRefCountGen write FpackingListItemRefCountGen;
    property packingListItemRefEstimateItemString : WideString read FpackingListItemRefEstimateItemString write FpackingListItemRefEstimateItemString;
    property packingListItemRefUserGen : WideString read FpackingListItemRefUserGen write FpackingListItemRefUserGen;
    property packingListItemRefDateEdit : TXSDate read FpackingListItemRefDateEdit write FpackingListItemRefDateEdit;
  end;

  ArrayOfRQPackingListItemColumnsShort = array of RQPackingListItemColumnsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPackingListItemColumnsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPackingListItemColumnsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPackingListItemColumnsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPackingListItemColumnsController/message/
  // soapAction: http://ksoe.org/RQPackingListItemColumnsController/action/RQPackingListItemColumnsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPackingListItemColumnsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPackingListItemColumnsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPackingListItemColumnsControllerSoapPort = interface(IInvokable)
  ['{eca6eca6-eca6-eca6-eca6-eca6eca6eca6}']
    function add(const aRQPackingListItemColumns: RQPackingListItemColumns): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPackingListItemColumns: RQPackingListItemColumns); stdcall;
    function getObject(const anObjectCode: Integer): RQPackingListItemColumns; stdcall;
    function getList: RQPackingListItemColumnsShortList; stdcall;
    function getFilteredList(const aRQPackingListItemColumnsFilter: RQPackingListItemColumnsFilter): RQPackingListItemColumnsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemColumnsShortList; stdcall;
    function getScrollableFilteredList(const aRQPackingListItemColumnsFilter: RQPackingListItemColumnsFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemColumnsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemColumnsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPackingListItemColumnsFilter: RQPackingListItemColumnsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPackingListItemColumnsShort; stdcall;
  end;


implementation

  destructor RQPackingListItemColumns.Destroy;
  begin
    if Assigned(FcountOnPallet) then
      countOnPallet.Free;
    if Assigned(FpackingListItemRef) then
      packingListItemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPackingListItemColumnsFilter.Destroy;
  begin
    if Assigned(FcountOnPallet) then
      countOnPallet.Free;
    if Assigned(FpackingListItemRef) then
      packingListItemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPackingListItemColumnsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPackingListItemColumnsShort.Destroy;
  begin
    if Assigned(FcountOnPallet) then
      countOnPallet.Free;
    if Assigned(FpackingListItemRefCountGen) then
      packingListItemRefCountGen.Free;
    if Assigned(FpackingListItemRefDateEdit) then
      packingListItemRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQPackingListItemColumnsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPackingListItemColumns, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemColumns');
  RemClassRegistry.RegisterXSClass(RQPackingListItemColumnsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemColumnsRef');
  RemClassRegistry.RegisterXSClass(RQPackingListItemColumnsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemColumnsFilter');
  RemClassRegistry.RegisterXSClass(RQPackingListItemColumnsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemColumnsShort');
  RemClassRegistry.RegisterXSClass(RQPackingListItemColumnsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemColumnsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPackingListItemColumnsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPackingListItemColumnsShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPackingListItemColumnsControllerSoapPort), 'http://ksoe.org/RQPackingListItemColumnsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPackingListItemColumnsControllerSoapPort), 'http://ksoe.org/RQPackingListItemColumnsController/action/RQPackingListItemColumnsController.%operationName%');


end.
