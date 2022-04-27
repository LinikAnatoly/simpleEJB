unit ENSubst2PowTransController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENSubst150PowerTransController
   ,ENSubstation150Controller
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

  ENSubst2PowTrans            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst2PowTransRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst2PowTrans = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FisVirt : Integer;
//???
    FpowerTransRef : ENSubst150PowerTransRef;
//???
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  isVirt : Integer read FisVirt write FisVirt;
    property powerTransRef : ENSubst150PowerTransRef read FpowerTransRef write FpowerTransRef;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
  end;

{
  ENSubst2PowTransFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FisVirt : Integer;
//???
    FpowerTransRef : ENSubst150PowerTransRef;
//???
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  isVirt : Integer read FisVirt write FisVirt;
    property powerTransRef : ENSubst150PowerTransRef read FpowerTransRef write FpowerTransRef;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
  end;
}

  ENSubst2PowTransFilter = class(ENSubst2PowTrans)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst2PowTransShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FpowerTransRefCode : Integer;
    FpowerTransRefName : WideString;
    FpowerTransRefFactoryNumber : WideString;
    FpowerTransRefVoltageVN : TXSDecimal;
    FpowerTransRefVoltageSN : TXSDecimal;
    FpowerTransRefVoltageNN : TXSDecimal;
    FpowerTransRefCurrentVN : TXSDecimal;
    FpowerTransRefCurrentSN : TXSDecimal;
    FpowerTransRefCurrentNN : TXSDecimal;
    FpowerTransRefPowerVN : TXSDecimal;
    FpowerTransRefPowerSN : TXSDecimal;
    FpowerTransRefPowerNN : TXSDecimal;
    FpowerTransRefCommentGen : WideString;
    FpowerTransRefUserGen : WideString;
    FsubstationRefCode : Integer;
    FsubstationRefName : WideString;
    FsubstationRefProjectPower : TXSDecimal;
    FsubstationRefOperativeService : WideString;
    FsubstationRefRepairService : WideString;
    FsubstationRefBuhName : WideString;
    FsubstationRefInvNumber : WideString;
    FsubstationRefSizCode : Integer;
    FsubstationRefMolCode : WideString;
    FsubstationRefMolName : WideString;
    FsubstationRefConventUnit : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

    property powerTransRefCode : Integer read FpowerTransRefCode write FpowerTransRefCode;
    property powerTransRefName : WideString read FpowerTransRefName write FpowerTransRefName;
    property powerTransRefFactoryNumber : WideString read FpowerTransRefFactoryNumber write FpowerTransRefFactoryNumber;
    property powerTransRefVoltageVN : TXSDecimal read FpowerTransRefVoltageVN write FpowerTransRefVoltageVN;
    property powerTransRefVoltageSN : TXSDecimal read FpowerTransRefVoltageSN write FpowerTransRefVoltageSN;
    property powerTransRefVoltageNN : TXSDecimal read FpowerTransRefVoltageNN write FpowerTransRefVoltageNN;
    property powerTransRefCurrentVN : TXSDecimal read FpowerTransRefCurrentVN write FpowerTransRefCurrentVN;
    property powerTransRefCurrentSN : TXSDecimal read FpowerTransRefCurrentSN write FpowerTransRefCurrentSN;
    property powerTransRefCurrentNN : TXSDecimal read FpowerTransRefCurrentNN write FpowerTransRefCurrentNN;
    property powerTransRefPowerVN : TXSDecimal read FpowerTransRefPowerVN write FpowerTransRefPowerVN;
    property powerTransRefPowerSN : TXSDecimal read FpowerTransRefPowerSN write FpowerTransRefPowerSN;
    property powerTransRefPowerNN : TXSDecimal read FpowerTransRefPowerNN write FpowerTransRefPowerNN;
    property powerTransRefCommentGen : WideString read FpowerTransRefCommentGen write FpowerTransRefCommentGen;
    property powerTransRefUserGen : WideString read FpowerTransRefUserGen write FpowerTransRefUserGen;
    property substationRefCode : Integer read FsubstationRefCode write FsubstationRefCode;
    property substationRefName : WideString read FsubstationRefName write FsubstationRefName;
    property substationRefProjectPower : TXSDecimal read FsubstationRefProjectPower write FsubstationRefProjectPower;
    property substationRefOperativeService : WideString read FsubstationRefOperativeService write FsubstationRefOperativeService;
    property substationRefRepairService : WideString read FsubstationRefRepairService write FsubstationRefRepairService;
    property substationRefBuhName : WideString read FsubstationRefBuhName write FsubstationRefBuhName;
    property substationRefInvNumber : WideString read FsubstationRefInvNumber write FsubstationRefInvNumber;
    property substationRefSizCode : Integer read FsubstationRefSizCode write FsubstationRefSizCode;
    property substationRefMolCode : WideString read FsubstationRefMolCode write FsubstationRefMolCode;
    property substationRefMolName : WideString read FsubstationRefMolName write FsubstationRefMolName;
    property substationRefConventUnit : TXSDecimal read FsubstationRefConventUnit write FsubstationRefConventUnit;
  end;

  ArrayOfENSubst2PowTransShort = array of ENSubst2PowTransShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst2PowTransShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst2PowTransShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst2PowTransShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst2PowTransController/message/
  // soapAction: http://ksoe.org/ENSubst2PowTransController/action/ENSubst2PowTransController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst2PowTransControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst2PowTransController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst2PowTransControllerSoapPort = interface(IInvokable)
  ['{919CBAE4-E1BF-44EA-99D9-3B373BD23BF5}']
    function add(const aENSubst2PowTrans: ENSubst2PowTrans): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst2PowTrans: ENSubst2PowTrans); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst2PowTrans; stdcall;
    function getList: ENSubst2PowTransShortList; stdcall;
    function getFilteredList(const aENSubst2PowTransFilter: ENSubst2PowTransFilter): ENSubst2PowTransShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst2PowTransShortList; stdcall;
    function getScrollableFilteredList(const aENSubst2PowTransFilter: ENSubst2PowTransFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst2PowTransShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst2PowTransShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst2PowTransFilter: ENSubst2PowTransFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst2PowTransShort; stdcall;
  end;


implementation

  destructor ENSubst2PowTrans.Destroy;
  begin
    if Assigned(FpowerTransRef) then
      powerTransRef.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSubst2PowTransFilter.Destroy;
  begin
    if Assigned(FpowerTransRef) then
      powerTransRef.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSubst2PowTransFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst2PowTransShort.Destroy;
  begin
    if Assigned(FpowerTransRefVoltageVN) then
      powerTransRefVoltageVN.Free;
    if Assigned(FpowerTransRefVoltageSN) then
      powerTransRefVoltageSN.Free;
    if Assigned(FpowerTransRefVoltageNN) then
      powerTransRefVoltageNN.Free;
    if Assigned(FpowerTransRefCurrentVN) then
      powerTransRefCurrentVN.Free;
    if Assigned(FpowerTransRefCurrentSN) then
      powerTransRefCurrentSN.Free;
    if Assigned(FpowerTransRefCurrentNN) then
      powerTransRefCurrentNN.Free;
    if Assigned(FpowerTransRefPowerVN) then
      powerTransRefPowerVN.Free;
    if Assigned(FpowerTransRefPowerSN) then
      powerTransRefPowerSN.Free;
    if Assigned(FpowerTransRefPowerNN) then
      powerTransRefPowerNN.Free;
    if Assigned(FsubstationRefProjectPower) then
      substationRefProjectPower.Free;
    if Assigned(FsubstationRefConventUnit) then
      substationRefConventUnit.Free;
    inherited Destroy;
  end;

  destructor ENSubst2PowTransShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst2PowTrans, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst2PowTrans');
  RemClassRegistry.RegisterXSClass(ENSubst2PowTransRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst2PowTransRef');
  RemClassRegistry.RegisterXSClass(ENSubst2PowTransFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst2PowTransFilter');
  RemClassRegistry.RegisterXSClass(ENSubst2PowTransShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst2PowTransShort');
  RemClassRegistry.RegisterXSClass(ENSubst2PowTransShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst2PowTransShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst2PowTransShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst2PowTransShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst2PowTransControllerSoapPort), 'http://ksoe.org/ENSubst2PowTransController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst2PowTransControllerSoapPort), 'http://ksoe.org/ENSubst2PowTransController/action/ENSubst2PowTransController.%operationName%');


end.
