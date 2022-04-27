unit RQPurchaseItemTenderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQSpravDKPPController
   ,ENTenderPurchaseKindController
   ,RQPlanPurchaseController
   ,RQPurchaseItemTypeController
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

  RQPurchaseItemTender            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemTenderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemTender = class(TRemotable)
  private
    Fcode : Integer;
    Fidentid : WideString;
    Fidentid2 : WideString;
    FpurchaseName : WideString;
    FfinancingSource : WideString;
    FsumGenWithNds : TXSDecimal;
    FsumFactWithNds : TXSDecimal;
    FtentativeYearGen : Integer;
    FtentativeMonthGen : Integer;
    FcountSymbolForGroup : Integer;
//???
    FspravDKPPRef : RQSpravDKPPRef;
//???
    FtenderKindRef : ENTenderPurchaseKindRef;
//???
    FpurchaseRef : RQPlanPurchaseRef;
    FpurchaseItemTypeRef : RQPurchaseItemTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property identid : WideString read Fidentid write Fidentid;
    property identid2 : WideString read Fidentid2 write Fidentid2;
    property purchaseName : WideString read FpurchaseName write FpurchaseName;
    property financingSource : WideString read FfinancingSource write FfinancingSource;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property sumFactWithNds : TXSDecimal read FsumFactWithNds write FsumFactWithNds;
    property tentativeYearGen : Integer read FtentativeYearGen write FtentativeYearGen;
    property tentativeMonthGen : Integer read FtentativeMonthGen write FtentativeMonthGen;
    property countSymbolForGroup : Integer read FcountSymbolForGroup write FcountSymbolForGroup;
    property spravDKPPRef : RQSpravDKPPRef read FspravDKPPRef write FspravDKPPRef;
    property tenderKindRef : ENTenderPurchaseKindRef read FtenderKindRef write FtenderKindRef;
    property purchaseRef : RQPlanPurchaseRef read FpurchaseRef write FpurchaseRef;
    property purchaseItemTypeRef : RQPurchaseItemTypeRef read FpurchaseItemTypeRef write FpurchaseItemTypeRef;
  end;

{
  RQPurchaseItemTenderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fidentid : WideString;
    FpurchaseName : WideString;
    FfinancingSource : WideString;
    FsumGenWithNds : TXSDecimal;
    FsumFactWithNds : TXSDecimal;
    FtentativeYearGen : Integer;
    FtentativeMonthGen : Integer;
    FcountSymbolForGroup : Integer;
//???
    FspravDKPPRef : RQSpravDKPPRef;
//???
    FtenderKindRef : ENTenderPurchaseKindRef;
//???
    FpurchaseRef : RQPlanPurchaseRef;
    FpurchaseItemTypeRef : RQPurchaseItemTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property identid : WideString read Fidentid write Fidentid;
    property purchaseName : WideString read FpurchaseName write FpurchaseName;
    property financingSource : WideString read FfinancingSource write FfinancingSource;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property sumFactWithNds : TXSDecimal read FsumFactWithNds write FsumFactWithNds;
    property  tentativeYearGen : Integer read FtentativeYearGen write FtentativeYearGen;
    property  tentativeMonthGen : Integer read FtentativeMonthGen write FtentativeMonthGen;
    property  countSymbolForGroup : Integer read FcountSymbolForGroup write FcountSymbolForGroup;
    property spravDKPPRef : RQSpravDKPPRef read FspravDKPPRef write FspravDKPPRef;
    property tenderKindRef : ENTenderPurchaseKindRef read FtenderKindRef write FtenderKindRef;
    property purchaseRef : RQPlanPurchaseRef read FpurchaseRef write FpurchaseRef;
    property purchaseItemTypeRef : RQPurchaseItemTypeRef read FpurchaseItemTypeRef write FpurchaseItemTypeRef;
  end;
}

  RQPurchaseItemTenderFilter = class(RQPurchaseItemTender)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPurchaseItemTenderShort = class(TRemotable)
  private
    Fcode : Integer;
    Fidentid : WideString;
    Fidentid2 : WideString;
    FpurchaseName : WideString;
    FfinancingSource : WideString;
    FsumGenWithNds : TXSDecimal;
    FsumFactWithNds : TXSDecimal;
    FtentativeYearGen : Integer;
    FtentativeMonthGen : Integer;
    FcountSymbolForGroup : Integer;
    FspravDKPPRefCode : Integer;
    FspravDKPPRefName : WideString;
    FtenderKindRefCode : Integer;
    FtenderKindRefName : WideString;
    FpurchaseRefCode : Integer;
    FpurchaseRefName : WideString;
    FpurchaseRefYearGen : Integer;
    FpurchaseRefVersion : Integer;
    FpurchaseRefCommentGen : WideString;
    FpurchaseRefDateAdd : TXSDateTime;
    FpurchaseRefDateEdit : TXSDateTime;
    FpurchaseRefUserAdd : WideString;
    FpurchaseRefUserEdit : WideString;
    FpurchaseItemTypeRefCode : Integer;

Ftentativemonthyear : WideString;
    FpurchaseItemTypeRefName : WideString;
Fkinditemtendername : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property identid : WideString read Fidentid write Fidentid;
    property identid2 : WideString read Fidentid2 write Fidentid2;
    property purchaseName : WideString read FpurchaseName write FpurchaseName;
    property financingSource : WideString read FfinancingSource write FfinancingSource;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property sumFactWithNds : TXSDecimal read FsumFactWithNds write FsumFactWithNds;
    property  tentativeYearGen : Integer read FtentativeYearGen write FtentativeYearGen;
    property  tentativeMonthGen : Integer read FtentativeMonthGen write FtentativeMonthGen;
    property  countSymbolForGroup : Integer read FcountSymbolForGroup write FcountSymbolForGroup;

    property spravDKPPRefCode : Integer read FspravDKPPRefCode write FspravDKPPRefCode;
    property spravDKPPRefName : WideString read FspravDKPPRefName write FspravDKPPRefName;
    property tenderKindRefCode : Integer read FtenderKindRefCode write FtenderKindRefCode; //ENTenderPurchaseKindRef read FtenderKindRefCode write FtenderKindRefCode;
    property tenderKindRefName : WideString read FtenderKindRefName write FtenderKindRefName;
    property purchaseRefCode : Integer read FpurchaseRefCode write FpurchaseRefCode;
    property purchaseRefName : WideString read FpurchaseRefName write FpurchaseRefName;
    property purchaseRefYearGen : Integer read FpurchaseRefYearGen write FpurchaseRefYearGen;
    property purchaseRefVersion : Integer read FpurchaseRefVersion write FpurchaseRefVersion;
    property purchaseRefCommentGen : WideString read FpurchaseRefCommentGen write FpurchaseRefCommentGen;
    property purchaseRefDateAdd : TXSDateTime read FpurchaseRefDateAdd write FpurchaseRefDateAdd;
    property purchaseRefDateEdit : TXSDateTime read FpurchaseRefDateEdit write FpurchaseRefDateEdit;
    property purchaseRefUserAdd : WideString read FpurchaseRefUserAdd write FpurchaseRefUserAdd;
    property purchaseRefUserEdit : WideString read FpurchaseRefUserEdit write FpurchaseRefUserEdit;
    property purchaseItemTypeRefCode : Integer read FpurchaseItemTypeRefCode write FpurchaseItemTypeRefCode;
    property purchaseItemTypeRefName : WideString read FpurchaseItemTypeRefName write FpurchaseItemTypeRefName;
    property tentativemonthyear : WideString read Ftentativemonthyear write Ftentativemonthyear;
   property kinditemtendername : WideString read Fkinditemtendername write Fkinditemtendername;
  end;

  ArrayOfRQPurchaseItemTenderShort = array of RQPurchaseItemTenderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPurchaseItemTenderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItemTenderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItemTenderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPurchaseItemTenderController/message/
  // soapAction: http://ksoe.org/RQPurchaseItemTenderController/action/RQPurchaseItemTenderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPurchaseItemTenderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPurchaseItemTenderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPurchaseItemTenderControllerSoapPort = interface(IInvokable)
  ['{FB1B1F73-BD7E-4C6C-9250-BAF59AD064E9}']
    function add(const aRQPurchaseItemTender: RQPurchaseItemTender): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPurchaseItemTender: RQPurchaseItemTender); stdcall;
    function getObject(const anObjectCode: Integer): RQPurchaseItemTender; stdcall;
    function getList: RQPurchaseItemTenderShortList; stdcall;
    function getFilteredList(const aRQPurchaseItemTenderFilter: RQPurchaseItemTenderFilter): RQPurchaseItemTenderShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTenderShortList; stdcall;
    function getScrollableFilteredList(const aRQPurchaseItemTenderFilter: RQPurchaseItemTenderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTenderShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTenderShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPurchaseItemTenderFilter: RQPurchaseItemTenderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPurchaseItemTenderShort; stdcall;

    procedure splitItemTender(const tenderItemCode: Integer; const planPurchaseItemCodes: ArrayOfInteger); stdcall;
  end;


implementation

  destructor RQPurchaseItemTender.Destroy;
  begin
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FsumFactWithNds) then
      sumFactWithNds.Free;
    if Assigned(FspravDKPPRef) then
      spravDKPPRef.Free;
    if Assigned(FtenderKindRef) then
      tenderKindRef.Free;
    if Assigned(FpurchaseRef) then
      purchaseRef.Free;
 if Assigned(FpurchaseItemTypeRef) then
      purchaseItemTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPurchaseItemTenderFilter.Destroy;
  begin
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FsumFactWithNds) then
      sumFactWithNds.Free;
    if Assigned(FspravDKPPRef) then
      spravDKPPRef.Free;
    if Assigned(FtenderKindRef) then
      tenderKindRef.Free;
    if Assigned(FpurchaseRef) then
      purchaseRef.Free;
 if Assigned(FpurchaseItemTypeRef) then
      purchaseItemTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPurchaseItemTenderFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPurchaseItemTenderShort.Destroy;
  begin
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FsumFactWithNds) then
      sumFactWithNds.Free;
    if Assigned(FpurchaseRefDateAdd) then
      purchaseRefDateAdd.Free;
    if Assigned(FpurchaseRefDateEdit) then
      purchaseRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQPurchaseItemTenderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTenderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTenderRef');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTenderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTenderFilter');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTenderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTenderShort');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTenderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTenderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItemTenderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItemTenderShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPurchaseItemTenderControllerSoapPort), 'http://ksoe.org/RQPurchaseItemTenderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPurchaseItemTenderControllerSoapPort), 'http://ksoe.org/RQPurchaseItemTenderController/action/RQPurchaseItemTenderController.%operationName%');


end.
