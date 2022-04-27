unit RQPurchaseItemTender2EnContractController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENContractController
   ,RQPurchaseItemTenderController
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

  RQPurchaseItemTender2EnContract            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemTender2EnContractRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemTender2EnContract = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FcontractRef : ENContractRef;
//???
    FpurchaseItemTenderRef : RQPurchaseItemTenderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property contractRef : ENContractRef read FcontractRef write FcontractRef;
    property purchaseItemTenderRef : RQPurchaseItemTenderRef read FpurchaseItemTenderRef write FpurchaseItemTenderRef;
  end;

{
  RQPurchaseItemTender2EnContractFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FcontractRef : ENContractRef;
//???
    FpurchaseItemTenderRef : RQPurchaseItemTenderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property contractRef : ENContractRef read FcontractRef write FcontractRef;
    property purchaseItemTenderRef : RQPurchaseItemTenderRef read FpurchaseItemTenderRef write FpurchaseItemTenderRef;
  end;
}

  RQPurchaseItemTender2EnContractFilter = class(RQPurchaseItemTender2EnContract)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPurchaseItemTender2EnContractShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FcontractRefCode : Integer;
    FcontractRefContractNumber : WideString;
    FcontractRefContractDate : TXSDate;
    FcontractRefContractEndDate : TXSDate;
    FcontractRefFinDocCode : WideString;
    FcontractRefFinDocID : Integer;
    FcontractRefUserGen : WideString;
    FcontractRefDateEdit : TXSDate;
    FpurchaseItemTenderRefCode : Integer;
    FpurchaseItemTenderRefIdentid : WideString;
    FpurchaseItemTenderRefIdentid2 : WideString;
    FpurchaseItemTenderRefPurchaseName : WideString;
    FpurchaseItemTenderRefFinancingSource : WideString;
    FpurchaseItemTenderRefSumGenWithNds : TXSDecimal;
    FpurchaseItemTenderRefSumFactWithNds : TXSDecimal;
    FpurchaseItemTenderRefTentativeYearGen : Integer;
    FpurchaseItemTenderRefTentativeMonthGen : Integer;
    FpurchaseItemTenderRefCountSymbolForGroup : Integer;
    FpurchaseItemTenderRefCommentGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;

    property contractRefCode : Integer read FcontractRefCode write FcontractRefCode;
    property contractRefContractNumber : WideString read FcontractRefContractNumber write FcontractRefContractNumber;
    property contractRefContractDate : TXSDate read FcontractRefContractDate write FcontractRefContractDate;
    property contractRefContractEndDate : TXSDate read FcontractRefContractEndDate write FcontractRefContractEndDate;
    property contractRefFinDocCode : WideString read FcontractRefFinDocCode write FcontractRefFinDocCode;
    property contractRefFinDocID : Integer read FcontractRefFinDocID write FcontractRefFinDocID;
    property contractRefUserGen : WideString read FcontractRefUserGen write FcontractRefUserGen;
    property contractRefDateEdit : TXSDate read FcontractRefDateEdit write FcontractRefDateEdit;
    property purchaseItemTenderRefCode : Integer read FpurchaseItemTenderRefCode write FpurchaseItemTenderRefCode;
    property purchaseItemTenderRefIdentid : WideString read FpurchaseItemTenderRefIdentid write FpurchaseItemTenderRefIdentid;
    property purchaseItemTenderRefIdentid2 : WideString read FpurchaseItemTenderRefIdentid2 write FpurchaseItemTenderRefIdentid2;
    property purchaseItemTenderRefPurchaseName : WideString read FpurchaseItemTenderRefPurchaseName write FpurchaseItemTenderRefPurchaseName;
    property purchaseItemTenderRefFinancingSource : WideString read FpurchaseItemTenderRefFinancingSource write FpurchaseItemTenderRefFinancingSource;
    property purchaseItemTenderRefSumGenWithNds : TXSDecimal read FpurchaseItemTenderRefSumGenWithNds write FpurchaseItemTenderRefSumGenWithNds;
    property purchaseItemTenderRefSumFactWithNds : TXSDecimal read FpurchaseItemTenderRefSumFactWithNds write FpurchaseItemTenderRefSumFactWithNds;
    property purchaseItemTenderRefTentativeYearGen : Integer read FpurchaseItemTenderRefTentativeYearGen write FpurchaseItemTenderRefTentativeYearGen;
    property purchaseItemTenderRefTentativeMonthGen : Integer read FpurchaseItemTenderRefTentativeMonthGen write FpurchaseItemTenderRefTentativeMonthGen;
    property purchaseItemTenderRefCountSymbolForGroup : Integer read FpurchaseItemTenderRefCountSymbolForGroup write FpurchaseItemTenderRefCountSymbolForGroup;
    property purchaseItemTenderRefCommentGen : WideString read FpurchaseItemTenderRefCommentGen write FpurchaseItemTenderRefCommentGen;
  end;

  ArrayOfRQPurchaseItemTender2EnContractShort = array of RQPurchaseItemTender2EnContractShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPurchaseItemTender2EnContractShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItemTender2EnContractShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItemTender2EnContractShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPurchaseItemTender2EnContractController/message/
  // soapAction: http://ksoe.org/RQPurchaseItemTender2EnContractController/action/RQPurchaseItemTender2EnContractController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPurchaseItemTender2EnContractControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPurchaseItemTender2EnContractController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPurchaseItemTender2EnContractControllerSoapPort = interface(IInvokable)
  ['{1e101e10-1e10-1e10-1e10-1e101e101e10}']
    function add(const aRQPurchaseItemTender2EnContract: RQPurchaseItemTender2EnContract): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPurchaseItemTender2EnContract: RQPurchaseItemTender2EnContract); stdcall;
    function getObject(const anObjectCode: Integer): RQPurchaseItemTender2EnContract; stdcall;
    function getList: RQPurchaseItemTender2EnContractShortList; stdcall;
    function getFilteredList(const aRQPurchaseItemTender2EnContractFilter: RQPurchaseItemTender2EnContractFilter): RQPurchaseItemTender2EnContractShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTender2EnContractShortList; stdcall;
    function getScrollableFilteredList(const aRQPurchaseItemTender2EnContractFilter: RQPurchaseItemTender2EnContractFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTender2EnContractShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTender2EnContractShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPurchaseItemTender2EnContractFilter: RQPurchaseItemTender2EnContractFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPurchaseItemTender2EnContractShort; stdcall;
  end;


implementation

  destructor RQPurchaseItemTender2EnContract.Destroy;
  begin
    if Assigned(FcontractRef) then
      contractRef.Free;
    if Assigned(FpurchaseItemTenderRef) then
      purchaseItemTenderRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPurchaseItemTender2EnContractFilter.Destroy;
  begin
    if Assigned(FcontractRef) then
      contractRef.Free;
    if Assigned(FpurchaseItemTenderRef) then
      purchaseItemTenderRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPurchaseItemTender2EnContractFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPurchaseItemTender2EnContractShort.Destroy;
  begin
    if Assigned(FcontractRefContractDate) then
      contractRefContractDate.Free;
    if Assigned(FcontractRefContractEndDate) then
      contractRefContractEndDate.Free;
    if Assigned(FcontractRefDateEdit) then
      contractRefDateEdit.Free;
    if Assigned(FpurchaseItemTenderRefSumGenWithNds) then
      purchaseItemTenderRefSumGenWithNds.Free;
    if Assigned(FpurchaseItemTenderRefSumFactWithNds) then
      purchaseItemTenderRefSumFactWithNds.Free;
    inherited Destroy;
  end;

  destructor RQPurchaseItemTender2EnContractShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2EnContract, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2EnContract');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2EnContractRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2EnContractRef');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2EnContractFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2EnContractFilter');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2EnContractShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2EnContractShort');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2EnContractShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2EnContractShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItemTender2EnContractShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItemTender2EnContractShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPurchaseItemTender2EnContractControllerSoapPort), 'http://ksoe.org/RQPurchaseItemTender2EnContractController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPurchaseItemTender2EnContractControllerSoapPort), 'http://ksoe.org/RQPurchaseItemTender2EnContractController/action/RQPurchaseItemTender2EnContractController.%operationName%');


end.
