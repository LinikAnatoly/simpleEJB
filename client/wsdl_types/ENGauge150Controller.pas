unit ENGauge150Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENSubstation150Controller
   ,ENLine150Controller
   ,ENLine10Controller
   ,ENLineCableController
   ,ENSubst150CellController
   ,ENSubst150OwnTransController
   ,ENSubst150PowerTransController
   ,ENSituationRPNController
   ,ENEquipmentStateController
   ,ENVoltageClassController
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

  ENGauge150            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGauge150Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGauge150 = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FdateGauge : TXSDateTime;
    Ftension : TXSDecimal;
    Fcurrent : TXSDecimal;
    FconsOwnTrans : TXSDecimal;
    FisGenSwitchDev : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    Fsubstation150Ref : ENSubstation150Ref;
//???
    Fline150Ref : ENLine150Ref;
//???
    Fline10Ref : ENLine10Ref;
//???
    FcableRef : ENLineCableRef;
//???
    FcellRef : ENSubst150CellRef;
//???
    FownTransRef : ENSubst150OwnTransRef;
//???
    FpowerTransRef : ENSubst150PowerTransRef;
//???
    FsituationRPNRef : ENSituationRPNRef;
//???
    FequipStateRef : ENEquipmentStateRef;
//???
    FvoltageClassRef : ENVoltageClassRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property dateGauge : TXSDateTime read FdateGauge write FdateGauge;
    property tension : TXSDecimal read Ftension write Ftension;
    property current : TXSDecimal read Fcurrent write Fcurrent;
    property consOwnTrans : TXSDecimal read FconsOwnTrans write FconsOwnTrans;
    property  isGenSwitchDev : Integer read FisGenSwitchDev write FisGenSwitchDev;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property substation150Ref : ENSubstation150Ref read Fsubstation150Ref write Fsubstation150Ref;
    property line150Ref : ENLine150Ref read Fline150Ref write Fline150Ref;
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref;
    property cableRef : ENLineCableRef read FcableRef write FcableRef;
    property cellRef : ENSubst150CellRef read FcellRef write FcellRef;
    property ownTransRef : ENSubst150OwnTransRef read FownTransRef write FownTransRef;
    property powerTransRef : ENSubst150PowerTransRef read FpowerTransRef write FpowerTransRef;
    property situationRPNRef : ENSituationRPNRef read FsituationRPNRef write FsituationRPNRef;
    property equipStateRef : ENEquipmentStateRef read FequipStateRef write FequipStateRef;
    property voltageClassRef : ENVoltageClassRef read FvoltageClassRef write FvoltageClassRef;
  end;

{
  ENGauge150Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FdateGauge : DateTime;
    Ftension : TXSDecimal;
    Fcurrent : TXSDecimal;
    FconsOwnTrans : TXSDecimal;
    FisGenSwitchDev : Integer;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    Fsubstation150Ref : ENSubstation150Ref;
//???
    Fline150Ref : ENLine150Ref;
//???
    Fline10Ref : ENLine10Ref;
//???
    FcableRef : ENLineCableRef;
//???
    FcellRef : ENSubst150CellRef;
//???
    FownTransRef : ENSubst150OwnTransRef;
//???
    FpowerTransRef : ENSubst150PowerTransRef;
//???
    FsituationRPNRef : ENSituationRPNRef;
//???
    FequipStateRef : ENEquipmentStateRef;
//???
    FvoltageClassRef : ENVoltageClassRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property dateGauge : DateTime;
    property tension : TXSDecimal read Ftension write Ftension;
    property current : TXSDecimal read Fcurrent write Fcurrent;
    property consOwnTrans : TXSDecimal read FconsOwnTrans write FconsOwnTrans;
    property  isGenSwitchDev : Integer read FisGenSwitchDev write FisGenSwitchDev;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property substation150Ref : ENSubstation150Ref read Fsubstation150Ref write Fsubstation150Ref;
    property line150Ref : ENLine150Ref read Fline150Ref write Fline150Ref;
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref;
    property cableRef : ENLineCableRef read FcableRef write FcableRef;
    property cellRef : ENSubst150CellRef read FcellRef write FcellRef;
    property ownTransRef : ENSubst150OwnTransRef read FownTransRef write FownTransRef;
    property powerTransRef : ENSubst150PowerTransRef read FpowerTransRef write FpowerTransRef;
    property situationRPNRef : ENSituationRPNRef read FsituationRPNRef write FsituationRPNRef;
    property equipStateRef : ENEquipmentStateRef read FequipStateRef write FequipStateRef;
    property voltageClassRef : ENVoltageClassRef read FvoltageClassRef write FvoltageClassRef;
  end;
}

  ENGauge150Filter = class(ENGauge150)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENGauge150Short = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FdateGauge : TXSDateTime;
    Ftension : TXSDecimal;
    Fcurrent : TXSDecimal;
    FconsOwnTrans : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fsubstation150RefCode : Integer;
    Fsubstation150RefName : WideString;
    Fsubstation150RefProjectPower : TXSDecimal;
    Fsubstation150RefOperativeService : WideString;
    Fsubstation150RefRepairService : WideString;
    Fsubstation150RefBuhName : WideString;
    Fsubstation150RefInvNumber : WideString;
    Fsubstation150RefSizCode : Integer;
    Fsubstation150RefMolCode : WideString;
    Fsubstation150RefMolName : WideString;
    Fline150RefCode : Integer;
    Fline150RefInvNumber : WideString;
    Fline150RefName : WideString;
    Fline150RefBuhName : WideString;
    Fline150RefLineLength : TXSDecimal;
    Fline150RefYearBuild : Integer;
    Fline150RefYearWorkingStart : Integer;
    Fline150RefChainsLength : TXSDecimal;
    Fline150RefChains2Length : TXSDecimal;
    Fline150RefLastRepairDate : TXSDate;
    Fline150RefExtentForest : TXSDecimal;
    Fline10RefCode : Integer;
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer;
    Fline10RefYearWorkingStart : Integer;
    Fline10RefLastRepairDate : TXSDate;
    Fline10RefExtentForest : TXSDecimal;
    FcableRefCode : Integer;
    FcableRefInvNumber : WideString;
    FcableRefName : WideString;
    FcableRefBuhName : WideString;
    FcableRefLineLength : TXSDecimal;
    FcableRefYearBuild : Integer;
    FcableRefYearWorkingStart : Integer;
    FcableRefLastRepairDate : TXSDate;
    FcellRefCode : Integer;
    FcellRefName : WideString;
    FcellRefFactoryNumber : WideString;
    FcellRefCommentGen : WideString;
    FcellRefUserGen : WideString;
    FownTransRefCode : Integer;
    FownTransRefName : WideString;
    FownTransRefFactoryNumber : WideString;
    FownTransRefPower : TXSDecimal;
    FownTransRefCommentGen : WideString;
    FownTransRefUserGen : WideString;
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
    FsituationRPNRefCode : Integer;
    FsituationRPNRefValue : Integer;
    FsituationRPNRefDescription : WideString;
    FequipStateRefCode : Integer;
    FequipStateRefName : WideString;
    FvoltageClassRefCode : Integer;
    FvoltageClassRefValue : TXSDecimal;
    FvoltageClassRefDescription : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property dateGauge : TXSDateTime read FdateGauge write FdateGauge;
    property tension : TXSDecimal read Ftension write Ftension;
    property current : TXSDecimal read Fcurrent write Fcurrent;
    property consOwnTrans : TXSDecimal read FconsOwnTrans write FconsOwnTrans;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property substation150RefCode : Integer read Fsubstation150RefCode write Fsubstation150RefCode;
    property substation150RefName : WideString read Fsubstation150RefName write Fsubstation150RefName;
    property substation150RefProjectPower : TXSDecimal read Fsubstation150RefProjectPower write Fsubstation150RefProjectPower;
    property substation150RefOperativeService : WideString read Fsubstation150RefOperativeService write Fsubstation150RefOperativeService;
    property substation150RefRepairService : WideString read Fsubstation150RefRepairService write Fsubstation150RefRepairService;
    property substation150RefBuhName : WideString read Fsubstation150RefBuhName write Fsubstation150RefBuhName;
    property substation150RefInvNumber : WideString read Fsubstation150RefInvNumber write Fsubstation150RefInvNumber;
    property substation150RefSizCode : Integer read Fsubstation150RefSizCode write Fsubstation150RefSizCode;
    property substation150RefMolCode : WideString read Fsubstation150RefMolCode write Fsubstation150RefMolCode;
    property substation150RefMolName : WideString read Fsubstation150RefMolName write Fsubstation150RefMolName;
    property line150RefCode : Integer read Fline150RefCode write Fline150RefCode;
    property line150RefInvNumber : WideString read Fline150RefInvNumber write Fline150RefInvNumber;
    property line150RefName : WideString read Fline150RefName write Fline150RefName;
    property line150RefBuhName : WideString read Fline150RefBuhName write Fline150RefBuhName;
    property line150RefLineLength : TXSDecimal read Fline150RefLineLength write Fline150RefLineLength;
    property line150RefYearBuild : Integer read Fline150RefYearBuild write Fline150RefYearBuild;
    property line150RefYearWorkingStart : Integer read Fline150RefYearWorkingStart write Fline150RefYearWorkingStart;
    property line150RefChainsLength : TXSDecimal read Fline150RefChainsLength write Fline150RefChainsLength;
    property line150RefChains2Length : TXSDecimal read Fline150RefChains2Length write Fline150RefChains2Length;
    property line150RefLastRepairDate : TXSDate read Fline150RefLastRepairDate write Fline150RefLastRepairDate;
    property line150RefExtentForest : TXSDecimal read Fline150RefExtentForest write Fline150RefExtentForest;
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode;
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber;
    property line10RefName : WideString read Fline10RefName write Fline10RefName;
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName;
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength;
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild;
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart;
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate;
    property line10RefExtentForest : TXSDecimal read Fline10RefExtentForest write Fline10RefExtentForest;
    property cableRefCode : Integer read FcableRefCode write FcableRefCode;
    property cableRefInvNumber : WideString read FcableRefInvNumber write FcableRefInvNumber;
    property cableRefName : WideString read FcableRefName write FcableRefName;
    property cableRefBuhName : WideString read FcableRefBuhName write FcableRefBuhName;
    property cableRefLineLength : TXSDecimal read FcableRefLineLength write FcableRefLineLength;
    property cableRefYearBuild : Integer read FcableRefYearBuild write FcableRefYearBuild;
    property cableRefYearWorkingStart : Integer read FcableRefYearWorkingStart write FcableRefYearWorkingStart;
    property cableRefLastRepairDate : TXSDate read FcableRefLastRepairDate write FcableRefLastRepairDate;
    property cellRefCode : Integer read FcellRefCode write FcellRefCode;
    property cellRefName : WideString read FcellRefName write FcellRefName;
    property cellRefFactoryNumber : WideString read FcellRefFactoryNumber write FcellRefFactoryNumber;
    property cellRefCommentGen : WideString read FcellRefCommentGen write FcellRefCommentGen;
    property cellRefUserGen : WideString read FcellRefUserGen write FcellRefUserGen;
    property ownTransRefCode : Integer read FownTransRefCode write FownTransRefCode;
    property ownTransRefName : WideString read FownTransRefName write FownTransRefName;
    property ownTransRefFactoryNumber : WideString read FownTransRefFactoryNumber write FownTransRefFactoryNumber;
    property ownTransRefPower : TXSDecimal read FownTransRefPower write FownTransRefPower;
    property ownTransRefCommentGen : WideString read FownTransRefCommentGen write FownTransRefCommentGen;
    property ownTransRefUserGen : WideString read FownTransRefUserGen write FownTransRefUserGen;
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
    property situationRPNRefCode : Integer read FsituationRPNRefCode write FsituationRPNRefCode;
    property situationRPNRefValue : Integer read FsituationRPNRefValue write FsituationRPNRefValue;
    property situationRPNRefDescription : WideString read FsituationRPNRefDescription write FsituationRPNRefDescription;
    property equipStateRefCode : Integer read FequipStateRefCode write FequipStateRefCode;
    property equipStateRefName : WideString read FequipStateRefName write FequipStateRefName;
    property voltageClassRefCode : Integer read FvoltageClassRefCode write FvoltageClassRefCode;
    property voltageClassRefValue : TXSDecimal read FvoltageClassRefValue write FvoltageClassRefValue;
    property voltageClassRefDescription : WideString read FvoltageClassRefDescription write FvoltageClassRefDescription;
  end;

  ArrayOfENGauge150Short = array of ENGauge150Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENGauge150ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENGauge150Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENGauge150Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENGauge150Controller/message/
  // soapAction: http://ksoe.org/ENGauge150Controller/action/ENGauge150Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENGauge150ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENGauge150Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENGauge150ControllerSoapPort = interface(IInvokable)
  ['{CFF09639-059F-4EBB-AB5D-B00337B47BD2}']
    function add(const aENGauge150: ENGauge150): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENGauge150: ENGauge150); stdcall;
    function getObject(const anObjectCode: Integer): ENGauge150; stdcall;
    function getList: ENGauge150ShortList; stdcall;
    function getFilteredList(const aENGauge150Filter: ENGauge150Filter): ENGauge150ShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENGauge150ShortList; stdcall;
    function getScrollableFilteredList(const aENGauge150Filter: ENGauge150Filter; const aFromPosition: Integer; const aQuantity: Integer): ENGauge150ShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENGauge150ShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENGauge150Filter: ENGauge150Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENGauge150Short; stdcall;
  end;


implementation

  destructor ENGauge150.Destroy;
  begin
    if Assigned(FdateGauge) then
      dateGauge.Free;
    if Assigned(Ftension) then
      tension.Free;
    if Assigned(Fcurrent) then
      current.Free;
    if Assigned(FconsOwnTrans) then
      consOwnTrans.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fsubstation150Ref) then
      substation150Ref.Free;
    if Assigned(Fline150Ref) then
      line150Ref.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FcableRef) then
      cableRef.Free;
    if Assigned(FcellRef) then
      cellRef.Free;
    if Assigned(FownTransRef) then
      ownTransRef.Free;
    if Assigned(FpowerTransRef) then
      powerTransRef.Free;
    if Assigned(FsituationRPNRef) then
      situationRPNRef.Free;
    if Assigned(FequipStateRef) then
      equipStateRef.Free;
    if Assigned(FvoltageClassRef) then
      voltageClassRef.Free;
    inherited Destroy;
  end;

{
  destructor ENGauge150Filter.Destroy;
  begin
    if Assigned(FdateGauge) then
      dateGauge.Free;
    if Assigned(Ftension) then
      tension.Free;
    if Assigned(Fcurrent) then
      current.Free;
    if Assigned(FconsOwnTrans) then
      consOwnTrans.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fsubstation150Ref) then
      substation150Ref.Free;
    if Assigned(Fline150Ref) then
      line150Ref.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FcableRef) then
      cableRef.Free;
    if Assigned(FcellRef) then
      cellRef.Free;
    if Assigned(FownTransRef) then
      ownTransRef.Free;
    if Assigned(FpowerTransRef) then
      powerTransRef.Free;
    if Assigned(FsituationRPNRef) then
      situationRPNRef.Free;
    if Assigned(FequipStateRef) then
      equipStateRef.Free;
    if Assigned(FvoltageClassRef) then
      voltageClassRef.Free;
    inherited Destroy;
  end;
}

  destructor ENGauge150Filter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENGauge150Short.Destroy;
  begin
    if Assigned(FdateGauge) then
      dateGauge.Free;
    if Assigned(Ftension) then
      tension.Free;
    if Assigned(Fcurrent) then
      current.Free;
    if Assigned(FconsOwnTrans) then
      consOwnTrans.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fsubstation150RefProjectPower) then
      substation150RefProjectPower.Free;
    if Assigned(Fline150RefLineLength) then
      line150RefLineLength.Free;
    if Assigned(Fline150RefChainsLength) then
      line150RefChainsLength.Free;
    if Assigned(Fline150RefChains2Length) then
      line150RefChains2Length.Free;
    if Assigned(Fline150RefLastRepairDate) then
      line150RefLastRepairDate.Free;
    if Assigned(Fline150RefExtentForest) then
      line150RefExtentForest.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(Fline10RefExtentForest) then
      line10RefExtentForest.Free;
    if Assigned(FcableRefLineLength) then
      cableRefLineLength.Free;
    if Assigned(FcableRefLastRepairDate) then
      cableRefLastRepairDate.Free;
    if Assigned(FownTransRefPower) then
      ownTransRefPower.Free;
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
    if Assigned(FvoltageClassRefValue) then
      voltageClassRefValue.Free;
    inherited Destroy;
  end;

  destructor ENGauge150ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENGauge150, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGauge150');
  RemClassRegistry.RegisterXSClass(ENGauge150Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGauge150Ref');
  RemClassRegistry.RegisterXSClass(ENGauge150Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGauge150Filter');
  RemClassRegistry.RegisterXSClass(ENGauge150Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGauge150Short');
  RemClassRegistry.RegisterXSClass(ENGauge150ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGauge150ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENGauge150Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENGauge150Short');

  InvRegistry.RegisterInterface(TypeInfo(ENGauge150ControllerSoapPort), 'http://ksoe.org/ENGauge150Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENGauge150ControllerSoapPort), 'http://ksoe.org/ENGauge150Controller/action/ENGauge150Controller.%operationName%');


end.
