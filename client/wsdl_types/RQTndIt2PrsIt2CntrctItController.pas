unit RQTndIt2PrsIt2CntrctItController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPurchaseItemTender2RQPurchaseItemController
   ,ENContractItemController
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

  RQTndIt2PrsIt2CntrctIt            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTndIt2PrsIt2CntrctItRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTndIt2PrsIt2CntrctIt = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FuserGen : WideString;
    Fmodify_time : Int64;
    Fprice : TXSDecimal;
//???
    FtndIt2PrsItRef : RQPurchaseItemTender2RQPurchaseItemRef;
//???
    FcontractItemRef : ENContractItemRef;
    FenContractCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property tndIt2PrsItRef : RQPurchaseItemTender2RQPurchaseItemRef read FtndIt2PrsItRef write FtndIt2PrsItRef;
    property contractItemRef : ENContractItemRef read FcontractItemRef write FcontractItemRef;
    property price : TXSDecimal read Fprice write Fprice;
    property enContractCode : Integer read FenContractCode write FenContractCode;
  end;

{
  RQTndIt2PrsIt2CntrctItFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FtndIt2PrsItRef : RQPurchaseItemTender2RQPurchaseItemRef;
//???
    FcontractItemRef : ENContractItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property tndIt2PrsItRef : RQPurchaseItemTender2RQPurchaseItemRef read FtndIt2PrsItRef write FtndIt2PrsItRef;
    property contractItemRef : ENContractItemRef read FcontractItemRef write FcontractItemRef;
  end;
}

  RQTndIt2PrsIt2CntrctItFilter = class(RQTndIt2PrsIt2CntrctIt)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQTndIt2PrsIt2CntrctItShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FuserGen : WideString;
    FtndIt2PrsItRefCode : Integer;
    FtndIt2PrsItRefCountGen : TXSDecimal;
    FcontractItemRefCode : Integer;
    FcontractItemRefCountGen : TXSDecimal;
    FcontractItemRefPrice : TXSDecimal;
    FcontractItemRefCost : TXSDecimal;
    FcontractItemRefCountReal : TXSDecimal;
    FcontractItemRefUserGen : WideString;
    FcontractItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property userGen : WideString read FuserGen write FuserGen;

    property tndIt2PrsItRefCode : Integer read FtndIt2PrsItRefCode write FtndIt2PrsItRefCode;
    property tndIt2PrsItRefCountGen : TXSDecimal read FtndIt2PrsItRefCountGen write FtndIt2PrsItRefCountGen;
    property contractItemRefCode : Integer read FcontractItemRefCode write FcontractItemRefCode;
    property contractItemRefCountGen : TXSDecimal read FcontractItemRefCountGen write FcontractItemRefCountGen;
    property contractItemRefPrice : TXSDecimal read FcontractItemRefPrice write FcontractItemRefPrice;
    property contractItemRefCost : TXSDecimal read FcontractItemRefCost write FcontractItemRefCost;
    property contractItemRefCountReal : TXSDecimal read FcontractItemRefCountReal write FcontractItemRefCountReal;
    property contractItemRefUserGen : WideString read FcontractItemRefUserGen write FcontractItemRefUserGen;
    property contractItemRefDateEdit : TXSDate read FcontractItemRefDateEdit write FcontractItemRefDateEdit;
  end;

  ArrayOfRQTndIt2PrsIt2CntrctItShort = array of RQTndIt2PrsIt2CntrctItShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQTndIt2PrsIt2CntrctItShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQTndIt2PrsIt2CntrctItShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQTndIt2PrsIt2CntrctItShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQTndIt2PrsIt2CntrctItController/message/
  // soapAction: http://ksoe.org/RQTndIt2PrsIt2CntrctItController/action/RQTndIt2PrsIt2CntrctItController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQTndIt2PrsIt2CntrctItControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQTndIt2PrsIt2CntrctItController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQTndIt2PrsIt2CntrctItControllerSoapPort = interface(IInvokable)
  ['{7b0b7b0b-7b0b-7b0b-7b0b-7b0b7b0b7b0b}']
    function add(const aRQTndIt2PrsIt2CntrctIt: RQTndIt2PrsIt2CntrctIt): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQTndIt2PrsIt2CntrctIt: RQTndIt2PrsIt2CntrctIt); stdcall;
    function getObject(const anObjectCode: Integer): RQTndIt2PrsIt2CntrctIt; stdcall;
    function getList: RQTndIt2PrsIt2CntrctItShortList; stdcall;
    function getFilteredList(const aRQTndIt2PrsIt2CntrctItFilter: RQTndIt2PrsIt2CntrctItFilter): RQTndIt2PrsIt2CntrctItShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQTndIt2PrsIt2CntrctItShortList; stdcall;
    function getScrollableFilteredList(const aRQTndIt2PrsIt2CntrctItFilter: RQTndIt2PrsIt2CntrctItFilter; const aFromPosition: Integer; const aQuantity: Integer): RQTndIt2PrsIt2CntrctItShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQTndIt2PrsIt2CntrctItShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQTndIt2PrsIt2CntrctItFilter: RQTndIt2PrsIt2CntrctItFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQTndIt2PrsIt2CntrctItShort; stdcall;
  end;


implementation

  destructor RQTndIt2PrsIt2CntrctIt.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtndIt2PrsItRef) then
      tndIt2PrsItRef.Free;
    if Assigned(FcontractItemRef) then
      contractItemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQTndIt2PrsIt2CntrctItFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtndIt2PrsItRef) then
      tndIt2PrsItRef.Free;
    if Assigned(FcontractItemRef) then
      contractItemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQTndIt2PrsIt2CntrctItFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQTndIt2PrsIt2CntrctItShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtndIt2PrsItRefCountGen) then
      tndIt2PrsItRefCountGen.Free;
    if Assigned(FcontractItemRefCountGen) then
      contractItemRefCountGen.Free;
    if Assigned(FcontractItemRefPrice) then
      contractItemRefPrice.Free;
    if Assigned(FcontractItemRefCost) then
      contractItemRefCost.Free;
    if Assigned(FcontractItemRefCountReal) then
      contractItemRefCountReal.Free;
    if Assigned(FcontractItemRefDateEdit) then
      contractItemRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQTndIt2PrsIt2CntrctItShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQTndIt2PrsIt2CntrctIt, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTndIt2PrsIt2CntrctIt');
  RemClassRegistry.RegisterXSClass(RQTndIt2PrsIt2CntrctItRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTndIt2PrsIt2CntrctItRef');
  RemClassRegistry.RegisterXSClass(RQTndIt2PrsIt2CntrctItFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTndIt2PrsIt2CntrctItFilter');
  RemClassRegistry.RegisterXSClass(RQTndIt2PrsIt2CntrctItShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTndIt2PrsIt2CntrctItShort');
  RemClassRegistry.RegisterXSClass(RQTndIt2PrsIt2CntrctItShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTndIt2PrsIt2CntrctItShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQTndIt2PrsIt2CntrctItShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQTndIt2PrsIt2CntrctItShort');

  InvRegistry.RegisterInterface(TypeInfo(RQTndIt2PrsIt2CntrctItControllerSoapPort), 'http://ksoe.org/RQTndIt2PrsIt2CntrctItController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQTndIt2PrsIt2CntrctItControllerSoapPort), 'http://ksoe.org/RQTndIt2PrsIt2CntrctItController/action/RQTndIt2PrsIt2CntrctItController.%operationName%');


end.
