unit ENIPItem2ENIPItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENIPItemController
   ,ENIPItemController
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

  ENIPItem2ENIPItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPItem2ENIPItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPItem2ENIPItem = class(TRemotable)
  private
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FipItemInRef : ENIPItemRef;
//???
    FipItemOutRef : ENIPItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property ipItemInRef : ENIPItemRef read FipItemInRef write FipItemInRef;
    property ipItemOutRef : ENIPItemRef read FipItemOutRef write FipItemOutRef;
  end;

{
  ENIPItem2ENIPItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FipItemInRef : ENIPItemRef;
//???
    FipItemOutRef : ENIPItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property ipItemInRef : ENIPItemRef read FipItemInRef write FipItemInRef;
    property ipItemOutRef : ENIPItemRef read FipItemOutRef write FipItemOutRef;
  end;
}

  ENIPItem2ENIPItemFilter = class(ENIPItem2ENIPItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPItem2ENIPItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FipItemInRefCode : Integer;
    FipItemInRefName : WideString;
    FipItemInRefBuhName : WideString;
    FipItemInRefItemNumber : WideString;
    FipItemInRefInvNumber : WideString;
    FipItemInRefIsProjectDocument : Integer;
    FipItemInRefFinancing : WideString;
    FipItemInRefCommentGen : WideString;
    FipItemInRefCountGen : TXSDecimal;
    FipItemInRefPrice : TXSDecimal;
    FipItemInRefSumGen : TXSDecimal;
    FipItemInRefQuarter1count : TXSDecimal;
    FipItemInRefQuarter1sum : TXSDecimal;
    FipItemInRefQuarter2count : TXSDecimal;
    FipItemInRefQuarter2sum : TXSDecimal;
    FipItemInRefQuarter3count : TXSDecimal;
    FipItemInRefQuarter3sum : TXSDecimal;
    FipItemInRefQuarter4count : TXSDecimal;
    FipItemInRefQuarter4sum : TXSDecimal;
    FipItemInRefCountGenInside : TXSDecimal;
    FipItemInRefPriceInside : TXSDecimal;
    FipItemInRefSumGenInside : TXSDecimal;
    FipItemInRefQuarter1countInside : TXSDecimal;
    FipItemInRefQuarter1sumInside : TXSDecimal;
    FipItemInRefQuarter2countInside : TXSDecimal;
    FipItemInRefQuarter2sumInside : TXSDecimal;
    FipItemInRefQuarter3countInside : TXSDecimal;
    FipItemInRefQuarter3sumInside : TXSDecimal;
    FipItemInRefQuarter4countInside : TXSDecimal;
    FipItemInRefQuarter4sumInside : TXSDecimal;
    FipItemInRefUserAdd : WideString;
    FipItemInRefDateAdd : TXSDateTime;
    FipItemInRefUserGen : WideString;
    FipItemInRefDateEdit : TXSDateTime;
    FipItemOutRefCode : Integer;
    FipItemOutRefName : WideString;
    FipItemOutRefBuhName : WideString;
    FipItemOutRefItemNumber : WideString;
    FipItemOutRefInvNumber : WideString;
    FipItemOutRefIsProjectDocument : Integer;
    FipItemOutRefFinancing : WideString;
    FipItemOutRefCommentGen : WideString;
    FipItemOutRefCountGen : TXSDecimal;
    FipItemOutRefPrice : TXSDecimal;
    FipItemOutRefSumGen : TXSDecimal;
    FipItemOutRefQuarter1count : TXSDecimal;
    FipItemOutRefQuarter1sum : TXSDecimal;
    FipItemOutRefQuarter2count : TXSDecimal;
    FipItemOutRefQuarter2sum : TXSDecimal;
    FipItemOutRefQuarter3count : TXSDecimal;
    FipItemOutRefQuarter3sum : TXSDecimal;
    FipItemOutRefQuarter4count : TXSDecimal;
    FipItemOutRefQuarter4sum : TXSDecimal;
    FipItemOutRefCountGenInside : TXSDecimal;
    FipItemOutRefPriceInside : TXSDecimal;
    FipItemOutRefSumGenInside : TXSDecimal;
    FipItemOutRefQuarter1countInside : TXSDecimal;
    FipItemOutRefQuarter1sumInside : TXSDecimal;
    FipItemOutRefQuarter2countInside : TXSDecimal;
    FipItemOutRefQuarter2sumInside : TXSDecimal;
    FipItemOutRefQuarter3countInside : TXSDecimal;
    FipItemOutRefQuarter3sumInside : TXSDecimal;
    FipItemOutRefQuarter4countInside : TXSDecimal;
    FipItemOutRefQuarter4sumInside : TXSDecimal;
    FipItemOutRefUserAdd : WideString;
    FipItemOutRefDateAdd : TXSDateTime;
    FipItemOutRefUserGen : WideString;
    FipItemOutRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property ipItemInRefCode : Integer read FipItemInRefCode write FipItemInRefCode;
    property ipItemInRefName : WideString read FipItemInRefName write FipItemInRefName;
    property ipItemInRefBuhName : WideString read FipItemInRefBuhName write FipItemInRefBuhName;
    property ipItemInRefItemNumber : WideString read FipItemInRefItemNumber write FipItemInRefItemNumber;
    property ipItemInRefInvNumber : WideString read FipItemInRefInvNumber write FipItemInRefInvNumber;
    property ipItemInRefIsProjectDocument : Integer read FipItemInRefIsProjectDocument write FipItemInRefIsProjectDocument;
    property ipItemInRefFinancing : WideString read FipItemInRefFinancing write FipItemInRefFinancing;
    property ipItemInRefCommentGen : WideString read FipItemInRefCommentGen write FipItemInRefCommentGen;
    property ipItemInRefCountGen : TXSDecimal read FipItemInRefCountGen write FipItemInRefCountGen;
    property ipItemInRefPrice : TXSDecimal read FipItemInRefPrice write FipItemInRefPrice;
    property ipItemInRefSumGen : TXSDecimal read FipItemInRefSumGen write FipItemInRefSumGen;
    property ipItemInRefQuarter1count : TXSDecimal read FipItemInRefQuarter1count write FipItemInRefQuarter1count;
    property ipItemInRefQuarter1sum : TXSDecimal read FipItemInRefQuarter1sum write FipItemInRefQuarter1sum;
    property ipItemInRefQuarter2count : TXSDecimal read FipItemInRefQuarter2count write FipItemInRefQuarter2count;
    property ipItemInRefQuarter2sum : TXSDecimal read FipItemInRefQuarter2sum write FipItemInRefQuarter2sum;
    property ipItemInRefQuarter3count : TXSDecimal read FipItemInRefQuarter3count write FipItemInRefQuarter3count;
    property ipItemInRefQuarter3sum : TXSDecimal read FipItemInRefQuarter3sum write FipItemInRefQuarter3sum;
    property ipItemInRefQuarter4count : TXSDecimal read FipItemInRefQuarter4count write FipItemInRefQuarter4count;
    property ipItemInRefQuarter4sum : TXSDecimal read FipItemInRefQuarter4sum write FipItemInRefQuarter4sum;
    property ipItemInRefCountGenInside : TXSDecimal read FipItemInRefCountGenInside write FipItemInRefCountGenInside;
    property ipItemInRefPriceInside : TXSDecimal read FipItemInRefPriceInside write FipItemInRefPriceInside;
    property ipItemInRefSumGenInside : TXSDecimal read FipItemInRefSumGenInside write FipItemInRefSumGenInside;
    property ipItemInRefQuarter1countInside : TXSDecimal read FipItemInRefQuarter1countInside write FipItemInRefQuarter1countInside;
    property ipItemInRefQuarter1sumInside : TXSDecimal read FipItemInRefQuarter1sumInside write FipItemInRefQuarter1sumInside;
    property ipItemInRefQuarter2countInside : TXSDecimal read FipItemInRefQuarter2countInside write FipItemInRefQuarter2countInside;
    property ipItemInRefQuarter2sumInside : TXSDecimal read FipItemInRefQuarter2sumInside write FipItemInRefQuarter2sumInside;
    property ipItemInRefQuarter3countInside : TXSDecimal read FipItemInRefQuarter3countInside write FipItemInRefQuarter3countInside;
    property ipItemInRefQuarter3sumInside : TXSDecimal read FipItemInRefQuarter3sumInside write FipItemInRefQuarter3sumInside;
    property ipItemInRefQuarter4countInside : TXSDecimal read FipItemInRefQuarter4countInside write FipItemInRefQuarter4countInside;
    property ipItemInRefQuarter4sumInside : TXSDecimal read FipItemInRefQuarter4sumInside write FipItemInRefQuarter4sumInside;
    property ipItemInRefUserAdd : WideString read FipItemInRefUserAdd write FipItemInRefUserAdd;
    property ipItemInRefDateAdd : TXSDateTime read FipItemInRefDateAdd write FipItemInRefDateAdd;
    property ipItemInRefUserGen : WideString read FipItemInRefUserGen write FipItemInRefUserGen;
    property ipItemInRefDateEdit : TXSDateTime read FipItemInRefDateEdit write FipItemInRefDateEdit;
    property ipItemOutRefCode : Integer read FipItemOutRefCode write FipItemOutRefCode;
    property ipItemOutRefName : WideString read FipItemOutRefName write FipItemOutRefName;
    property ipItemOutRefBuhName : WideString read FipItemOutRefBuhName write FipItemOutRefBuhName;
    property ipItemOutRefItemNumber : WideString read FipItemOutRefItemNumber write FipItemOutRefItemNumber;
    property ipItemOutRefInvNumber : WideString read FipItemOutRefInvNumber write FipItemOutRefInvNumber;
    property ipItemOutRefIsProjectDocument : Integer read FipItemOutRefIsProjectDocument write FipItemOutRefIsProjectDocument;
    property ipItemOutRefFinancing : WideString read FipItemOutRefFinancing write FipItemOutRefFinancing;
    property ipItemOutRefCommentGen : WideString read FipItemOutRefCommentGen write FipItemOutRefCommentGen;
    property ipItemOutRefCountGen : TXSDecimal read FipItemOutRefCountGen write FipItemOutRefCountGen;
    property ipItemOutRefPrice : TXSDecimal read FipItemOutRefPrice write FipItemOutRefPrice;
    property ipItemOutRefSumGen : TXSDecimal read FipItemOutRefSumGen write FipItemOutRefSumGen;
    property ipItemOutRefQuarter1count : TXSDecimal read FipItemOutRefQuarter1count write FipItemOutRefQuarter1count;
    property ipItemOutRefQuarter1sum : TXSDecimal read FipItemOutRefQuarter1sum write FipItemOutRefQuarter1sum;
    property ipItemOutRefQuarter2count : TXSDecimal read FipItemOutRefQuarter2count write FipItemOutRefQuarter2count;
    property ipItemOutRefQuarter2sum : TXSDecimal read FipItemOutRefQuarter2sum write FipItemOutRefQuarter2sum;
    property ipItemOutRefQuarter3count : TXSDecimal read FipItemOutRefQuarter3count write FipItemOutRefQuarter3count;
    property ipItemOutRefQuarter3sum : TXSDecimal read FipItemOutRefQuarter3sum write FipItemOutRefQuarter3sum;
    property ipItemOutRefQuarter4count : TXSDecimal read FipItemOutRefQuarter4count write FipItemOutRefQuarter4count;
    property ipItemOutRefQuarter4sum : TXSDecimal read FipItemOutRefQuarter4sum write FipItemOutRefQuarter4sum;
    property ipItemOutRefCountGenInside : TXSDecimal read FipItemOutRefCountGenInside write FipItemOutRefCountGenInside;
    property ipItemOutRefPriceInside : TXSDecimal read FipItemOutRefPriceInside write FipItemOutRefPriceInside;
    property ipItemOutRefSumGenInside : TXSDecimal read FipItemOutRefSumGenInside write FipItemOutRefSumGenInside;
    property ipItemOutRefQuarter1countInside : TXSDecimal read FipItemOutRefQuarter1countInside write FipItemOutRefQuarter1countInside;
    property ipItemOutRefQuarter1sumInside : TXSDecimal read FipItemOutRefQuarter1sumInside write FipItemOutRefQuarter1sumInside;
    property ipItemOutRefQuarter2countInside : TXSDecimal read FipItemOutRefQuarter2countInside write FipItemOutRefQuarter2countInside;
    property ipItemOutRefQuarter2sumInside : TXSDecimal read FipItemOutRefQuarter2sumInside write FipItemOutRefQuarter2sumInside;
    property ipItemOutRefQuarter3countInside : TXSDecimal read FipItemOutRefQuarter3countInside write FipItemOutRefQuarter3countInside;
    property ipItemOutRefQuarter3sumInside : TXSDecimal read FipItemOutRefQuarter3sumInside write FipItemOutRefQuarter3sumInside;
    property ipItemOutRefQuarter4countInside : TXSDecimal read FipItemOutRefQuarter4countInside write FipItemOutRefQuarter4countInside;
    property ipItemOutRefQuarter4sumInside : TXSDecimal read FipItemOutRefQuarter4sumInside write FipItemOutRefQuarter4sumInside;
    property ipItemOutRefUserAdd : WideString read FipItemOutRefUserAdd write FipItemOutRefUserAdd;
    property ipItemOutRefDateAdd : TXSDateTime read FipItemOutRefDateAdd write FipItemOutRefDateAdd;
    property ipItemOutRefUserGen : WideString read FipItemOutRefUserGen write FipItemOutRefUserGen;
    property ipItemOutRefDateEdit : TXSDateTime read FipItemOutRefDateEdit write FipItemOutRefDateEdit;
  end;

  ArrayOfENIPItem2ENIPItemShort = array of ENIPItem2ENIPItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPItem2ENIPItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPItem2ENIPItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPItem2ENIPItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPItem2ENIPItemController/message/
  // soapAction: http://ksoe.org/ENIPItem2ENIPItemController/action/ENIPItem2ENIPItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPItem2ENIPItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPItem2ENIPItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPItem2ENIPItemControllerSoapPort = interface(IInvokable)
  ['{1e321e32-1e32-1e32-1e32-1e321e321e32}']
    function add(const aENIPItem2ENIPItem: ENIPItem2ENIPItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIPItem2ENIPItem: ENIPItem2ENIPItem); stdcall;
    function getObject(const anObjectCode: Integer): ENIPItem2ENIPItem; stdcall;
    function getList: ENIPItem2ENIPItemShortList; stdcall;
    function getFilteredList(const aENIPItem2ENIPItemFilter: ENIPItem2ENIPItemFilter): ENIPItem2ENIPItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPItem2ENIPItemShortList; stdcall;
    function getScrollableFilteredList(const aENIPItem2ENIPItemFilter: ENIPItem2ENIPItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPItem2ENIPItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPItem2ENIPItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPItem2ENIPItemFilter: ENIPItem2ENIPItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPItem2ENIPItemShort; stdcall;
  end;


implementation

  destructor ENIPItem2ENIPItem.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FipItemInRef) then
      ipItemInRef.Free;
    if Assigned(FipItemOutRef) then
      ipItemOutRef.Free;
    inherited Destroy;
  end;

{
  destructor ENIPItem2ENIPItemFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FipItemInRef) then
      ipItemInRef.Free;
    if Assigned(FipItemOutRef) then
      ipItemOutRef.Free;
    inherited Destroy;
  end;
}

  destructor ENIPItem2ENIPItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENIPItem2ENIPItemShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FipItemInRefCountGen) then
      ipItemInRefCountGen.Free;
    if Assigned(FipItemInRefPrice) then
      ipItemInRefPrice.Free;
    if Assigned(FipItemInRefSumGen) then
      ipItemInRefSumGen.Free;
    if Assigned(FipItemInRefQuarter1count) then
      ipItemInRefQuarter1count.Free;
    if Assigned(FipItemInRefQuarter1sum) then
      ipItemInRefQuarter1sum.Free;
    if Assigned(FipItemInRefQuarter2count) then
      ipItemInRefQuarter2count.Free;
    if Assigned(FipItemInRefQuarter2sum) then
      ipItemInRefQuarter2sum.Free;
    if Assigned(FipItemInRefQuarter3count) then
      ipItemInRefQuarter3count.Free;
    if Assigned(FipItemInRefQuarter3sum) then
      ipItemInRefQuarter3sum.Free;
    if Assigned(FipItemInRefQuarter4count) then
      ipItemInRefQuarter4count.Free;
    if Assigned(FipItemInRefQuarter4sum) then
      ipItemInRefQuarter4sum.Free;
    if Assigned(FipItemInRefCountGenInside) then
      ipItemInRefCountGenInside.Free;
    if Assigned(FipItemInRefPriceInside) then
      ipItemInRefPriceInside.Free;
    if Assigned(FipItemInRefSumGenInside) then
      ipItemInRefSumGenInside.Free;
    if Assigned(FipItemInRefQuarter1countInside) then
      ipItemInRefQuarter1countInside.Free;
    if Assigned(FipItemInRefQuarter1sumInside) then
      ipItemInRefQuarter1sumInside.Free;
    if Assigned(FipItemInRefQuarter2countInside) then
      ipItemInRefQuarter2countInside.Free;
    if Assigned(FipItemInRefQuarter2sumInside) then
      ipItemInRefQuarter2sumInside.Free;
    if Assigned(FipItemInRefQuarter3countInside) then
      ipItemInRefQuarter3countInside.Free;
    if Assigned(FipItemInRefQuarter3sumInside) then
      ipItemInRefQuarter3sumInside.Free;
    if Assigned(FipItemInRefQuarter4countInside) then
      ipItemInRefQuarter4countInside.Free;
    if Assigned(FipItemInRefQuarter4sumInside) then
      ipItemInRefQuarter4sumInside.Free;
    if Assigned(FipItemInRefDateAdd) then
      ipItemInRefDateAdd.Free;
    if Assigned(FipItemInRefDateEdit) then
      ipItemInRefDateEdit.Free;
    if Assigned(FipItemOutRefCountGen) then
      ipItemOutRefCountGen.Free;
    if Assigned(FipItemOutRefPrice) then
      ipItemOutRefPrice.Free;
    if Assigned(FipItemOutRefSumGen) then
      ipItemOutRefSumGen.Free;
    if Assigned(FipItemOutRefQuarter1count) then
      ipItemOutRefQuarter1count.Free;
    if Assigned(FipItemOutRefQuarter1sum) then
      ipItemOutRefQuarter1sum.Free;
    if Assigned(FipItemOutRefQuarter2count) then
      ipItemOutRefQuarter2count.Free;
    if Assigned(FipItemOutRefQuarter2sum) then
      ipItemOutRefQuarter2sum.Free;
    if Assigned(FipItemOutRefQuarter3count) then
      ipItemOutRefQuarter3count.Free;
    if Assigned(FipItemOutRefQuarter3sum) then
      ipItemOutRefQuarter3sum.Free;
    if Assigned(FipItemOutRefQuarter4count) then
      ipItemOutRefQuarter4count.Free;
    if Assigned(FipItemOutRefQuarter4sum) then
      ipItemOutRefQuarter4sum.Free;
    if Assigned(FipItemOutRefCountGenInside) then
      ipItemOutRefCountGenInside.Free;
    if Assigned(FipItemOutRefPriceInside) then
      ipItemOutRefPriceInside.Free;
    if Assigned(FipItemOutRefSumGenInside) then
      ipItemOutRefSumGenInside.Free;
    if Assigned(FipItemOutRefQuarter1countInside) then
      ipItemOutRefQuarter1countInside.Free;
    if Assigned(FipItemOutRefQuarter1sumInside) then
      ipItemOutRefQuarter1sumInside.Free;
    if Assigned(FipItemOutRefQuarter2countInside) then
      ipItemOutRefQuarter2countInside.Free;
    if Assigned(FipItemOutRefQuarter2sumInside) then
      ipItemOutRefQuarter2sumInside.Free;
    if Assigned(FipItemOutRefQuarter3countInside) then
      ipItemOutRefQuarter3countInside.Free;
    if Assigned(FipItemOutRefQuarter3sumInside) then
      ipItemOutRefQuarter3sumInside.Free;
    if Assigned(FipItemOutRefQuarter4countInside) then
      ipItemOutRefQuarter4countInside.Free;
    if Assigned(FipItemOutRefQuarter4sumInside) then
      ipItemOutRefQuarter4sumInside.Free;
    if Assigned(FipItemOutRefDateAdd) then
      ipItemOutRefDateAdd.Free;
    if Assigned(FipItemOutRefDateEdit) then
      ipItemOutRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENIPItem2ENIPItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIPItem2ENIPItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2ENIPItem');
  RemClassRegistry.RegisterXSClass(ENIPItem2ENIPItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2ENIPItemRef');
  RemClassRegistry.RegisterXSClass(ENIPItem2ENIPItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2ENIPItemFilter');
  RemClassRegistry.RegisterXSClass(ENIPItem2ENIPItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2ENIPItemShort');
  RemClassRegistry.RegisterXSClass(ENIPItem2ENIPItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2ENIPItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPItem2ENIPItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPItem2ENIPItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPItem2ENIPItemControllerSoapPort), 'http://ksoe.org/ENIPItem2ENIPItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPItem2ENIPItemControllerSoapPort), 'http://ksoe.org/ENIPItem2ENIPItemController/action/ENIPItem2ENIPItemController.%operationName%');


end.
