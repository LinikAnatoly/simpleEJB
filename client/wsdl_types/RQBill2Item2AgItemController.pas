unit RQBill2Item2AgItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQBillItem2ENEstimateItemController 
   ,AGSpecificationItemController
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

  RQBill2Item2AgItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBill2Item2AgItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBill2Item2AgItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FbillItem2EnEsItm : RQBillItem2ENEstimateItem;
//???
    FagItem : AGSpecificationItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billItem2EnEsItm : RQBillItem2ENEstimateItem read FbillItem2EnEsItm write FbillItem2EnEsItm; 
    property agItem : AGSpecificationItemRef read FagItem write FagItem;
  end;

  RQBill2Item2AgItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FbillItem2EnEsItm : RQBillItem2ENEstimateItem;
//???
    FagItem : AGSpecificationItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billItem2EnEsItm : RQBillItem2ENEstimateItem read FbillItem2EnEsItm write FbillItem2EnEsItm; 
    property agItem : AGSpecificationItemRef read FagItem write FagItem; 
  end;


  RQBill2Item2AgItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FbillItem2EnEsItmCode : Integer; 
    FbillItem2EnEsItmCountGen : TXSDecimal;
    FagItemCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 

    property billItem2EnEsItmCode : Integer read FbillItem2EnEsItmCode write FbillItem2EnEsItmCode; 
    property billItem2EnEsItmCountGen : TXSDecimal read FbillItem2EnEsItmCountGen write FbillItem2EnEsItmCountGen; 
    property agItemCode : Integer read FagItemCode write FagItemCode; //AgsSecificationItemRef read FagItemCode write FagItemCode; 
  end;

  ArrayOfRQBill2Item2AgItemShort = array of RQBill2Item2AgItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBill2Item2AgItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBill2Item2AgItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBill2Item2AgItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBill2Item2AgItemController/message/
  // soapAction: http://ksoe.org/RQBill2Item2AgItemController/action/RQBill2Item2AgItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBill2Item2AgItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBill2Item2AgItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBill2Item2AgItemControllerSoapPort = interface(IInvokable)
  ['{1ce21ce2-1ce2-1ce2-1ce2-1ce21ce21ce2}']
    function  add(const aRQBill2Item2AgItem: RQBill2Item2AgItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBill2Item2AgItem: RQBill2Item2AgItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQBill2Item2AgItem; stdcall;
    function  getList: RQBill2Item2AgItemShortList; stdcall;
    function  getFilteredList(const aRQBill2Item2AgItemFilter: RQBill2Item2AgItemFilter): RQBill2Item2AgItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBill2Item2AgItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQBill2Item2AgItemFilter: RQBill2Item2AgItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBill2Item2AgItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBill2Item2AgItemShortList; stdcall;
   function  addBillItem2ENEstimateItemList(const billItemCode : Integer; const specificationItemCode : Integer ) : Integer; stdcall;

  end; 


implementation

  destructor RQBill2Item2AgItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FbillItem2EnEsItm) then
      billItem2EnEsItm.Free;
    if Assigned(FagItem) then
      agItem.Free;
    inherited Destroy;
  end;
  
  destructor RQBill2Item2AgItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FbillItem2EnEsItm) then
      billItem2EnEsItm.Free;
    if Assigned(FagItem) then
      agItem.Free;
    inherited Destroy;
  end; 
  
  destructor RQBill2Item2AgItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FbillItem2EnEsItmCountGen) then
      billItem2EnEsItmCountGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQBill2Item2AgItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBill2Item2AgItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2Item2AgItem');
  RemClassRegistry.RegisterXSClass(RQBill2Item2AgItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2Item2AgItemRef');
  RemClassRegistry.RegisterXSClass(RQBill2Item2AgItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2Item2AgItemFilter');
  RemClassRegistry.RegisterXSClass(RQBill2Item2AgItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2Item2AgItemShort');
  RemClassRegistry.RegisterXSClass(RQBill2Item2AgItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2Item2AgItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBill2Item2AgItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBill2Item2AgItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBill2Item2AgItemControllerSoapPort), 'http://ksoe.org/RQBill2Item2AgItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBill2Item2AgItemControllerSoapPort), 'http://ksoe.org/RQBill2Item2AgItemController/action/RQBill2Item2AgItemController.%operationName%');


end.
