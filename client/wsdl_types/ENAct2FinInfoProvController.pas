unit ENAct2FinInfoProvController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActController
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

  ENAct2FinInfoProv            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2FinInfoProvRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2FinInfoProv = class(TRemotable)
  private
    Fcode : Integer;
    Fkau_card_object_id : Integer;
    Fkau_card_object_kod : WideString;
    Fkau_card_object_name : WideString;
    Fkau_element_expenses_id : Integer;
    Fkau_element_expenses_kod : WideString;
    Fkau_element_expenses_name : WideString;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property kau_card_object_id : Integer read Fkau_card_object_id write Fkau_card_object_id;
    property kau_card_object_kod : WideString read Fkau_card_object_kod write Fkau_card_object_kod;
    property kau_card_object_name : WideString read Fkau_card_object_name write Fkau_card_object_name;
    property kau_element_expenses_id : Integer read Fkau_element_expenses_id write Fkau_element_expenses_id;
    property kau_element_expenses_kod : WideString read Fkau_element_expenses_kod write Fkau_element_expenses_kod;
    property kau_element_expenses_name : WideString read Fkau_element_expenses_name write Fkau_element_expenses_name;
    property actRef : ENActRef read FactRef write FactRef;
  end;

{
  ENAct2FinInfoProvFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fkau_card_object_id : Integer;
    Fkau_card_object_kod : WideString;
    Fkau_card_object_name : WideString;
    Fkau_element_expenses_id : Integer;
    Fkau_element_expenses_kod : WideString;
    Fkau_element_expenses_name : WideString;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property kau_card_object_id : Integer read Fkau_card_object_id write Fkau_card_object_id;
    property kau_card_object_kod : WideString read Fkau_card_object_kod write Fkau_card_object_kod;
    property kau_card_object_name : WideString read Fkau_card_object_name write Fkau_card_object_name;
    property kau_element_expenses_id : Integer read Fkau_element_expenses_id write Fkau_element_expenses_id;
    property kau_element_expenses_kod : WideString read Fkau_element_expenses_kod write Fkau_element_expenses_kod;
    property kau_element_expenses_name : WideString read Fkau_element_expenses_name write Fkau_element_expenses_name;
    property actRef : ENActRef read FactRef write FactRef;
  end;
}

  ENAct2FinInfoProvFilter = class(ENAct2FinInfoProv)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAct2FinInfoProvShort = class(TRemotable)
  private
    Fcode : Integer;
    Fkau_card_object_id : Integer;
    Fkau_card_object_kod : WideString;
    Fkau_card_object_name : WideString;
    Fkau_element_expenses_id : Integer;
    Fkau_element_expenses_kod : WideString;
    Fkau_element_expenses_name : WideString;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinMolCode : WideString;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
    FactRefMolCodeObject : WideString;
    FactRefCheckedByAccountant : TXSBoolean;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  kau_card_object_id : Integer read Fkau_card_object_id write Fkau_card_object_id;
    property kau_card_object_kod : WideString read Fkau_card_object_kod write Fkau_card_object_kod;
    property kau_card_object_name : WideString read Fkau_card_object_name write Fkau_card_object_name;
    property  kau_element_expenses_id : Integer read Fkau_element_expenses_id write Fkau_element_expenses_id;
    property kau_element_expenses_kod : WideString read Fkau_element_expenses_kod write Fkau_element_expenses_kod;
    property kau_element_expenses_name : WideString read Fkau_element_expenses_name write Fkau_element_expenses_name;

    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinMolCode : WideString read FactRefFinMolCode write FactRefFinMolCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
    property actRefMolCodeObject : WideString read FactRefMolCodeObject write FactRefMolCodeObject;
    property actRefCheckedByAccountant : TXSBoolean read FactRefCheckedByAccountant write FactRefCheckedByAccountant;
  end;

  ArrayOfENAct2FinInfoProvShort = array of ENAct2FinInfoProvShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2FinInfoProvShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2FinInfoProvShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2FinInfoProvShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2FinInfoProvController/message/
  // soapAction: http://ksoe.org/ENAct2FinInfoProvController/action/ENAct2FinInfoProvController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2FinInfoProvControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2FinInfoProvController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2FinInfoProvControllerSoapPort = interface(IInvokable)
  ['{FBDFEEB6-021C-4514-B8CD-24DFFD455943}']
    function add(const aENAct2FinInfoProv: ENAct2FinInfoProv): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2FinInfoProv: ENAct2FinInfoProv); stdcall;
    function getObject(const anObjectCode: Integer): ENAct2FinInfoProv; stdcall;
    function getList: ENAct2FinInfoProvShortList; stdcall;
    function getFilteredList(const aENAct2FinInfoProvFilter: ENAct2FinInfoProvFilter): ENAct2FinInfoProvShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2FinInfoProvShortList; stdcall;
    function getScrollableFilteredList(const aENAct2FinInfoProvFilter: ENAct2FinInfoProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2FinInfoProvShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2FinInfoProvShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAct2FinInfoProvFilter: ENAct2FinInfoProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAct2FinInfoProvShort; stdcall;
  end;


implementation

  destructor ENAct2FinInfoProv.Destroy;
  begin
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{
  destructor ENAct2FinInfoProvFilter.Destroy;
  begin
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;
}

  destructor ENAct2FinInfoProvFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENAct2FinInfoProvShort.Destroy;
  begin
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENAct2FinInfoProvShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2FinInfoProv, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinInfoProv');
  RemClassRegistry.RegisterXSClass(ENAct2FinInfoProvRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinInfoProvRef');
  RemClassRegistry.RegisterXSClass(ENAct2FinInfoProvFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinInfoProvFilter');
  RemClassRegistry.RegisterXSClass(ENAct2FinInfoProvShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinInfoProvShort');
  RemClassRegistry.RegisterXSClass(ENAct2FinInfoProvShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinInfoProvShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2FinInfoProvShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2FinInfoProvShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2FinInfoProvControllerSoapPort), 'http://ksoe.org/ENAct2FinInfoProvController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2FinInfoProvControllerSoapPort), 'http://ksoe.org/ENAct2FinInfoProvController/action/ENAct2FinInfoProvController.%operationName%');


end.
